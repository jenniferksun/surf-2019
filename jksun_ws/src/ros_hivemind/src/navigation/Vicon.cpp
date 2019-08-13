/**
* Vicon.cpp -- Irene Crowell (icrowell@caltech.edu) 6/28/18
*
* Navigation position updates based on Vicon motion Capture
*/


#include "Vicon.hpp"

Vicon::Vicon(std::string controller_name, float rate)
: Navigation(controller_name, rate) {
    pos_sub = node.subscribe( "/vicon/"+controller_name + "/" + controller_name,
            1000, &Vicon::position_callback, this);
}

void Vicon::position_callback(const geometry_msgs::TransformStamped &vmsg) {
  // std::cout << vmsg << std::endl;
	ros::Time now = ros::Time::now();
  Vector3f x_old = current_state.x;
  Vector3f xd_old = current_state.xd;
  Quaternionf orientation_old = current_state.orientation;
  current_state.x << vmsg.transform.translation.x , vmsg.transform.translation.y
          ,vmsg.transform.translation.z;

  current_state.orientation.w() = vmsg.transform.rotation.w;
  current_state.orientation.x() = vmsg.transform.rotation.x;
  current_state.orientation.y() = vmsg.transform.rotation.y;
  current_state.orientation.z() = vmsg.transform.rotation.z;

  if(last.isValid()) { // make sure at least 1 time step has passed
      ros::Duration step = now - last;
      current_state.xd = (current_state.x - x_old)/step.toSec();
      current_state.xdd = (current_state.xd - xd_old)/step.toSec();
      current_state.orientationd.coeffs() =
          (current_state.orientation.coeffs() - orientation_old.coeffs())
          /step.toSec();
  }
  last = now;
	/**
        std::cout<< "Current position for " << controller_name << std::endl
            << current_state.x[0]<< ", " << current_state.x[1] <<", "
            << current_state.x[2]<<std::endl;
        /**
        std::cout<<"Current orientation for "<<controller_name<<std::endl
            << "w= "<< current_state.orientation.w()
            << "\tx= "<< current_state.orientation.x()
            << "\ty= "<< current_state.orientation.y()
            << "\tz= "<< current_state.orientation.z()
            <<std::endl;**/

}

void Vicon::navigation_loop(const ros::TimerEvent& time){
    //the position callback takes care of all updates
}
