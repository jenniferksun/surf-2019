#!/usr/bin/env python
# Program to translate key inputs read from the robot_key_control.py publisher
# into Twists messages to control a robot including ramps. This program
# gradually ramps the robot motion commands up and down over a finite amount
# of time to prevent skidding or slipping of a robot when the motors instantly
# change to different velocities.

import csv
import math
import os
import rospy
import sys
from std_msgs.msg import String
from geometry_msgs.msg import Twist

key_mapping = { 'w': [ 1, 0, 0], 'x': [-1, 0, 0],
                'a': [0, 1, 0], 'd': [0, -1, 0],
                'q': [0, 0, 1], 'e': [0, 0, -1],
                's': [ 0, 0, 0] }
twist_pub = None
target_twist = None
last_twist = None
last_send_time = None
vel_scales = [0.1, 0.1, 0.1] # default to very slow
vel_ramps = [1, 1, 1] # units: meters per second^2


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
    global last_twist_send_time, target_twist, last_twist,\
            vel_scales, vel_ramps, twist_pub
    t_now = rospy.Time.now()
    last_twist = ramped_twist(last_twist, target_twist,
                            last_twist_send_time, t_now, vel_ramps)
    last_twist_send_time = t_now
    rospy.loginfo(last_twist)
    twist_pub.publish(last_twist)


if __name__ == '__main__':
    twist_pub = rospy.Publisher('/' + sys.argv[1] + '/cmd_vel', Twist, queue_size=1)
    rospy.init_node('keys_to_twist', log_level=rospy.INFO)
    last_twist_send_time = rospy.Time.now()
    target_twist = Twist() # initializes to zero
    last_twist = Twist()
    vel_scales[0] = 0.5
    vel_scales[1] = 0.5
    vel_scales[2] = 0.5
    vel_ramps[0] = 1.0
    vel_ramps[1] = 1.0
    vel_ramps[2] = 1.0

    path = open('/home/jksun/surf-2019/jksun_ws/src/blackroom/csv_files/' + sys.argv[2], 'r')

    # rate at which twist message gets published at (n times per second)
    rate = rospy.Rate(5)

    vels = csv.reader(path)
    for i in vels:
        target_twist.linear.x = int(i[0]) * vel_scales[0]
        target_twist.linear.y = int(i[1]) * vel_scales[1]
        target_twist.angular.z = int(i[2]) * vel_scales[2]
        send_twist()
        rate.sleep()
