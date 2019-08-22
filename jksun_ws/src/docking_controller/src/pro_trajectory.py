#!/usr/bin/env python

from geometry_msgs.msg import TransformStamped, PoseStamped
import numpy as np
import rospy
from std_msgs.msg import Bool, String, Float64, Float32
import math
from math import atan2, cos, sin
import time
import trajectory as traj
import sys
from io import StringIO
import csv


def limit_circular_value(input_value, min_value, max_value):
    if (input_value > max_value):
        return input_value - max_value + min_value
    if (input_value < min_value):
        return input_value + max_value - min_value
    return input_value

def euler_to_quaternion(yaw, pitch, roll):
        qx = np.sin(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) - np.cos(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)
        qy = np.cos(roll/2) * np.sin(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.cos(pitch/2) * np.sin(yaw/2)
        qz = np.cos(roll/2) * np.cos(pitch/2) * np.sin(yaw/2) - np.sin(roll/2) * np.sin(pitch/2) * np.cos(yaw/2)
        qw = np.cos(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)

        return [qx, qy, qz, qw]

if __name__ == '__main__':
    rospy.init_node('pro_trajectory', anonymous=True, log_level=rospy.DEBUG)

    # rospy.Subscriber("vicon/" + sys.argv[1] + "_short/" + sys.argv[1] + "_short", TransformStamped, lambda msg: get_position_and_angle_cb('sc5', msg))

    sc_pub_setpoint_x = rospy.Publisher(sys.argv[1] + '_short' + '/setpoint_x', Float32, queue_size=10)
    sc_pub_setpoint_y = rospy.Publisher(sys.argv[1] + '_short' + '/setpoint_y', Float32, queue_size=10)
    sc_pub_setpoint_velocity_x = rospy.Publisher(sys.argv[1] + '_short' + '/setpoint_velocity_x', Float32, queue_size=10)
    sc_pub_setpoint_velocity_y = rospy.Publisher(sys.argv[1] + '_short' + '/setpoint_velocity_y', Float32, queue_size=10)
    sc_pub_heading = rospy.Publisher(sys.argv[1] + '_short' + '/setpoint_heading', Float32, queue_size=10)

    sc_pub_pose = rospy.Publisher(sys.argv[1] + '_short/'+'pose', PoseStamped, queue_size=10)
    fields = ['x', 'y', 'theta', 'xd', 'yd', 'thd']

    trajectory_iteration = 0
    delay = 30

    csv_file = open(sys.argv[2])
    sc_trajectory = list(csv.reader(csv_file, delimiter=',', quotechar='|'))
    end_trajectory = sum(1 for row in sc_trajectory)

    pos_x_pro = np.zeros(end_trajectory)
    pos_y_pro = np.zeros(end_trajectory)
    theta_pro = np.zeros(end_trajectory)
    vel_x_pro = np.zeros(end_trajectory)
    vel_y_pro = np.zeros(end_trajectory)

    for i in range(0, end_trajectory):
        pos_x_pro[i] = sc_trajectory[i][0]
        pos_y_pro[i] = sc_trajectory[i][1]
        theta_pro[i] = sc_trajectory[i][2]
        vel_x_pro[i] = sc_trajectory[i][3]
        vel_y_pro[i] = sc_trajectory[i][4]

    control_rate = 4.0 # Hz
    rate_spinner = rospy.Rate(control_rate)

    time.sleep(2) # wait to get position from vicon


    t = -2
    t_trajectory_end = end_trajectory * 1/control_rate
    sc_pose_msg = PoseStamped()

    while not rospy.is_shutdown():
        sc_pose_msg.header.stamp = rospy.get_rostime()
        sc_pose_msg.header.frame_id = "world"
        if (t < 0):
            trajectory_iteration = 0
            sc_pos_x = pos_x_pro[0]
            sc_pos_y = pos_y_pro[0]
            sc_vel_x = vel_x_pro[0]
            sc_vel_y = vel_y_pro[0]
            # sc_heading_deg = math.degrees(theta_pro[0])
            sc_heading_deg = math.degrees(limit_circular_value(atan2(sc_pos_y, sc_pos_x) + math.pi, -math.pi, math.pi))
            sc_heading = limit_circular_value(atan2(sc_pos_y, sc_pos_x) + math.pi, -math.pi, math.pi)

            sc_pose_msg.pose.position.x = pos_x_pro[0]
            sc_pose_msg.pose.position.y = pos_y_pro[0]
            # sc_pose_msg.pose.position.z = pos_z_pro[0]

            [qx, qy, qz, qw] = euler_to_quaternion(sc_heading, 0, 0)
            sc_pose_msg.pose.orientation.x = qx
            sc_pose_msg.pose.orientation.y = qy
            sc_pose_msg.pose.orientation.z = qz
            sc_pose_msg.pose.orientation.w = qw

        else:
            sc_pos_x = pos_x_pro[trajectory_iteration]
            sc_pos_y = pos_y_pro[trajectory_iteration]
            sc_vel_x = vel_x_pro[trajectory_iteration]
            sc_vel_y = vel_y_pro[trajectory_iteration]
            sc_heading_deg = math.degrees(theta_pro[trajectory_iteration])

            [qx, qy, qz, qw] = euler_to_quaternion(sc_heading, 0, 0)
            sc_pose_msg.pose.position.x = pos_x_pro[trajectory_iteration]
            sc_pose_msg.pose.position.y = pos_y_pro[trajectory_iteration]
            # sc_pose_msg.pose.position.z = pos_z_pro[trajectory_iteration]

            sc_pose_msg.pose.orientation.x = qx
            sc_pose_msg.pose.orientation.y = qy
            sc_pose_msg.pose.orientation.z = qz
            sc_pose_msg.pose.orientation.w = qw
            if (trajectory_iteration < end_trajectory - 1):
                trajectory_iteration = trajectory_iteration + 1


        sc_pub_x_setpoint = Float32()
        sc_pub_x_setpoint.data = sc_pos_x

        sc_pub_y_setpoint = Float32()
        sc_pub_y_setpoint.data = sc_pos_y

        sc_pub_vel_x_setpoint = Float32()
        sc_pub_vel_x_setpoint.data = sc_vel_x

        sc_pub_vel_y_setpoint = Float32()
        sc_pub_vel_y_setpoint.data = sc_vel_y

        sc_pub_heading_setpt = Float32()
        sc_pub_heading_setpt.data = sc_heading_deg

        sc_pub_pose.publish(sc_pose_msg)
        sc_pub_setpoint_x.publish(sc_pub_x_setpoint)
        sc_pub_setpoint_y.publish(sc_pub_y_setpoint)
        sc_pub_setpoint_velocity_x.publish(sc_pub_vel_x_setpoint)
        sc_pub_setpoint_velocity_y.publish(sc_pub_vel_y_setpoint)
        sc_pub_heading.publish(sc_pub_heading_setpt)

        rate_spinner.sleep()

        t = t + 1/control_rate
