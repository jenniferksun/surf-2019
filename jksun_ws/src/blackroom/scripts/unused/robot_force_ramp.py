#!/usr/bin/env python
# Program to translate key inputs read from the robot_key_control.py publisher
# into Wrench messages to control a robot including ramps. This program
# gradually ramps the robot motion commands up and down over a finite amount
# of time to prevent skidding or slipping of a robot when the motors instantly
# change to different forces.

import csv
import math
import os
import rospy
import sys
from std_msgs.msg import String
from geometry_msgs.msg import Wrench

key_mapping = { 'w': [ 1, 0, 0], 'x': [-1, 0, 0],
                'a': [0, 1, 0], 'd': [0, -1, 0],
                'q': [0, 0, 1], 'e': [0, 0, -1],
                's': [ 0, 0, 0] }
wrench_pub = None
target_wrench = None
last_wrench = None
last_send_time = None
force_scales = [0.1, 0.1, 0.1] # default to very slow
force_ramps = [1, 1, 1] # units: meters per second^2


def ramped_force(v_prev, v_target, t_prev, t_now, ramp_rate):
    # compute maximum force step
    step = ramp_rate * (t_now - t_prev).to_sec()
    sign = 1.0 if (v_target > v_prev) else -1.0
    error = math.fabs(v_target - v_prev)
    if error < step: # we can get there within this timestep-we're done.
        return v_target
    else:
        return v_prev + sign * step # take a step toward the target


def ramped_wrench(prev, target, t_prev, t_now, ramps):
    wr = Wrench()
    wr.force.x = ramped_force(prev.force.x, target.force.x, t_prev,
                                t_now, ramps[0])
    wr.force.y = ramped_force(prev.force.y, target.force.y, t_prev,
                                t_now, ramps[1])
    wr.torque.z = ramped_force(prev.torque.z, target.torque.z, t_prev,
                                t_now, ramps[2])
    return wr


def send_wrench():
    global last_wrench_send_time, target_wrench, last_wrench,\
            force_scales, force_ramps, wrench_pub
    t_now = rospy.Time.now()
    last_wrench = ramped_wrench(last_wrench, target_wrench,
                            last_wrench_send_time, t_now, force_ramps)
    last_wrench_send_time = t_now
    rospy.loginfo(last_wrench)
    wrench_pub.publish(last_wrench)


if __name__ == '__main__':
    # wrench_pub = rospy.Publisher('/' + sys.argv[1] + '/ros_force', Wrench, queue_size=1)
    # rospy.init_node(sys.argv[1] + '_ramped_movement', log_level=rospy.INFO)
    wrench_pub = rospy.Publisher('/ros_force', Wrench, queue_size=1)
    rospy.init_node('ramped_movement', log_level=rospy.INFO)
    last_wrench_send_time = rospy.Time.now()
    target_wrench = Wrench() # initializes to zero
    last_wrench = Wrench()
    force_scales[0] = 0.5
    force_scales[1] = 0.5
    force_scales[2] = 0.5
    force_ramps[0] = 1.0
    force_ramps[1] = 1.0
    force_ramps[2] = 1.0

    path = open('/home/jksun/surf-2019/jksun_ws/src/blackroom/csv_files/' + sys.argv[2], 'r')

    # rate at which wrench message gets published at (n times per second)
    rate = rospy.Rate(5)

    forces = csv.reader(path)
    for i in forces:
        target_wrench.force.x = int(i[0]) * force_scales[0]
        target_wrench.force.y = int(i[1]) * force_scales[1]
        target_wrench.torque.x = int(i[2]) * force_scales[2]
        send_wrench()
        rate.sleep()
