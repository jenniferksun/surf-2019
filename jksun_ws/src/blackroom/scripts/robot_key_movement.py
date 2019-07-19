#!/usr/bin/env python
# Program to translate key inputs read from the robot_key_control.py publisher
# into Twists messages to control a robot.

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist

key_mapping = { 'w': [ 1, 0, 0], 'x': [-1, 0, 0],
                'a': [0, 1, 0], 'd': [0, -1, 0],
                'q': [0, 0, 1], 'e': [0, 0, -1],
                's': [ 0, 0, 0] }

def keys_cb(msg, twist_pub):
    if len(msg.data) == 0 or not key_mapping.has_key(msg.data[0]):
        return # unknown key
    vels = key_mapping[msg.data[0]]
    t = Twist()
    t.linear.x = vels[0]
    t.linear.y = vels[1]
    t.angular.z = vels[2]
    print t
    twist_pub.publish(t)

if __name__ == '__main__':
    rospy.init_node('keys_to_twist')
    twist_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
    rospy.Subscriber('keys', String, keys_cb, twist_pub)
    rospy.spin()
