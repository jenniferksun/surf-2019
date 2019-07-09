#!/usr/bin/env python
# Program to translate key inputs read from the robot_key_control.py publisher
# into Twists messages to control a robot including ramps. This program
# gradually ramps the robot motion commands up and down over a finite amount
# of time to prevent skidding or slipping of a robot when the motors instantly
# change to different velocities.

import rospy
import math
from std_msgs.msg import String
from geometry_msgs.msg import Twist

key_mapping = { 'w': [ 1, 0, 0], 'x': [-1, 0, 0],
                'a': [0, 1, 0], 'd': [0, -1, 0],
                'q': [0, 0, 1], 'e': [0, 0, -1],
                's': [ 0, 0, 0] }
g_twist_pub = None
g_target_twist = None
g_last_twist = None
g_last_send_time = None
g_vel_scales = [0.1, 0.1, 0.1] # default to very slow
g_vel_ramps = [1, 1, 1] # units: meters per second^2

def ramped_vel(v_prev, v_target, t_prev, t_now, ramp_rate):
    # compute maximum velocity step
    step = ramp_rate * (t_now - t_prev).to_sec()
    sign = 1.0 if (v_target > v_prev) else -1.0
    error = math.fabs(v_target - v_prev)
    if error < step: # we can get there within this timestep-we're done.
        return v_target
    else:
        return v_prev + sign * step # take a step toward the target

def ramped_twist(prev, target, t_prev, t_now, ramps):
    tw = Twist()
    tw.linear.x = ramped_vel(prev.linear.x, target.linear.x, t_prev,
                                t_now, ramps[0])
    tw.linear.y = ramped_vel(prev.linear.y, target.linear.y, t_prev,
                                t_now, ramps[1])
    tw.angular.z = ramped_vel(prev.angular.z, target.angular.z, t_prev,
                                t_now, ramps[2])
    return tw

def send_twist():
    global g_last_twist_send_time, g_target_twist, g_last_twist,\
            g_vel_scales, g_vel_ramps, g_twist_pub
    t_now = rospy.Time.now()
    g_last_twist = ramped_twist(g_last_twist, g_target_twist,
                            g_last_twist_send_time, t_now, g_vel_ramps)
    g_last_twist_send_time = t_now
    print g_last_twist
    g_twist_pub.publish(g_last_twist)

def keys_cb(msg):
    global g_target_twist, g_last_twist, g_vel_scales
    if len(msg.data) == 0 or not key_mapping.has_key(msg.data[0]):
        return # unknown key
    vels = key_mapping[msg.data[0]]
    g_target_twist.linear.x = vels[0] * g_vel_scales[0]
    g_target_twist.linear.y = vels[1] * g_vel_scales[1]
    g_target_twist.angular.z = vels[2] * g_vel_scales[2]


# def fetch_param(name, default):
#     if rospy.has_param(name):
#         return rospy.get_param(name)
#     else:
#         print "parameter [%s] not defined. Defaulting to %.3f" % (name, default)
#         return default

if __name__ == '__main__':
    rospy.init_node('keys_to_twist')
    g_last_twist_send_time = rospy.Time.now()
    g_twist_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
    rospy.Subscriber('keys', String, keys_cb)
    g_target_twist = Twist() # initializes to zero
    g_last_twist = Twist()
    g_vel_scales[0] = 0.5
    g_vel_scales[1] = 0.5
    g_vel_scales[2] = 0.5
    g_vel_ramps[0] = 1.0
    g_vel_ramps[1] = 1.0
    g_vel_ramps[2] = 1.0

    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        send_twist()
        rate.sleep()
