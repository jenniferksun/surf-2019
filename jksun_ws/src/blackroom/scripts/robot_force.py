#!/usr/bin/env python
# Program to translate key inputs read from the robot_key_control.py publisher
# into Wrench messages to control a robot.

import csv
import os
import rospkg
import rospy
import sys
from std_msgs.msg import String
from geometry_msgs.msg import Wrench

key_mapping = { 'w': [ 1, 0, 0], 'x': [-1, 0, 0],
                'a': [0, 1, 0], 'd': [0, -1, 0],
                'q': [0, 0, 1], 'e': [0, 0, -1],
                's': [ 0, 0, 0] }

def commands():
    wrench_pub = rospy.Publisher('ros_force', Wrench, queue_size=1)
    rospy.init_node('force_movement', log_level=rospy.INFO)

    path = open('/home/jksun/surf-2019/jksun_ws/src/blackroom/csv_files/' + sys.argv[1], 'r')
    w = Wrench()

    # rate at which Wrench message gets published at (n times per second)
    rate = rospy.Rate(5)

    forces = csv.reader(path)
    print forces
    for i in forces:
        w.force.x = int(i[0])
        w.force.y = int(i[1])
        w.torque.z = int(i[2])

        rospy.loginfo(w)
        wrench_pub.publish(w)
        rate.sleep()


if __name__ == '__main__':
    try:
        commands()
    except rospy.ROSInterruptException:
        pass
