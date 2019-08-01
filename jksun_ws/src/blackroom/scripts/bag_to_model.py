#!/usr/bin/env python
# Program which takes Thrusters8 messages from a bag file, translates each PWM
# signal into forces and publishes it to a thrusters_force topic to control
# movement of a spacecraft simulator. Needs a bag file playing to simulate
# movement of the spacecraft model

import math
import rospy
import sys
from std_msgs.msg import String
from geometry_msgs.msg import Quaternion, Transform, TransformStamped, Vector3
from custom_msgs.msg import Thrusters8
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import SetModelState

def force_from_pwm(duration):
    if duration == 0:
        return duration
    return ((duration/1000) + 0.007686)/4.829

def get_start_pos(msg):
    start_pos = Transform()
    start_pos.translation.x = msg.transform.translation.x
    start_pos.translation.y = msg.transform.translation.y
    start_pos.translation.z = msg.transform.translation.z
    start_pos.rotation.x = msg.transform.rotation.x
    start_pos.rotation.y = msg.transform.rotation.y
    start_pos.rotation.z = msg.transform.rotation.z
    start_pos.rotation.w = msg.transform.rotation.w
    return start_pos

def set_start_pos(pos):
    state_msg = ModelState()
    state_msg.model_name = 'sc'
    state_msg.pose.position.x = pos.translation.x
    state_msg.pose.position.y = pos.translation.y
    # state_msg.pose.position.z = pos.translation.z
    state_msg.pose.position.z = 0.25
    state_msg.pose.orientation.x = pos.rotation.x
    state_msg.pose.orientation.y = pos.rotation.y
    state_msg.pose.orientation.z = pos.rotation.z
    state_msg.pose.orientation.w = pos.rotation.w
    print state_msg
    return state_msg

# def yaw_to_quaternion(yaw):
#     return Quaternion(0, 0, math.sin(yaw/2), math.cos(yaw/2))
#
# def yaw_from_quaternion(q):
#     t1 = 2.0 * (q.x * q.y + q.z * q.w)
#     t2 = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
#     return math.atan2(t1, t2)

def callback(msg):
    # path = open('/home/jksun/surf-2019/state_msg = jksun_ws/src/blackroom/csv_files/' + sys.argv[1], 'w+')
    thrusters_msg = Thrusters8()
    thrusters_msg.header = msg.header

    thrusters_msg.FXpMZp = force_from_pwm(msg.FXpMZp)
    thrusters_msg.FXpMZm = force_from_pwm(msg.FXpMZm)
    thrusters_msg.FXmMZp = force_from_pwm(msg.FXmMZp)
    thrusters_msg.FXmMZm = force_from_pwm(msg.FXmMZm)
    thrusters_msg.FYpMZp = force_from_pwm(msg.FYpMZp)
    thrusters_msg.FYpMZm = force_from_pwm(msg.FYpMZm)
    thrusters_msg.FYmMZp = force_from_pwm(msg.FYmMZp)
    thrusters_msg.FYmMZm = force_from_pwm(msg.FYmMZm)

    rospy.loginfo(thrusters_msg)

    thrusters_pub.publish(thrusters_msg)

if __name__ == '__main__':
    rospy.init_node('sc_thruster_force', log_level=rospy.INFO)
    thrusters_pub = rospy.Publisher('thruster_force', Thrusters8, queue_size=1)
    # try:
    #     topic_name = sys.argv[1]
    # except:
    #     topic_name = input("Enter thruster message topic name: ")
    sc = sys.argv[1]
    rospy.Subscriber(sc + '/thruster_msg', Thrusters8, callback)

    # Gets the starting position of the spacecraft using Vicon
    start_vicon = rospy.wait_for_message('vicon/' + sc + '/' + sc, TransformStamped)
    rospy.wait_for_service('/gazebo/set_model_state')
    set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
    start_pos = get_start_pos(start_vicon)
    print start_pos
    set_state(set_start_pos(start_pos))


    rospy.spin()
