#!/usr/bin/env python
# Program which plots the pose of the spacecraft simulator model. Writes poses
# out to csv file (through 1st command-line argument) in the poses_to_csv_files
# directory.
#
# These poses can also be compared with the truth, using Vicon. This is done
# through a bag file playing to simulate movement of the spacecraft model
# (specified through 2nd command-line argument) and determine pose of the
# actual spacecraft throught the thruster_to_model script. Uncomment VICON
# portions of the following code to do so.
#
# Author: Jennifer Sun (jksun@caltech.edu)

import csv
import math
import rospy
import sys
import time
from std_msgs.msg import String
from geometry_msgs.msg import Quaternion, TransformStamped
from custom_msgs.msg import Thrusters8
from gazebo_msgs.msg import ModelState
from nav_msgs.msg import Odometry

# vicon_pose = []   # VICON
# thruster_msgs = []

def yaw_from_quaternion(q):
    t1 = 2.0 * (q.x * q.y + q.z * q.w)
    t2 = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
    return math.atan2(t1, t2)


def add_csv_header(file_name):
    data = csv.writer(file_name, delimiter=',')
    data.writerow([
        'time',
        'measurement_type',
        'pos_x',
        'pos_y',
        'theta'
    ])
    return data


# Unused
def add_csv_header_thruster(file_name):
    data = csv.writer(file_name, delimiter=',')
    data.writerow([
        'time',
        'measurement_type',
        'FXpMZp',
        'FXpMZm',
        'FXmMZp',
        'FXmMZm',
        'FYpMZp',
        'FYpMZm',
        'FYmMZp',
        'FYmMZm',
    ])
    return data


def add_csv_rows(data, measurement_type, time, pos_x, pos_y, theta):
        data.writerow([
            time,
            measurement_type,
            pos_x,
            pos_y,
            theta
        ])


# Unused
def add_csv_rows_thruster(data, measurement_type, thruster_data):
        data.writerow([
            thruster_data[0],
            measurement_type,
            thruster_data[1],
            thruster_data[2],
            thruster_data[3],
            thruster_data[4],
            thruster_data[5],
            thruster_data[6],
            thruster_data[7],
            thruster_data[8]
        ])


def model_callback(msg):
    global model_pose
    time = msg.header.stamp.to_sec()
    x = msg.pose.pose.position.x
    y = msg.pose.pose.position.y
    angle = yaw_from_quaternion(Quaternion(msg.pose.pose.orientation.x,
                                           msg.pose.pose.orientation.y,
                                           msg.pose.pose.orientation.z,
                                           msg.pose.pose.orientation.w))
    model_pose.append((time, x, y, angle))


def vicon_callback(msg):
    global vicon_pose
    time = rospy.Time.now().to_sec()
    x = msg.transform.translation.x
    y = msg.transform.translation.y
    angle = yaw_from_quaternion(Quaternion(msg.transform.rotation.x,
                                           msg.transform.rotation.y,
                                           msg.transform.rotation.z,
                                           msg.transform.rotation.w))
    vicon_pose.append((time, x, y, angle))

# Unused
def thrusters_callback(msg):
    global thruster_msgs
    time = rospy.Time.now().to_sec()
    thruster_msgs.append((time, msg.FXpMZp, msg.FXpMZm, msg.FXmMZp, msg.FXmMZm,
                                msg.FYpMZp, msg.FYpMZm, msg.FYmMZp, msg.FYmMZm))

if __name__ == '__main__':
    model_pose = []

    rospy.init_node('pose_plot', log_level=rospy.INFO)

    pose_csvfile = open(str(sys.argv[1]), 'w+')
    pose_data = add_csv_header(pose_csvfile)

    # thruster_csvfile = open('thruster_' + str(sys.argv[1]), 'w+')c
    # thruster_data = add_csv_header_thruster(thruster_csvfile)

    spacecraft_name = sys.argv[2]

    rospy.Subscriber(spacecraft_name + '_pose', Odometry, model_callback)
    # rospy.Subscriber('vicon/' + spacecraft_name + '/' + spacecraft_name, TransformStamped, vicon_callback)  # VICON
    # rospy.Subscriber(spacecraft_name + '/thruster_msg', Thrusters8, thrusters_callback)

    # global model_pose
    # global vicon_pose   # VICON
    # global thruster_msgs

    while not rospy.is_shutdown():
        for i in model_pose:
            # rospy.loginfo(i)
            add_csv_rows(pose_data, 'model', i[0], i[1], i[2], i[3])
        # for i in vicon_pose:
        #     # rospy.loginfo(i)
        #     add_csv_rows(pose_data, 'vicon', i[0], i[1], i[2], i[3])
        # for i in thruster_msgs:
        #     # rospy.loginfo(i)
        #     add_csv_rows_thruster(thruster_data, 'thruster', i)

        model_pose = []
        # vicon_pose = []   # VICON
        # thruster_msgs = []
