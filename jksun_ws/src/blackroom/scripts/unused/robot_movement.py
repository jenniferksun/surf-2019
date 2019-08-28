#!/usr/bin/env python
# Program to translate key inputs read from the robot_key_control.py publisher
# into Twists messages to control a robot.

import csv
import os
import rospkg
import rospy
import sys
from std_msgs.msg import String
from geometry_msgs.msg import Twist

key_mapping = { 'w': [ 1, 0, 0], 'x': [-1, 0, 0],
                'a': [0, 1, 0], 'd': [0, -1, 0],
                'q': [0, 0, 1], 'e': [0, 0, -1],
                's': [ 0, 0, 0] }

def commands():
    twist_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
    rospy.init_node('keys_to_twist', log_level=rospy.INFO)

    path = open('/home/jksun/surf-2019/jksun_ws/src/blackroom/csv_files/' + sys.argv[1], 'r')
    t = Twist()

    # rate at which twist message gets published at (n times per second)
    rate = rospy.Rate(1)

    vels = csv.reader(path)
    print vels
    for i in vels:
        t.linear.x = int(i[0])
        t.linear.y = int(i[1])
        t.angular.z = int(i[2])

        rospy.loginfo(t)
        twist_pub.publish(t)
        rate.sleep()


if __name__ == '__main__':
    try:
        commands()
    except rospy.ROSInterruptException:
        pass
