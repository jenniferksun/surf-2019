#!/usr/bin/env python

import rospy
from geometry_msgs.msg import TransformStamped
from nav_msgs.msg import Odometry

def callback(msg):
    # rospy.loginfo(msg)

    dummy_msg = TransformStamped()
    dummy_msg.header = msg.header
    dummy_msg.child_frame_id = msg.child_frame_id
    dummy_msg.transform.translation.x = msg.pose.pose.position.x
    dummy_msg.transform.translation.y = msg.pose.pose.position.y
    dummy_msg.transform.translation.z = msg.pose.pose.position.z
    dummy_msg.transform.rotation.x = msg.pose.pose.orientation.x
    dummy_msg.transform.rotation.y = msg.pose.pose.orientation.y
    dummy_msg.transform.rotation.z = msg.pose.pose.orientation.z
    dummy_msg.transform.rotation.w = msg.pose.pose.orientation.w

    rospy.loginfo(dummy_msg)
    dummy_vicon_pub.publish(dummy_msg)

if __name__ == '__main__':
    rospy.init_node('model_to_GNC', log_level=rospy.INFO)
    # rospy.Subscriber('gazebo/model_states', ModelState, callback)
    rospy.Subscriber('sc_pose', Odometry, callback)
    # rospy.Subscriber('sc_pose_test', Odometry, callback)
    dummy_vicon_pub = rospy.Publisher('vicon/sc1/sc1', TransformStamped, queue_size=1)

    rospy.spin()
