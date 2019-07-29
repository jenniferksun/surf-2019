#include "Controller.hpp"
/**
 * Controller.cpp -- Irene Crowell (icrowell@caltech.edu) 8/7/18
 *
 * Implementation of the Controller class -- see header file for class & method
 * details
 *
 */
Controller::Controller(std::string name, float att_rate, float pos_rate,
    float att_error_bound, float pos_error_bound, bool testing){
    this->att_error_bound = att_error_bound;
    this->pos_error_bound = pos_error_bound;
    this->name = name;
    this->att_rate = att_rate;
    this->pos_rate = pos_rate;
    this->testing = testing;
    attitude_timer = nh.createTimer(ros::Duration(1.0 / att_rate), &Controller::attitude_control_callback, this);
    position_timer = nh.createTimer(ros::Duration(1.0 / pos_rate), &Controller::position_control_callback, this);
    if(testing){
        accel_pub = nh.advertise<geometry_msgs::Accel>("acceleration/"+name, 1000);
        pos_pub = nh.advertise<geometry_msgs::Point>("position/"+name, 1000);
    }
}


void Controller::attitude_control_callback(const ros::TimerEvent& time){
    update_state(); //Fetches the current state from navigation
    update_desired(); //Fetches the desired trajectory from guidance and updates the current waypoint
    attitude_control_loop(time); //defined in subclass
}

void Controller::position_control_callback(const ros::TimerEvent& time){
    update_state(); //Fetches the current state from navigation
    update_desired(); //Fetches the desired trajectory from guidance and updates the current waypoint
    position_control_loop(time); //defined in subclass
}

void Controller::update_state(){
    nav->get_state(current_state);
}

void Controller::update_trajectory(){
    trajectory = guide->get_trajectory();
}

void Controller::update_desired(){
    update_trajectory();
    /** dont want to move if we haven't recieved a trajectory yet -- the
      default desired state is (0,0,0) for all controllers, and they probably
      wont actually start there
      **/
    if(trajectory.size() == 0){
        desired_state.x = current_state.x;
        desired_state.orientation = current_state.orientation;
    }
    else if(waypoint < trajectory.size()){
        desired_state = trajectory[waypoint];
    }
    Vector3f pos_offset = current_state.x - desired_state.x;
    pos_offset[2] = 0; //TODO: undo this --- just while z stage not working
    float pos_error = (pos_offset).norm();

    //std::cout << "Position Error for "<<name << "=" << pos_error << std::endl;
    float att_error = fabs(desired_state.orientation.angularDistance(current_state.orientation));
    //std::cout << "Angular Error for "<<name << "=" << att_error << std::endl;
    if(pos_error <= pos_error_bound  && att_error <= att_error_bound){
        if(waypoint+1 < trajectory.size()){
            waypoint++;
            std::cout << "-------------------------Setting new waypoint for "<< name
            <<"---------------------------"<<std::endl;
            desired_state = trajectory[waypoint];
        }
        else{
            desired_state.x = current_state.x;
            desired_state.orientation = current_state.orientation;
        }
    }
}

void Controller::test_acceleration(Vector3f accel){
    if(testing){
        accel_msg.linear.x = accel[0];
        accel_msg.linear.y = accel[1];
        accel_msg.linear.z = accel[2];
        accel_pub.publish(accel_msg);
    }
}
void Controller::test_position(Vector3f pos){
    if(testing){
        pos_msg.x = pos[0];
        pos_msg.y = pos[1];
        pos_msg.z = pos[2];
        pos_pub.publish(pos_msg);
    }
}

Matrix3f Controller::get_z(Vector3f q){
    Matrix3f z = Matrix3f::Zero();
    z(0,0) = 0.25 * (1 + q(0)*q(0) - q(1)*q(1) - q(2)*q(2));
    z(0,1) = 0.25 * (2 * (q(0)*q(1) - q(2)));
    z(0,2) = 0.25 * (2 * (q(0)*q(2) + q(1)));

    z(1,0) = 0.25 * (2 * (q(0)*q(1) + q(2)));
    z(1,1) = 0.25 * (1 - q(0)*q(0) + q(1)*q(1) - q(2)*q(2));
    z(1,2) = 0.25 * (2 * (q(1)*q(2) - q(1)));

    z(2,0) = 0.25 * (2 * (q(2)*q(1) - q(1)));
    z(2,1) = 0.25 * (2 * (q(2)*q(1) + q(0)));
    z(2,2) = 0.25 * (1 - q(0)*q(0) - q(1)*q(1) + q(2)*q(2));

    return z;
}

Vector3f Controller::get_body_rates(){
    Vector3f q, qd, qdd;
    to_MRP(current_state, q, qd, qdd);
    Matrix3f z = get_z(q);
    return z.inverse() * qd;
}

void Controller::reference_signal(Vector3f & w_ref, Vector3f & wd_ref){
    Vector3f q, qd, qdd, q_des, qd_des, qdd_des;
    to_MRP(current_state, q, qd, qdd);
    to_MRP(desired_state, q_des, qd_des, qdd_des);

    Matrix3f sig = Matrix3f::Identity();
    Matrix3f z = get_z(q);


    Matrix3f sqd;
    sqd <<  0 ,     -qd(2), qd(1),
            qd(2),  0,      -qd(0),
            -qd(1), q(0),   0;

    Matrix3f zd = 0.5 * (
        (-0.5 * Matrix3f::Identity() * (qd.transpose() * q + q.transpose() * qd)(0))
        + (qd * q.transpose() + q * qd.transpose()) + sqd);

    w_ref = z.inverse() * (qd_des + sig*(q_des - q));
    wd_ref = -(z.inverse() * zd * z.inverse() * (qd_des + sig * (q_des -q)))
            + (z.inverse() * (qdd_des + sig * (qd_des - qd)));
}
