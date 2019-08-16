/*
 * Gazebo plugin that applys forces using a Thrusters8 message to represent
 * forces applied at 8 specific thruster locations on the spacecraft relative
 * to the center of mass of the air bearing (ball joint between pedestal and
 * head of spacecraft). This plugin was inspired by the Gazebo ROS force plugin
 * found in the gazebo_ros_pkgs package.
 *
 */

#include <gazebo_plugins/spacecraft_thruster8_force.h>

namespace gazebo {
  // Constructor
  SpacecraftThruster8Force::SpacecraftThruster8Force() {
    /* Sets up the relative locations of each thruster with respect to the
     * bottom of the air bearing (set as the model's center of mass). See
     * header file for location of thrusters a-h.
     */

    this->thrusters_msg_.FYmMZp = 0;
    this->thrusters_msg_.FYmMZm = 0;
    this->thrusters_msg_.FXmMZp = 0;
    this->thrusters_msg_.FXmMZm = 0;
    this->thrusters_msg_.FYpMZp = 0;
    this->thrusters_msg_.FYpMZm = 0;
    this->thrusters_msg_.FXpMZp = 0;
    this->thrusters_msg_.FXpMZm = 0;

  }

  // Destructor
  SpacecraftThruster8Force::~SpacecraftThruster8Force() {
    this->update_connection_.reset();

    // Custom Callback Queue
    this->queue_.clear();
    this->queue_.disable();
    this->rosnode_->shutdown();
    this->callback_queue_thread_.join();

    delete this->rosnode_;
  }

  // Load the controller
  void SpacecraftThruster8Force::Load(physics::ModelPtr _model, sdf::ElementPtr _sdf) {
    // Get the world name.
    this->world_ = _model->GetWorld();

    // load parametershere:
    this->robot_namespace_ = "";
    if (_sdf->HasElement("robotNamespace")) {
      this->robot_namespace_ = _sdf->GetElement("robotNamespace")->Get<std::string>() + "/";
    }

    if (!_sdf->HasElement("bodyName")) {
      ROS_FATAL_NAMED("force", "force plugin missing <bodyName>, cannot proceed");
      return;
    }
    else {
      this->link_name_ = _sdf->GetElement("bodyName")->Get<std::string>();
    }

    this->link_ = _model->GetLink(this->link_name_);
    if (!this->link_) {
      ROS_FATAL_NAMED("force", "gazebo_ros_force plugin error: link named: %s does not exist\n",this->link_name_.c_str());
      return;
    }

    if (!_sdf->HasElement("topicName")) {
      ROS_FATAL_NAMED("force", "force plugin missing <topicName>, cannot proceed");
      return;
    }
    else {
      this->topic_name_ = _sdf->GetElement("topicName")->Get<std::string>();
    }

    // Make sure the ROS node for Gazebo has already been initialized
    if (!ros::isInitialized())
    {
      ROS_FATAL_STREAM_NAMED("force", "A ROS node for Gazebo has not been initialized, unable to load plugin. "
        << "Load the Gazebo system plugin 'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
      return;
    }

    // Logs that the SpacecraftThruster8Force plugin has been properly loaded in.
    ROS_INFO("Loaded Spacecraft Thruster Force Plugin");

    this->rosnode_ = new ros::NodeHandle(this->robot_namespace_);

    // Custom Callback Queue
    ros::SubscribeOptions so = ros::SubscribeOptions::create<custom_msgs::Thrusters8>(
      this->topic_name_, 1,
      boost::bind( &SpacecraftThruster8Force::UpdateObjectForce,this,_1),
      ros::VoidPtr(), &this->queue_);
    this->sub_ = this->rosnode_->subscribe(so);

    // Custom Callback Queue
    this->callback_queue_thread_ = boost::thread( boost::bind( &SpacecraftThruster8Force::QueueThread,this ) );

    // Is updated every world cycle
    // Listens to the update event and is broadcasted every
    // simulation iteration.
    this->update_connection_ = event::Events::ConnectWorldUpdateBegin(
        boost::bind(&SpacecraftThruster8Force::UpdateChild, this));
  }

  // Update the controller
  void SpacecraftThruster8Force::UpdateObjectForce(const custom_msgs::Thrusters8::ConstPtr& _msg) {
    this->thrusters_msg_.FYmMZp = _msg->FYmMZp;    // Top left
    this->thrusters_msg_.FYmMZm = _msg->FYmMZm;    // Top right
    this->thrusters_msg_.FXmMZp = _msg->FXmMZp;    // Right top
    this->thrusters_msg_.FXmMZm = _msg->FXmMZm;    // Right bottom
    this->thrusters_msg_.FYpMZp = _msg->FYpMZp;    // Bottom left
    this->thrusters_msg_.FYpMZm = _msg->FYpMZm;    // Bottom right
    this->thrusters_msg_.FXpMZp = _msg->FXpMZp;    // Left bottom
    this->thrusters_msg_.FXpMZm = _msg->FXpMZm;    // Left top
  }

  // Update the controller
  void SpacecraftThruster8Force::UpdateChild() {
    this->lock_.lock();
    std::vector<ignition::math::Vector3d> force_thrusters8
      = {ignition::math::Vector3d(0, -1 * this->thrusters_msg_.FYmMZp, 0),  // FYmMZp
         ignition::math::Vector3d(0, -1 * this->thrusters_msg_.FYmMZm, 0),  // FYmMZm
         ignition::math::Vector3d(-1 * this->thrusters_msg_.FXmMZp, 0, 0),  // FXmMZp
         ignition::math::Vector3d(-1 * this->thrusters_msg_.FXmMZm, 0, 0),  // FXmMZm
         ignition::math::Vector3d(0, this->thrusters_msg_.FYpMZp, 0),  // FYpMZp
         ignition::math::Vector3d(0, this->thrusters_msg_.FYpMZm, 0),  // FYpMZm
         ignition::math::Vector3d(this->thrusters_msg_.FXpMZp, 0, 0),  // FXpMZp
         ignition::math::Vector3d(this->thrusters_msg_.FXpMZm, 0, 0)};  // FXpMZm

    // Accumulates forces at specfic thruster locations on the spacecraft
    this->link_->AddForceAtRelativePosition(force_thrusters8[0], this->pos_thrusters8[0]);
    this->link_->AddForceAtRelativePosition(force_thrusters8[1], this->pos_thrusters8[1]);
    this->link_->AddForceAtRelativePosition(force_thrusters8[2], this->pos_thrusters8[2]);
    this->link_->AddForceAtRelativePosition(force_thrusters8[3], this->pos_thrusters8[3]);
    this->link_->AddForceAtRelativePosition(force_thrusters8[4], this->pos_thrusters8[4]);
    this->link_->AddForceAtRelativePosition(force_thrusters8[5], this->pos_thrusters8[5]);
    this->link_->AddForceAtRelativePosition(force_thrusters8[6], this->pos_thrusters8[6]);
    this->link_->AddForceAtRelativePosition(force_thrusters8[7], this->pos_thrusters8[7]);
    //this->link_->AddTorque(torque);
    this->lock_.unlock();
  }

  // Custom callback queue thread
  void SpacecraftThruster8Force::QueueThread() {
    static const double timeout = 0.01;

    while (this->rosnode_->ok()) {
      this->queue_.callAvailable(ros::WallDuration(timeout));
    }
  }

}
