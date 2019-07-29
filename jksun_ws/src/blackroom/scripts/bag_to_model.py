#!/usr/bin/env python
# Program to translate key inputs read from the robot_key_control.py publisher
# into Wrench messages to control a robot.

import csv
import os
import rospkg
import rospy
import sys
from std_msgs.msg import String
from custom_msgs.msg import Thrusters8

def commands():
    thrusters_pub = rospy.Publisher('thrusters_force', Thrusters8, queue_size=1)
    # FYmMZp_pub = rospy.Publisher('FYmMZp', Wrench, queue_size=1)    # 6 a
    # FYmMZm_pub = rospy.Publisher('FYmMZm', Wrench, queue_size=1)    # 7 b
    # FXmMZp_pub = rospy.Publisher('FXmMZp', Wrench, queue_size=1)    # 2 c
    # FXmMZm_pub = rospy.Publisher('FXmMZm', Wrench, queue_size=1)    # 3 d
    # FYpMZp_pub = rospy.Publisher('FYpMZp', Wrench, queue_size=1)    # 4 e
    # FYpMZm_pub = rospy.Publisher('FYpMZm', Wrench, queue_size=1)    # 5 f
    # FXpMZp_pub = rospy.Publisher('FXpMZp', Wrench, queue_size=1)    # 0 g
    # FXpMZm_pub = rospy.Publisher('FXpMZm', Wrench, queue_size=1)    # 1 h

    rospy.init_node('sc_thrusters_force', log_level=rospy.INFO)

    path = open('/home/jksun/surf-2019/jksun_ws/src/blackroom/csv_files/' + sys.argv[1], 'r')
    thrusters_msg = Thrusters8()

    # rate at which Thrusters8 message gets published at (n times per second)
    rate = rospy.Rate(5)

    forces = csv.reader(path)
    print forces
    for i in forces:
        thrusters_msg.FXpMZp = float(i[0])
        thrusters_msg.FXpMZm = float(i[1])
        thrusters_msg.FXmMZp = float(i[2])
        thrusters_msg.FXmMZm = float(i[3])
        thrusters_msg.FYpMZp = float(i[4])
        thrusters_msg.FYpMZm = float(i[5])
        thrusters_msg.FYmMZp = float(i[6])
        thrusters_msg.FYmMZm = float(i[7])

        rospy.loginfo(thrusters_msg)

        thrusters_pub.publish(thrusters_msg)
        rate.sleep()


if __name__ == '__main__':
    try:
        commands()
    except rospy.ROSInterruptException:
        pass
