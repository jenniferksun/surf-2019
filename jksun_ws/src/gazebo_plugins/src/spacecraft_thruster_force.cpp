/*
 * Gazebo plugin that applys forces using Wrench messages at 8 specific thruster
 * locations on the spacecraft relative to the center of mass of the air
 * bearing (ball joint between pedestal and head of spacecraft).
 *
 */

#include <gazebo_plugins/spacecraft_thruster_force.h>


namespace gazebo {
  // Constructor
  SpacecraftThrusterForce::SpacecraftThrusterForce() {
    // Wrench message
    // this->msg.force.x = 0;
    // this->msg.force.y = 0;
    // this->msg.force.z = 0;
    // this->msg.torque.x = 0;
    // this->msg.torque.y = 0;
    // this->msg.torque.z = 0;

    // Top left
    this->FYmMZp_.force.y = 0;
    // this->FYmMZp_.force.x = 0;
    // this->FYmMZp_.force.z = 0;
    // this->FYmMZp_.torque.x = 0;
    // this->FYmMZp_.torque.y = 0;
    // this->FYmMZp_.torque.z = 0;

    // Top right
    this->FYmMZm_.force.y = 0;
    // this->FYmMZm_.force.x = 0;
    // this->FYmMZm_.force.z = 0;
    // this->FYmMZm_.torque.x = 0;
    // this->FYmMZm_.torque.y = 0;
    // this->FYmMZm_.torque.z = 0;

    // Right top
    this->FXmMZp_.force.x = 0;
    // this->FXmMZp_.force.y = 0;
    // this->FXmMZp_.force.z = 0;
    // this->FXmMZp_.torque.x = 0;
    // this->FXmMZp_.torque.y = 0;
    // this->FXmMZp_.torque.z = 0;

    // Right bottom
    this->FXmMZm_.force.x = 0;
    // this->FXmMZm_.force.y = 0;
    // this->FXmMZm_.force.z = 0;
    // this->FXmMZm_.torque.x = 0;
    // this->FXmMZm_.torque.y = 0;
    // this->FXmMZm_.torque.z = 0;

    // Bottom right
    this->FYpMZp_.force.y = 0;
    // this->FYpMZp_.force.x = 0;
    // this->FYpMZp_.force.z = 0;
    // this->FYpMZp_.torque.x = 0;
    // this->FYpMZp_.torque.y = 0;
    // this->FYpMZp_.torque.z = 0;

    // Bottom left
    this->FYpMZm_.force.y = 0;
    // this->FYpMZm_.force.x = 0;
    // this->FYpMZm_.force.z = 0;
    // this->FYpMZm_.torque.x = 0;
    // this->FYpMZm_.torque.y = 0;
    // this->FYpMZm_.torque.z = 0;

    // Left bottom
    this->FXpMZp_.force.x = 0;
    // this->FXpMZp_.force.y = 0;
    // this->FXpMZp_.force.z = 0;
    // this->FXpMZp_.torque.x = 0;
    // this->FXpMZp_.torque.y = 0;
    // this->FXpMZp_.torque.z = 0;

    // Left top
    this->FXpMZm_.force.x = 0;
    // this->FXpMZm_.force.y = 0;
    // this->FXpMZm_.force.z = 0;
    // this->FXpMZm_.torque.x = 0;
    // this->FXpMZm_.torque.y = 0;
    // this->FXpMZm_.torque.z = 0;

  }

  // Destructor
  SpacecraftThrusterForce::~SpacecraftThrusterForce() {
    this->update_connection_.reset();

    // Custom Callback Queue
    this->queue_.clear();
    this->queue_.disable();
    this->rosnode_->shutdown();
    this->callback_queue_thread_.join();

    delete this->rosnode_;
  }

  // Load the controller
  void SpacecraftThrusterForce::Load(physics::ModelPtr parent, sdf::ElementPtr sdf) {
    // Get the world name.
    this->world_ = _model->GetWorld();

    // load parameters
    this->robot_namespace_ = "";
    if (_sdf->HasElement("robotNamespace"))
      this->robot_namespace_ = _sdf->GetElement("robotNamespace")->Get<std::string>() + "/";

    if (!_sdf->HasElement("bodyName"))
    {
      ROS_FATAL_NAMED("force", "force plugin missing <bodyName>, cannot proceed");
      return;
    }
    else
      this->link_name_ = _sdf->GetElement("bodyName")->Get<std::string>();

    this->link_ = _model->GetLink(this->link_name_);
    if (!this->link_)
    {
      ROS_FATAL_NAMED("force", "gazebo_ros_force plugin error: link named: %s does not exist\n",this->link_name_.c_str());
      return;
    }

    if (!_sdf->HasElement("topicName"))
    {
      ROS_FATAL_NAMED("force", "force plugin missing <topicName>, cannot proceed");
      return;
    }
    else
      this->topic_name_ = _sdf->GetElement("topicName")->Get<std::string>();


    // Make sure the ROS node for Gazebo has already been initialized
    if (!ros::isInitialized())
    {
      ROS_FATAL_STREAM_NAMED("force", "A ROS node for Gazebo has not been initialized, unable to load plugin. "
        << "Load the Gazebo system plugin 'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
      return;
    }

    this->rosnode_ = new ros::NodeHandle(this->robot_namespace_);

    // Custom Callback Queue
    ros::SubscribeOptions so = ros::SubscribeOptions::create<geometry_msgs::Wrench>(
      this->topic_name_,1,
      boost::bind( &GazeboRosForce::UpdateObjectForce,this,_1),
      ros::VoidPtr(), &this->queue_);
    this->sub_ = this->rosnode_->subscribe(so);

    // Custom Callback Queue
    this->callback_queue_thread_ = boost::thread( boost::bind( &GazeboRosForce::QueueThread,this ) );

    // New Mechanism for Updating every World Cycle
    // Listen to the update event. This event is broadcast every
    // simulation iteration.
    this->update_connection_ = event::Events::ConnectWorldUpdateBegin(
        boost::bind(&GazeboRosForce::UpdateChild, this));
  }

  // Update the controller
  void GazeboRosForce::UpdateObjectForce(const geometry_msgs::Wrench::ConstPtr& a,
                                         const geometry_msgs::Wrench::ConstPtr& b,
                                         const geometry_msgs::Wrench::ConstPtr& c,
                                         const geometry_msgs::Wrench::ConstPtr& d,
                                         const geometry_msgs::Wrench::ConstPtr& e,
                                         const geometry_msgs::Wrench::ConstPtr& f,
                                         const geometry_msgs::Wrench::ConstPtr& g,
                                         const geometry_msgs::Wrench::ConstPtr& h) {

    // this->wrench_msg_.force.x = _msg->force.x;
    // this->wrench_msg_.force.y = _msg->force.y;
    // this->wrench_msg_.force.z = _msg->force.z;
    // this->wrench_msg_.torque.x = _msg->torque.x;
    // this->wrench_msg_.torque.y = _msg->torque.y;
    // this->wrench_msg_.torque.z = _msg->torque.z;

    this->FYmMZp_.force.y = a->force.y;

    // Top right
    this->FYmMZm_.force.y = b->force.y;

    // Right top
    this->FXmMZp_.force.x = c->force.x;

    // Right bottom
    this->FXmMZm_.force.x = d->force.x;

    // Bottom right
    this->FYpMZp_.force.y = e->force.y;

    // Bottom left
    this->FYpMZm_.force.y = f->force.y;

    // Left bottom
    this->FXpMZp_.force.x = g->force.x;

    // Left top
    this->FXpMZm_.force.x = h->force.x;

  }

  // Update the controller
  void SpacecraftThrusterForce::UpdateChild() {
    this->lock_.lock();
    ignition::math::Vector3d force_a(this->FYmMZp_.force.x,this->FYmMZp_.force.y,this->FYmMZp_.force.z);
    ignition::math::Vector3d force_b(this->FYmMZm_.force.x,this->FYmMZm_.force.y,this->FYmMZm_.force.z);
    ignition::math::Vector3d force_c(this->FXmMZp_.force.x,this->FXmMZp_.force.y,this->FXmMZp_.force.z);
    ignition::math::Vector3d force_d(this->FXmMZm_.force.x,this->FXmMZm_.force.y,this->FXmMZm_.force.z);
    ignition::math::Vector3d force_e(this->FYpMZp_.force.x,this->FYpMZp_.force.y,this->FYpMZp_.force.z);
    ignition::math::Vector3d force_f(this->FYpMZm_.force.x,this->FYpMZm_.force.y,this->FYpMZm_.force.z);
    ignition::math::Vector3d force_g(this->FXpMZp_.force.x,this->FXpMZp_.force.y,this->FXpMZp_.force.z);
    ignition::math::Vector3d force_h(this->FXpMZm_.force.x,this->FXpMZm_.force.y,this->FXpMZm_.force.z);

    //ignition::math::Vector3d torque(this->wrench_msg_.torque.x,this->wrench_msg_.torque.y,this->wrench_msg_.torque.z);

    this->link_->AddForceAtRelativePosition(force_a, this->pos_a);
    this->link_->AddForceAtRelativePosition(force_b, this->pos_b);
    this->link_->AddForceAtRelativePosition(force_c, this->pos_c);
    this->link_->AddForceAtRelativePosition(force_d, this->pos_d);
    this->link_->AddForceAtRelativePosition(force_e, this->pos_e);
    this->link_->AddForceAtRelativePosition(force_f, this->pos_f);
    this->link_->AddForceAtRelativePosition(force_g, this->pos_g);
    this->link_->AddForceAtRelativePosition(force_h, this->pos_h);
    //this->link_->AddTorque(torque);
    this->lock_.unlock();
  }

  // Custom callback queue thread
  void GazeboRosForce::QueueThread() {
    static const double timeout = 0.01;

    while (this->rosnode_->ok()) {
      this->queue_.callAvailable(ros::WallDuration(timeout));
    }
  }

}



// namespace gazebo
// {
// // Register this plugin with the simulator
// GZ_REGISTER_MODEL_PLUGIN(GazeboRosTemplate);
//
// ////////////////////////////////////////////////////////////////////////////////
// // Constructor
// GazeboRosTemplate::GazeboRosTemplate()
// {
// }
//
// ////////////////////////////////////////////////////////////////////////////////
// // Destructor
// GazeboRosTemplate::~GazeboRosTemplate()
// {
// }
//
// ////////////////////////////////////////////////////////////////////////////////
// // Load the controller
// void GazeboRosTemplate::Load( physics::ModelPtr _parent, sdf::ElementPtr _sdf )
// {
//   // Make sure the ROS node for Gazebo has already been initalized
//   if (!ros::isInitialized())
//   {
//     ROS_FATAL_STREAM_NAMED("template", "A ROS node for Gazebo has not been initialized, unable to load plugin. "
//       << "Load the Gazebo system plugin 'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
//     return;
//   }
// }
//
// ////////////////////////////////////////////////////////////////////////////////
// // Update the controller
// void GazeboRosTemplate::UpdateChild()
// {
// }
//
// }
