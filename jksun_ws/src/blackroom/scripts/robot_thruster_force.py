#!/usr/bin/env python
# Program to publish messages from a csv file into Thruster8 messages to control
# movement of the model. This script is mostly used to test newly created
# spacecraft simulator model descriptions.
#
# Author: Jennifer Sun (jksun@caltech.edu)

import csv
import os
import rospkg
import rospy
import sys
from std_msgs.msg import String
from custom_msgs.msg import Thrusters8, Thrusters16

def commands():
    if sys.argv[2] == '3DOF':
        thrusters8_pub = rospy.Publisher('sc1/thruster8_force', Thrusters8, queue_size=1)

    if sys.argv[2] == '5DOF':
        thrusters16_pub = rospy.Publisher('sc1/thruster16_force', Thrusters16, queue_size=1)

    rospy.init_node('sc_thrusters_force', log_level=rospy.INFO)

    path = open('/home/jksun/surf-2019/jksun_ws/src/blackroom/csv_files/' + sys.argv[1], 'r')

    # rate at which Thrusters8 message gets published at (n times per second)
    rate = rospy.Rate(5)

    forces = csv.reader(path)
    print forces
    for i in forces:
        if len(i) == 8:
            thrusters_msg = Thrusters8()
            thrusters_msg.FXpMZp = float(i[0])
            thrusters_msg.FXpMZm = float(i[1])
            thrusters_msg.FXmMZp = float(i[2])
            thrusters_msg.FXmMZm = float(i[3])
            thrusters_msg.FYpMZp = float(i[4])
            thrusters_msg.FYpMZm = float(i[5])
            thrusters_msg.FYmMZp = float(i[6])
            thrusters_msg.FYmMZm = float(i[7])

            rospy.loginfo(thrusters_msg)
            thrusters8_pub.publish(thrusters_msg)

        elif len(i) == 16:
            thrusters_msg = Thrusters16()
            thrusters_msg.FXpMZp = float(i[0])
            thrusters_msg.FXpMZm = float(i[1])
            thrusters_msg.FXmMZp = float(i[2])
            thrusters_msg.FXmMZm = float(i[3])
            thrusters_msg.FYpMZp = float(i[4])
            thrusters_msg.FYpMZm = float(i[5])
            thrusters_msg.FYmMZp = float(i[6])
            thrusters_msg.FYmMZm = float(i[7])
            thrusters_msg.FZpMYm = float(i[8])
            thrusters_msg.FZmMYp = float(i[9])
            thrusters_msg.FZpMXp = float(i[10])
            thrusters_msg.FZmMXm = float(i[11])
            thrusters_msg.FZpMYp = float(i[12])
            thrusters_msg.FZmMYm = float(i[13])
            thrusters_msg.FZmMXp = float(i[14])
            thrusters_msg.FZpMXm = float(i[15])

            rospy.loginfo(thrusters_msg)
            thrusters16_pub.publish(thrusters_msg)

        rate.sleep()


if __name__ == '__main__':
    try:
        commands()
    except rospy.ROSInterruptException:
        pass
