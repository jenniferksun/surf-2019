/*
 * Header file for gazebo plugin that applys forces using Wrench messages at 8
 * specific thruster locations on the spacecraft relative to the center of mass
 * of the air bearing (ball joint between pedestal and head of spacecraft).
 *
 */

#ifndef GAZEBO_ROS_FORCE_HH
#define GAZEBO_ROS_FORCE_HH

#include <string>

// Custom callback queue
#include <ros/callback_queue.h>
#include <ros/subscribe_options.h>
#include <geometry_msgs/Wrench.h>

#include <ros/ros.h>
#include <boost/thread.hpp>
#include <boost/thread/mutex.hpp>

#include <gazebo/physics/physics.hh>
#include <gazebo/transport/TransportTypes.hh>
#include <gazebo/common/Plugin.hh>

#include <gazebo/common/Plugin.hh>
#include <ros/ros.h>

// Wrench message which contains Vector3D forces and torques
#include <geometry_msgs/Wrench.h>

#include <gazebo/physics/physics.hh>
#include <gazebo/common/Events.hh>

namespace gazebo {
class SpacecraftThrusterForce : public ModelPlugin {

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


  // Keeps track of wrench messages exerted at each thruster on the spacecraft
  /* For readability: thruster locations on the spacecraft will be in the same
   * reference of the Gazebo world where the positive x direction is towards
   * the rightmost wall and the positive y direction is towards the back wall.
   *
   * Thruster locations on spacecraft:
   *
   *            a) FYmMZp   b) FYmMZm
   *               ---------------
   *    h) FXpMZm  |             |  c) FXmMZp
   *               |             |
   *               |             |
   *    g) FXpMZp  |             |  d) FXmMZm
   *               ---------------
   *            f) FYpMZm   e) FYpMZp
   *
   */
  private: geometry_msgs::Wrench FYmMZp_;
  private: geometry_msgs::Wrench FYmMZm_;
  private: geometry_msgs::Wrench FXmMZp_;
  private: geometry_msgs::Wrench FXmMZm_;
  private: geometry_msgs::Wrench FYpMZp_;
  private: geometry_msgs::Wrench FYpMZm_;
  private: geometry_msgs::Wrench FXpMZp_;
  private: geometry_msgs::Wrench FXpMZm_;

  /* Keeps track of the relative position of each thruster with respect to the
   * bottom of the ball joint.
   */
  private: const ignition::math::Vector3d pos_a();
  private: const ignition::math::Vector3d pos_b();
  private: const ignition::math::Vector3d pos_c();
  private: const ignition::math::Vector3d pos_d();
  private: const ignition::math::Vector3d pos_e();
  private: const ignition::math::Vector3d pos_f();
  private: const ignition::math::Vector3d pos_g();
  private: const ignition::math::Vector3d pos_h();

  // Constructor
  public: SpacecraftThrusterForce();

  // Destructor
  public: ~SpacecraftThrusterForce();

  // Load the controller
  protected: void Load(physics::ModelPtr _model, sdf::ElementPtr _sdf);

  // Update the controller
  protected: virtual void UpdateChild();

  // Call back when a Wrench message is published
  // Incoming ROS message representing the new force to exert
  private: void UpdateObjectForce(const geometry_msgs::Wrench::ConstPtr& _msg);

  // Custom callback queue thread function
  private: void QueueThread();



  // Pointer to the update event connection
  private: event::ConnectionPtr update_connection_;

  };
}

#endif



// #include <functional>
// #include <gazebo/gazebo.hh>
// #include <gazebo/physics/physics.hh>
// #include <gazebo/common/common.hh>
// #include "std_msgs/Float32.h"
// #include "geometry_msgs/Twist.h"
// #include <gazebo/transport/transport.hh>
// #include <gazebo/msgs/msgs.hh>
