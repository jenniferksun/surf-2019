#!/usr/bin/env python

# Position controller

import rospy
from std_msgs.msg import Bool, String, Float64, Float32, Int32
from custom_msgs.msg import Thrusters8
import serial
import sys
import pid as p
import trajectory as traj
from numpy.linalg import inv, pinv
import numpy as np
import math
import time
from math import cos, sin, pi
from nav_msgs.msg import Odometry
from geometry_msgs.msg import TransformStamped, PoseStamped
from sensor_msgs.msg import Imu, MagneticField
import csv

sc = {
        'yaw_angle': 0,
        'pos_I': np.array([0, 0]), #[m, m]
        'vel_I':np.array([0, 0]),
        'angular_velocity_z':0,
        'start_controller': False,
        'distance_docking_ports': 0.27345, # [m]
        'pos_I_target': np.array([-0.047, -0.2124]), # [m, m]
        'pos_I_setpt_x': 0, # [m]
        'pos_I_setpt_y': 0, # [m]
        'vel_I_setpt_x': 0, # [m]
        'vel_I_setpt_y': 0, # [m]
        'heading_I_setpt': 0, # [m, m]
        'max_force_thruster': 0.4, # [N]
        'MIB': 20, # [ms]
    }

def Rotation_inertial_to_body(a):
    return np.array([[cos(a), -sin(a)],
                     [sin(a), cos(a)]])

def get_force_in_body_frame(u_x_inertial, u_y_inertial, a_deg):
    a = math.radians(a_deg)
    multiplication = np.dot(inv(Rotation_inertial_to_body(a)),
                    np.array([u_x_inertial, u_y_inertial]).transpose())
    return multiplication[0], multiplication[1]


def s_to_ms(x):
    return x*1000

def limit_circular_value(input_value, min_value, max_value):
    if (input_value > max_value):
        return input_value - max_value + min_value
    if (input_value < min_value):
        return input_value + max_value - min_value
    return input_value


def get_position_and_yaw_angle_cb(msg):
    sc['pos_I'] = np.array([msg.transform.translation.x, msg.transform.translation.y])
    x = msg.transform.rotation.x
    y = msg.transform.rotation.y
    z = msg.transform.rotation.z
    w = msg.transform.rotation.w
    t1 = 2.0 * (w * z + x * y)
    t2 = 1.0 - 2.0 * (y * y + z * z)
    sc['yaw_angle'] = math.degrees(math.atan2(t1, t2))

def get_angular_velocity(msg):
    # sc['angular_velocity_z'] = -msg.angular_velocity.z    #Imu topic
    # print msg
    sc['angular_velocity_z'] = -msg.twist.twist.angular.z               #sc_pose topic

def setup_pid(control_rate, kp, ki, kd):
    pid = p.pid()
    pid.pid_set_frequency(control_rate)
    # pid_pos_x.set_derivative_term_low_pass_frequency(control_rate/2)
    pid.pid_set_gains(kp, ki, kd)
    return pid


def get_velocity(x1, x2, dt):
    return (x2 - x1)/dt

def get_slope(x1, x2, y1, y2):
    return (y2 - y1)/(x2 - x1)

def allocate_impulse_to_pair_of_counteracting_thrusters(desired_impulse, minimum_impulse):
    """ This function allocates a desired impulse to a set of two counteracting thruster
    in such a way that each thruster has either 0 or more than its minimum impulse
    """
    def positive_thruster(desired_impulse):
        if desired_impulse < -minimum_impulse:
            thruster_impulse = 0
        elif desired_impulse < 0:
            thruster_impulse = minimum_impulse
        elif desired_impulse < minimum_impulse:
            thruster_impulse = desired_impulse + minimum_impulse
        else:
            thruster_impulse = desired_impulse

        return thruster_impulse

    return positive_thruster(desired_impulse), positive_thruster(-desired_impulse)

def thruster_impulse_for_angular_impulse(angular_impulse):
    """ Computes the individual thruster impulses for a set of 4 thrusters
        (2 generating positive and 2 generating negative moment)
    """
    moment_arm = 0.2
    minimum_impulse = 0.005
    minimum_impulse = 0

    # desired impulse per each of the 2 active thrusters (sign is according to the sign of the anglar impulse)
    desired_impulse = angular_impulse/2/moment_arm
    positive_moment_thruster_impulse, negative_moment_thruster_impulse = allocate_impulse_to_pair_of_counteracting_thrusters(desired_impulse, minimum_impulse)
    return positive_moment_thruster_impulse, negative_moment_thruster_impulse

def thruster_impulse_for_linear_impulse(angular_impulse):
    """ Computes the individual thruster impulses for a set of 4 thrusters
        (2 generating positive and 2 generating negative moment)
    """
    minimum_impulse = 0.005
    minimum_impulse = 0

    # desired impulse per each of the 2 active thrusters (sign is according to the sign of the anglar impulse)
    desired_impulse = angular_impulse/2
    positive_moment_thruster_impulse, negative_moment_thruster_impulse = allocate_impulse_to_pair_of_counteracting_thrusters(desired_impulse, minimum_impulse)
    return positive_moment_thruster_impulse, negative_moment_thruster_impulse


# For one thruster, impulse in Ns, fire_time in ms
def fire_time_for_impulse(impulse):
    minimum_impulse = 0.005
    minimum_impulse = 0

    minimum_impulse_fire_time = 10
    minimum_impulse_fire_time = 0

    if (impulse < minimum_impulse):
        return 0
    impulse_per_ms = get_slope(minimum_impulse_fire_time, 80, minimum_impulse, 0.025)
    fire_time_ms = minimum_impulse_fire_time + (impulse - minimum_impulse)/impulse_per_ms
    return fire_time_ms

def thruster_time_for_angular_impulse(angular_impulse):
    positive_thrusters, negative_thrusters = thruster_impulse_for_angular_impulse(angular_impulse)
    thrusters = {}
    thrusters['FXpMZp'] = fire_time_for_impulse(positive_thrusters)
    thrusters['FXmMZp'] = fire_time_for_impulse(positive_thrusters)
    thrusters['FXpMZm'] = fire_time_for_impulse(negative_thrusters)
    thrusters['FXmMZm'] = fire_time_for_impulse(negative_thrusters)
    return thrusters


def thruster_time_for_linear_impulse(linear_impulse, direction='X'):
    positive_thrusters, negative_thrusters = thruster_impulse_for_linear_impulse(linear_impulse)
    thrusters = {}
    thrusters['F{}pMZp'.format(direction)] = fire_time_for_impulse(positive_thrusters)
    thrusters['F{}pMZm'.format(direction)] = fire_time_for_impulse(positive_thrusters)
    thrusters['F{}mMZp'.format(direction)] = fire_time_for_impulse(negative_thrusters)
    thrusters['F{}mMZm'.format(direction)] = fire_time_for_impulse(negative_thrusters)
    return thrusters

def limit_thruster_times(thrusters, time_limit_ms):
    return {th_name: min(th_time_ms, time_limit_ms) for th_name, th_time_ms in thrusters.items()}


def nonlinear_function_less_precise(forces, control_rate):
    slope = get_slope(0, s_to_ms(1/control_rate), 0, sc['max_force_thruster'])
    intercept = 0
    th = np.zeros(8)
    for i in range(len(forces)):
        if (forces[i] > sc['max_force_thruster']):
            th[i] = s_to_ms(1/control_rate)
        else:
            if (forces[i] < intercept):
                th[i] = 0
            else:
                th[i] = (forces[i] - intercept)/slope
    return th


# 20 ms is taken as the minimum impulse bit and the entire function is shifted with the MIB
# to accomodate for very precise firings
def nonlinear_function(forces, control_rate):
    slope = get_slope(sc['MIB'], s_to_ms(1/control_rate), 0, sc['max_force_thruster'])
    intercept = - sc['MIB'] * slope
    th = np.zeros(8)
    for i in range(len(forces)):
        if (forces[i] > sc['max_force_thruster']):
            th[i] = s_to_ms(1/control_rate)
        else:
            if (forces[i] < intercept):
                th[i] = 0
            else:
                th[i] = (forces[i] - intercept)/slope
    return th


# FXpMZp
# FXpMZm
# FXmMZp
# FXmMZm
# FYpMZp
# FYpMZm
# FYmMZp
# FYmMZm

def allocate_thruster_times(force_x_body, force_y_body, moment_z_body, control_rate):
    allocation_matrix = np.array([[1, 1, -1, -1, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 1, 1, -1, -1],
                                   [1, -1, 1, -1, 1, -1, 1, -1]])
    force_moments_thrusters_body = pinv(allocation_matrix)*np.array([force_x_body, force_y_body, moment_z_body])
    force_concat = np.concatenate([force_moments_thrusters_body[0:4, 0], force_moments_thrusters_body[4:8, 1]], axis=0)
    moment_z = force_moments_thrusters_body[0:8, 2]
    impulse_thrusters_force = nonlinear_function(force_concat, control_rate)
    impulse_thrusters_moment = nonlinear_function_less_precise(moment_z, control_rate)

    return impulse_thrusters_force, impulse_thrusters_moment


def get_setpoint_x(msg):
    sc['pos_I_setpt_x'] = msg.data

def get_setpoint_y(msg):
    sc['pos_I_setpt_y'] = msg.data

def get_vel_setpoint_x(msg):
    sc['vel_I_setpt_x'] = msg.data

def get_vel_setpoint_y(msg):
    sc['vel_I_setpt_y'] = msg.data

def get_heading_setpoint(msg):
    sc['heading_I_setpt'] = msg.data

# gripper_status_sc2 = False
# gripper_status_sc5 = False
# gripper_status_sc1 = False
# def get_gripper_cb_sc1(msg):
#     global gripper_status_sc1
#     gripper_status_sc1 = msg.data

# def get_gripper_cb_sc5(msg):
#     global gripper_status_sc5
#     gripper_status_sc5 = msg.data

# def get_gripper_cb_sc2(msg):
#     global gripper_status_sc2
#     gripper_status_sc2 = msg.data

if __name__ == '__main__':
    rospy.init_node('docking_controller', anonymous=True, log_level=rospy.DEBUG)
    control_rate = 2.0 # Hz

    # 2.5 and 7
    pid_pos_x = setup_pid(control_rate, 1, 0, 2.5)
    pid_pos_y = setup_pid(control_rate, 1, 0, 2.5)
    pid_vel_x = setup_pid(control_rate, 10, 0, 0)
    pid_vel_y = setup_pid(control_rate, 10, 0, 0)
    pid_heading = setup_pid(control_rate, 0.01, 0, 0.02)
    pid_angular_velocity = setup_pid(control_rate, 1, 0, 0)


    pub_thrusters = rospy.Publisher(sys.argv[1] + '/thruster_msg/', Thrusters8, queue_size=10)

    ### Data to publish for debuggin
    pub_x = rospy.Publisher(sys.argv[1] + "_short" +'/x', Float32, queue_size=10)
    pub_y = rospy.Publisher(sys.argv[1] + "_short" + '/y', Float32, queue_size=10)

    pub_actual_velocity_x = rospy.Publisher(sys.argv[1] + "_short" + '/actual_velocity_x', Float32, queue_size=10)
    pub_actual_velocity_y = rospy.Publisher(sys.argv[1] + "_short" + '/actual_velocity_y', Float32, queue_size=10)

    pub_heading_current = rospy.Publisher(sys.argv[1] + "_short" + '/heading_current', Float32, queue_size=10)
    pub_heading_setpoint = rospy.Publisher(sys.argv[1] + "_short" + '/heading_setpoint_verify', Float32, queue_size=10)

    pub_angular_velocity = rospy.Publisher(sys.argv[1] + "_short" + '/angular_velocity_setpoint', Float32, queue_size=10)

    pub_error_x = rospy.Publisher(sys.argv[1] + "_short" + '/error_x', Float32, queue_size=10)
    pub_error_y = rospy.Publisher(sys.argv[1] + "_short" + '/error_y', Float32, queue_size=10)


    pub_error_vx = rospy.Publisher(sys.argv[1] + "_short" + '/error_vx', Float32, queue_size=10)
    pub_error_vy = rospy.Publisher(sys.argv[1] + "_short" + '/error_vy', Float32, queue_size=10)
    trigger_pub = rospy.Publisher(sys.argv[1] + '_trigger/', Int32, queue_size=10)


    rospy.Subscriber("vicon/" + sys.argv[1] + "/" + sys.argv[1] + "/", TransformStamped, get_position_and_yaw_angle_cb)
    rospy.Subscriber(sys.argv[1] + "_pose", Odometry, get_angular_velocity)
    # rospy.Subscriber(sys.argv[1] + "/Imu", Imu, get_angular_velocity)
    rospy.Subscriber(sys.argv[1] + "_short" + "/setpoint_x", Float32, get_setpoint_x)
    rospy.Subscriber(sys.argv[1] + "_short" + "/setpoint_y", Float32, get_setpoint_y)

    rospy.Subscriber(sys.argv[1] + "_short" + "/setpoint_velocity_x", Float32, get_vel_setpoint_x)
    rospy.Subscriber(sys.argv[1] + "_short" + "/setpoint_velocity_y", Float32, get_vel_setpoint_y)

    rospy.Subscriber(sys.argv[1] + "_short" +  "/setpoint_heading", Float32, get_heading_setpoint)
    # rospy.Subscriber("sc1/gripper_close", Bool, get_gripper_cb_sc1)
    # rospy.Subscriber("sc2/gripper_close", Bool, get_gripper_cb_sc2)
    # rospy.Subscriber("sc5/gripper_close", Bool, get_gripper_cb_sc5)


    time.sleep(3) # wait to get position from vicon

    control_period = 1/control_rate
    angular_control_timeslice_fraction = 0.5
    angular_control_timeslice = control_period * angular_control_timeslice_fraction
    linear_control_timeslice = control_period * (1-angular_control_timeslice_fraction)

    rate_spinner = rospy.Rate(control_rate)

    t = 0


    csvfile = open(sys.argv[2], 'w+')
    data = csv.writer(csvfile, delimiter=',')
    data.writerow([
        sys.argv[1] + '_time',
        sys.argv[1] + '_pos_x',
        sys.argv[1] + '_pos_y',
        sys.argv[1] + '_pos_x_setpt',
        sys.argv[1] + '_pos_y_setpt',
        sys.argv[1] + '_vel_x',
        sys.argv[1] + '_vel_y',
        sys.argv[1] + '_vel_x_setpt',
        sys.argv[1] + '_vel_y_setpt',
        sys.argv[1] + '_heading',
        sys.argv[1] + '_heading_setpt',
        sys.argv[1] + '_FXpMZp_translation',
        sys.argv[1] + '_FXpMZm_translation',
        sys.argv[1] + '_FXmMZp_translation',
        sys.argv[1] + '_FXmMZm_translation',
        sys.argv[1] + '_FYpMZp_translation',
        sys.argv[1] + '_FYpMZm_translation',
        sys.argv[1] + '_FYmMZp_translation',
        sys.argv[1] + '_FYmMZm_translation',
        sys.argv[1] + '_FXpMZp_rotation',
        sys.argv[1] + '_FXpMZm_rotation',
        sys.argv[1] + '_FXmMZp_rotation',
        sys.argv[1] + '_FXmMZm_rotation',
        sys.argv[1] + '_FYpMZp_rotation',
        sys.argv[1] + '_FYpMZm_rotation',
        sys.argv[1] + '_FYmMZp_rotation',
        sys.argv[1] + '_FYmMZm_rotation',
    ])

    pos_x_start = pos_x_previous = sc['pos_I'][0]
    pos_y_start = pos_y_previous = sc['pos_I'][1]

    trigger = Int32()
    flag_trajectory_is_followed = 0
    while not rospy.is_shutdown():

        ############ heading controller

        heading_current = sc['yaw_angle']
        angular_velocity_current = sc['angular_velocity_z']

        heading_setpt = sc['heading_I_setpt']


        # rospy.loginfo(heading_current)
        # rospy.loginfo(heading_setpt)

        error_heading = limit_circular_value(heading_current - heading_setpt, -180, 180)
        angular_velocity_setpt = pid_heading.pid_process(error_heading)
        # angular_velocity_setpt = 0
        error_angular_velocity = angular_velocity_current - angular_velocity_setpt
        moment_z_body = pid_angular_velocity.pid_process(error_angular_velocity)
        # if (abs(error_angular_velocity) < 0.1):
        #     moment_z_body = 0

        # print("heading_current")
        # print(heading_current)
        print("error_heading")
        print(error_heading)

        thrusters = thruster_time_for_angular_impulse(moment_z_body * control_period)
        angular_thruster_time_limit_ms = s_to_ms(angular_control_timeslice*0.80)
        thrusters = limit_thruster_times(thrusters, angular_thruster_time_limit_ms)


        thruster_values_ms_for_rotation = Thrusters8()
        thruster_values_ms_for_rotation.FXpMZp = thrusters['FXpMZp']
        thruster_values_ms_for_rotation.FXpMZm = thrusters['FXpMZm']
        thruster_values_ms_for_rotation.FXmMZp = thrusters['FXmMZp']
        thruster_values_ms_for_rotation.FXmMZm = thrusters['FXmMZm']
        thruster_values_ms_for_rotation.FYpMZp = 0
        thruster_values_ms_for_rotation.FYpMZm = 0
        thruster_values_ms_for_rotation.FYmMZp = 0
        thruster_values_ms_for_rotation.FYmMZm = 0
        pub_thrusters.publish(thruster_values_ms_for_rotation)

        ## debug output
        p_angular_velocity_current = Float32()
        p_angular_velocity_current.data = angular_velocity_current

        print("angular_velocity", angular_velocity_current)

        p_heading_current = Float32()
        p_heading_current.data = heading_current
        pub_heading_current.publish(p_heading_current)

        p_angular_velocity_setpoint = Float32()
        p_angular_velocity_setpoint.data = angular_velocity_setpt
        pub_angular_velocity.publish(p_angular_velocity_setpoint)


        time.sleep(angular_control_timeslice)


        ############ position controller

        # pos_x_current = sc['pos_I'][0]
        # pos_y_current = sc['pos_I'][1]
        # pos_x_setpt = sc['pos_I_setpt_x']
        # pos_y_setpt = sc['pos_I_setpt_y']
        #
        #
        # # acc_x_setpt, vel_x_setpt, pos_x_setpt = traj.ramp(x1=pos_x_start, x2=sc['pos_I_target'][0], a=ramp_acc, v=ramp_vel, t=t)
        # # acc_y_setpt, vel_y_setpt, pos_y_setpt = traj.ramp(x1=pos_y_start, x2=sc['pos_I_target'][1], a=ramp_acc, v=ramp_vel, t=t)
        # # t_ramp_end_x = traj.ramp_time(x1=pos_x_start, x2=sc['pos_I_target'][0], a=ramp_acc, v=ramp_vel)
        # # t_ramp_end_y = traj.ramp_time(x1=pos_y_start, x2=sc['pos_I_target'][1], a=ramp_acc, v=ramp_vel)
        #
        # ## CONTROLLER of POSITION & VELOCITY in X
        # error_pos_x = pos_x_current - pos_x_setpt
        # velocity_x_setpt = pid_pos_x.pid_process(error_pos_x) #+ sc['vel_I_setpt_x']
        # # velocity_x_setpt = 0.0 # m/s
        # vel_x_current = get_velocity(pos_x_previous, pos_x_current, 1/control_rate)
        # error_vel_x = vel_x_current - velocity_x_setpt
        # force_x_inertial = pid_vel_x.pid_process(error_vel_x)
        # # if (abs(error_vel_x) < 0.01):
        # #     force_x_inertial = 0
        #
        #
        #
        # ## CONTROLLER of POSITION & VELOCITY in Y
        # error_pos_y = pos_y_current - pos_y_setpt
        # velocity_y_setpt = pid_pos_y.pid_process(error_pos_y) #+ sc['vel_I_setpt_y']
        # # velocity_y_setpt = 0.0 # m/s
        # vel_y_current = get_velocity(pos_y_previous, pos_y_current, 1/control_rate)
        # error_vel_y = vel_y_current - velocity_y_setpt
        # force_y_inertial = pid_vel_y.pid_process(error_vel_y)
        # # if (abs(error_vel_y) < 0.01):
        # #     force_y_inertial = 0
        # trigger.data = flag_trajectory_is_followed
        # if (abs(error_pos_x) < 0.1 and abs(error_pos_y) < 0.1):
        #     flag_trajectory_is_followed = 1
        #
        #
        # [force_x_body, force_y_body] = get_force_in_body_frame(force_x_inertial, force_y_inertial, sc['yaw_angle'])
        # thrusters = thruster_time_for_linear_impulse(force_x_body * control_period, 'X')
        # thrusters.update(thruster_time_for_linear_impulse(force_y_body * control_period, 'Y'))
        # linear_thruster_time_limit_ms = s_to_ms(linear_control_timeslice*0.80)
        # thrusters = limit_thruster_times(thrusters, linear_thruster_time_limit_ms)
        #
        # thruster_values_ms_for_translation = Thrusters8()
        # thruster_values_ms_for_translation.FXpMZp = thrusters['FXpMZp']
        # thruster_values_ms_for_translation.FXpMZm = thrusters['FXpMZm']
        # thruster_values_ms_for_translation.FXmMZp = thrusters['FXmMZp']
        # thruster_values_ms_for_translation.FXmMZm = thrusters['FXmMZm']
        # thruster_values_ms_for_translation.FYpMZp = thrusters['FYpMZp']
        # thruster_values_ms_for_translation.FYpMZm = thrusters['FYpMZm']
        # thruster_values_ms_for_translation.FYmMZp = thrusters['FYmMZp']
        # thruster_values_ms_for_translation.FYmMZm = thrusters['FYmMZm']
        # # rospy.loginfo(thruster_values_ms_for_translation)
        # pub_thrusters.publish(thruster_values_ms_for_translation)
        #
        # # gripper_state = Bool()
        # # if (t > t_ramp_end_x and t > t_ramp_end_y):
        # #     gripper_state.data = True
        # # else:
        # #     gripper_state.data = False
        # #     thruster_values_ms = Thrusters8()
        # #     thruster_values_ms.FXpMZp = 0
        # #     thruster_values_ms.FXpMZm = 0
        # #     thruster_values_ms.FXmMZp = 0
        # #     thruster_values_ms.FXmMZm = 0
        # #     thruster_values_ms.FYpMZp = 0
        # #     thruster_values_ms.FYpMZm = 0
        # #     thruster_values_ms.FYmMZp = 0
        # #     thruster_values_ms.FYmMZm = 0
        #
        # # pub_gripper.publish(gripper_state)
        #
        # ## debug output
        # p_x = Float32()
        # p_x.data = pos_x_current
        # p_vel_current_x = Float32()
        # p_vel_current_x.data = vel_x_current
        #
        # p_y = Float32()
        # p_y.data = pos_y_current
        # p_vel_current_y = Float32()
        # p_vel_current_y.data = vel_y_current
        #
        #
        # pub_x.publish(p_x)
        # pub_y.publish(p_y)
        #
        # pub_actual_velocity_x.publish(p_vel_current_x)
        # pub_actual_velocity_y.publish(p_vel_current_y)
        #
        #
        # pub_heading_setpoint_sc = Float32()
        # pub_heading_setpoint_sc.data = error_heading
        # pub_heading_setpoint.publish(error_heading)
        #
        #
        #
        # error_x = Float32()
        # error_x.data = error_pos_x
        # pub_error_x.publish(error_x)
        #
        # error_y = Float32()
        # error_y.data = error_pos_y
        # pub_error_y.publish(error_y)
        #
        # error_vx = Float32()
        # error_vx.data = error_vel_x
        # pub_error_vx.publish(error_vx)
        #
        # error_vy = Float32()
        # error_vy.data = error_vel_y
        # pub_error_vy.publish(error_vy)
        #
        #
        # data.writerow([
        #     rospy.Time.now(),
        #     pos_x_current,
        #     pos_y_current,
        #     pos_x_setpt,
        #     pos_y_setpt,
        #     vel_x_current,
        #     vel_y_current,
        #     velocity_x_setpt,
        #     velocity_y_setpt,
        #     heading_current,
        #     heading_setpt,
        #     thruster_values_ms_for_translation.FXpMZp,
        #     thruster_values_ms_for_translation.FXpMZm,
        #     thruster_values_ms_for_translation.FXmMZp,
        #     thruster_values_ms_for_translation.FXmMZm,
        #     thruster_values_ms_for_translation.FYpMZp,
        #     thruster_values_ms_for_translation.FYpMZm,
        #     thruster_values_ms_for_translation.FYmMZp,
        #     thruster_values_ms_for_translation.FYmMZm,
        #     thruster_values_ms_for_rotation.FXpMZp,
        #     thruster_values_ms_for_rotation.FXpMZm,
        #     thruster_values_ms_for_rotation.FXmMZp,
        #     thruster_values_ms_for_rotation.FXmMZm,
        #     thruster_values_ms_for_rotation.FYpMZp,
        #     thruster_values_ms_for_rotation.FYpMZm,
        #     thruster_values_ms_for_rotation.FYmMZp,
        #     thruster_values_ms_for_rotation.FYmMZm,
        # ])

        trigger_pub.publish(trigger)

        rate_spinner.sleep()
        #
        # pos_x_previous = pos_x_current
        # pos_y_previous = pos_y_current


        t = t + 1/control_rate
