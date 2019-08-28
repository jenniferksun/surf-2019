#!/usr/bin/env python
# Program which translates each PWM signal from a Thruster message into forces
# and publishes it to a thruster_force topic to control movement of a
# spacecraft simulator in simulation. Works in conjunction with a controller
# that publishes to a thruster_msg topic. Allows for the same framework to
# control both the physical and modeled spacecraft simulators.
#
# Author: Jennifer Sun (jksun@caltech.edu)

import math
import rospy
import sys
from std_msgs.msg import String
from geometry_msgs.msg import Quaternion, Transform, TransformStamped, Vector3
from custom_msgs.msg import Thrusters8, Thrusters16
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import SetModelState

def force_from_pwm(duration):
    if duration == 0 or math.isnan(duration):
        return 0

    # Force translation is determined by linear fit equations from the 2018
    # spacecraft simulator dynamics paper. Firing times (t) can be computed
    # for a given control signal, force, and control frequency (ctrl_freq).
    # The equations are as below:
    # t = 7.863*(force/ctrl_freq)-0.009727     @ 40 psi
    # t = 4.829*(force/ctrl_freq)-0.007686     @ 50 psi
    # t = 3.51*(force/ctrl_freq)-0.006035      @ 60 psi

    ctrl_freq = sys.argv[3]

    # return ((duration/1000)+0.009727)/(7.863/float(ctrl_freq))    # 40 psi
    return ((duration/1000)+0.007686)/(4.829/float(ctrl_freq))    # 50 psi
    # return ((duration/1000)+0.006035)/(3.51/float(ctrl_freq))    # 60 psi


# Callback used to return the starting position of a model from a bag file or
# Vicon. Currently unused.
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


# Method used to set the position of the model in Gazebo. Currently unused.
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


# Main callback used to translate Thruster messages into forces to publish
# out to control the Gazebo model.
def callback(msg):
    # path = open('/home/jksun/surf-2019/state_msg = jksun_ws/src/blackroom/csv_files/' + sys.argv[1], 'w+')

    # Translates thruster messages to forces for 3DOF spacecrafts
    if msg._type == 'custom_msgs/Thrusters8':
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
        thruster8_forces_pub.publish(thrusters_msg)

    # Translates thruster messages to forces for 5DOF spacecrafts
    elif msg._type == 'custom_msgs/Thrusters16':
        thrusters_msg = Thrusters16()
        thrusters_msg.header = msg.header

        thrusters_msg.FXpMZp = force_from_pwm(msg.FXpMZp)
        thrusters_msg.FXpMZm = force_from_pwm(msg.FXpMZm)
        thrusters_msg.FXmMZp = force_from_pwm(msg.FXmMZp)
        thrusters_msg.FXmMZm = force_from_pwm(msg.FXmMZm)
        thrusters_msg.FYpMZp = force_from_pwm(msg.FYpMZp)
        thrusters_msg.FYpMZm = force_from_pwm(msg.FYpMZm)
        thrusters_msg.FYmMZp = force_from_pwm(msg.FYmMZp)
        thrusters_msg.FYmMZm = force_from_pwm(msg.FYmMZm)

        thrusters_msg.FZpMYm = force_from_pwm(msg.FZpMYm)
        thrusters_msg.FZmMYp = force_from_pwm(msg.FZmMYp)
        thrusters_msg.FZpMXp = force_from_pwm(msg.FZpMXp)
        thrusters_msg.FZmMXm = force_from_pwm(msg.FZmMXm)
        thrusters_msg.FZpMYp = force_from_pwm(msg.FZpMYp)
        thrusters_msg.FZmMYm = force_from_pwm(msg.FZmMYm)
        thrusters_msg.FZmMXp = force_from_pwm(msg.FZmMXp)
        thrusters_msg.FZpMXm = force_from_pwm(msg.FZpMXm)

        rospy.loginfo(thrusters_msg)
        thruster16_forces_pub.publish(thrusters_msg)

if __name__ == '__main__':
    rospy.init_node('sc_thruster_force', log_level=rospy.INFO)

    spacecraft_name = sys.argv[1]

    spacecraft_type = sys.argv[2]
    if spacecraft_type == '3DOF':
        rospy.Subscriber(spacecraft_name + '/thruster_msg', Thrusters8, callback)
        thruster8_forces_pub = rospy.Publisher(spacecraft_name + '/thruster8_force', Thrusters8, queue_size=1)

    elif spacecraft_type == '5DOF':
        rospy.Subscriber(spacecraft_name + '/thruster_msg', Thrusters16, callback)
        thruster16_forces_pub = rospy.Publisher(spacecraft_name + '/thruster16_force', Thrusters16, queue_size=1)

    # Gets the starting position of the spacecraft using Vicon from a bag file
    # start_vicon = rospy.wait_for_message('vicon/' + sc + '/' + sc, TransformStamped)
    # rospy.wait_for_service('/gazebo/set_model_state')
    # set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
    # start_pos = get_start_pos(start_vicon)
    # print start_pos
    # set_state(set_start_pos(start_pos))

    rospy.spin()
