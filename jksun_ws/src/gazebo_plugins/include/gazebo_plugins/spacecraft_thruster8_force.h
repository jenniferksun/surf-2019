/*
 * Header file for gazebo plugin that applys forces using a Thrusters8 message
 * to represent forces applied at 8 specific thruster locations on the
 * spacecraft relative to the center of mass of the air bearing (ball joint
 * between pedestal and head of spacecraft). This plugin was inspired by the
 * Gazebo ROS force plugin found in the gazebo_ros_pkgs package.
 *
 * Maintainer: Jennifer Sun (jksun@caltech.edu)
 */

#ifndef GAZEBO_ROS_FORCE_HH
#define GAZEBO_ROS_FORCE_HH

#include <string>

// Custom callback queue
#include <ros/callback_queue.h>
#include <ros/subscribe_options.h>

#include <ros/ros.h>
#include <boost/thread.hpp>
#include <boost/thread/mutex.hpp>

#include <gazebo/physics/physics.hh>
#include <gazebo/transport/TransportTypes.hh>
#include <gazebo/common/Plugin.hh>

#include <std_msgs/Float32.h>
// Thrusters8 message which contains Vector3D forces and torques
#include <custom_msgs/Thrusters8.h>

namespace gazebo {
class SpacecraftThruster8Force : public ModelPlugin {

  // Pointer to the gazebo world
  private: physics::WorldPtr world_;

  // Pointer to the Link, where force is applied
  private: physics::LinkPtr link_;

  // Pointer to the ROS node, instantiatea node if it does not exist
  private: ros::NodeHandle* rosnode_;
  private: ros::Subscriber sub_;

  // Mutex to lock access to fields that are used in ROS message callbacks
  private: boost::mutex lock_;

  // ROS Wrench topic name inputs
  private: std::string topic_name_;

  // Link this plugin is attached to, and will exert forces on
  private: std::string link_name_;

  // Custom Callback Queue
  private: ros::CallbackQueue queue_;

  // Thread object for the running callback Thread
  private: boost::thread callback_queue_thread_;

  // For setting the ROS name space
  private: std::string robot_namespace_;

  // Keeps track of Thrusters8 messages exerted on the spacecraft
  /* For readability: thruster locations on the spacecraft will be in the same
   * reference of the Gazebo world where the positive x direction is towards
   * the rightmost wall and the positive y direction is towards the back wall.
   *
   * Thrusters8 msg:
   *  0) FXpMZp
   *  1) FXpMZm
   *  2) FXmMZp
   *  3) FXmMZm
   *  4) FYpMZp
   *  5) FYpMZm
   *  6) FYmMZp
   *  7) FYmMZm
   *
   *
   * Thruster locations on spacecraft:
   *
   *             6a) FYmMZp   7b) FYmMZm
   *                ---------------
   *    1h) FXpMZm  |             |  2c) FXmMZp            ^ y
   *                |             |                       |
   *                |             |                       ----> x
   *    0g) FXpMZp  |             |  3d) FXmMZm
   *                ---------------
   *             5f) FYpMZm   4e) FYpMZp
   *
   */

  private: custom_msgs::Thrusters8 thrusters_msg_;
  // private: geometry_msgs::Wrench wrench_msg_;


  /* Keeps track of the relative position of each thruster with respect to the
   * bottom of the air bearing.
   */
  private: std::vector<ignition::math::Vector3d> pos_thrusters8
      = {ignition::math::Vector3d(-0.163, 0.229, 0.03811),  // a
         ignition::math::Vector3d(0.163, 0.229, 0.03811),   // b
         ignition::math::Vector3d(0.229, 0.163, 0.03811),   // c
         ignition::math::Vector3d(0.229, -0.163, 0.03811),  // d
         ignition::math::Vector3d(0.163, -0.229, 0.03811),  // e
         ignition::math::Vector3d(-0.163, -0.229, 0.03811), // f
         ignition::math::Vector3d(-0.229, -0.163, 0.03811), // g
         ignition::math::Vector3d(-0.229, 0.163, 0.03811)}; // h

  // Constructor
  public: SpacecraftThruster8Force();

  // Destructor
  public: ~SpacecraftThruster8Force();

  // Load the controller
  protected: void Load(physics::ModelPtr _model, sdf::ElementPtr _sdf);

  // Update the controller
  protected: virtual void UpdateChild();

  // Call back when a Thrusters8 message is published
  // Incoming ROS message representing the new force to exert
  private: void UpdateObjectForce(const custom_msgs::Thrusters8::ConstPtr& _msg);
  // private: void UpdateObjectForce(const geometry_msgs::Wrench::ConstPtr& _msg);

  // Custom callback queue thread function
  private: void QueueThread();

  // Pointer to the update event connection
  private: event::ConnectionPtr update_connection_;

  };
  GZ_REGISTER_MODEL_PLUGIN(SpacecraftThruster8Force)
}

#endif
