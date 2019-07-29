
/**
 * SCSim6DOF.cpp -- Irene Crowell (icrowell@caltech.edu) 7/12/18
 *
 * A 6DOF Spacecraft Simulator, which controls its thrusters and reaction wheels
 * to effectively move as dictated by the Guidance algorithm.
 *
 * (See .hpp file for function details)
 */
#include "SCSim6DOF.hpp"

SCSim6DOF::SCSim6DOF(std::string name, bool testing)
    : Controller(name, SCSIM_ATT_RATE, SCSIM_POS_RATE, SCSIM_ATT_ERROR, SCSIM_POS_ERROR, testing){
    thruster_pub = node.advertise<hivemind::Thrusters8>(name+"/thruster_msg", 1000);//TODO -- change to 16 thrusters
    set_thruster_range(); //based on position rate
    //position constants

    //attitude constants
    r_cg = Vector3f(0,0,-0.019066);
    g_vec = Vector3f(0,0,1);
    G << 0.58622, -0.58622, -0.58622, 0.58622,
        0.58622, 0.58622, -0.58622, -0.58622,
        0.55919, 0.55919, 0.55919, 0.55919;
    G_pinv << 0.426461 , 0.426461 , 0.447075,
        -0.426461 , 0.426461 , 0.447075,
        -0.426461 , -0.426461 , 0.447075,
        0.426461 , -0.426461 , 0.447075;//NOTE: if G ever changes, recalculate this!
    Js << 1.4147, 0.02, 0,
        0.02, 1.4447, 0,
        0, 0, 1.8363;
    Jw = 3.6452e-4;
    m_s =27;
    m_w = 0.6;
    g = 9.81;
    kP = 0.8;
    kD = 8;//TODO: find correct gain values
}

void SCSim6DOF::set_thruster_range(){
    //TODO: set ranges based on experiment
    thrust_max = 1000/this->pos_rate;
    thrust_min = 100;
    deadband = 20;
}


Vector3f SCSim6DOF::get_attitude_control(Vector3f w, Vector3f w_ref, Vector3f wd_ref,
    Vector4f wheel_momentum, Matrix3f R){
    float m_total = m_s + 4*m_w;
    Matrix3f r_c;
    r_c << 0, -r_cg(2), r_cg(1),
        r_cg(2), 0, -r_cg(0),
        -r_cg(1), r_cg(0), 0;
    Vector3f Fg = m_total * g * r_c * R.transpose() * g_vec;
    Matrix3f  Sw;
    Sw << 0, -w(2), w(1),
        w(2), 0, -w(0),
        -w(2), w(1), 0;

    Matrix3f K = 20 * Matrix3f::Identity();

    Vector3f sj = Js * w;
    Matrix3f S;
    S << 0, -sj(2), sj(1),
        sj(2), 0, -sj(0),
        -sj(1), sj(0), 0;

    return Js*wd_ref - S*w_ref - K*(w - w_ref) - Fg + Sw * G * wheel_momentum;
}

Vector4f SCSim6DOF::get_wheel_dynamics(Vector3f control){
    return -G_pinv * control;
}

Vector2f SCSim6DOF::get_position_control(){
    Vector3f error = (current_state.x - desired_state.x);
    error[2]=0; //TODO: remove
	std::cout<<"error: "<< error.transpose()<<std::endl;
/**
    if(error.norm() <= SMALL_ERROR && error.norm() >=  SCSIM_POS_ERROR){
        //if(current_state.xd.norm() < SMALL_VELOCITY){
		std::cout <<"increasing kP"<< std::endl;
            kP = KP_BIG;
            kD = KD_DEFAULT;
	//}

        else if(current_state.xd.norm() > BIG_VELOCITY){
		std::cout<<"increasing kD"<<std::endl;
            kP = KP_DEFAULT;
            kD = KD_BIG;
        }
        else{
            kP = KP_DEFAULT;
            kD = KD_DEFAULT;
        }
    }
	else{
		kP = KP_DEFAULT;
		kD = KD_DEFAULT;
	}

**/
    Vector3f control =desired_state.xdd - kD*(current_state.xd - desired_state.xd)
            - kP*(current_state.x - desired_state.x);

    Vector2f xy_control;
    xy_control << control[0], control[1];
    test_acceleration(Vector3f(control[0], control[1], 0));//allows for position graphing if testing=true
    return xy_control;
}

Matrix<float, 16, 1> SCSim6DOF::adjusted_thrust_times(Matrix<float, 16, 1>  thrust_times){
    //Adust thruster values to be within acceptable range
    //TODO: use different model
    float slope = (thrust_max - thrust_min)/ (1-deadband);
    float intercept = (thrust_min - (thrust_max*deadband))/ (1-deadband);

    for(int i = 0; i < 16; i++ ) {
        float v = thrust_times(i);
        if (v < deadband){
            thrust_times(i)= 0;
        }
	else if(v>=deadband && v<thrust_min){
		thrust_times(i)=thrust_min;
	}
/**
        else if (v>=deadband && v<thrust_max){
            thrust_times(i) = (slope*v) + intercept ;
        }**/
        else if (v >= thrust_max){
            thrust_times(i) = thrust_max;
        }
    }
	std::cout<< "adjusted dt:"<<std::endl<<thrust_times.transpose()<<std::endl;
    return thrust_times;
}

Matrix<float, 16, 1> SCSim6DOF::position_thruster_mapping(Vector2f xy_control){
    Matrix<float, 3, 8> H;
    H << -1, -1, 0, 0, 1, 1, 0, 0,
        0, 0, -1, -1, 0, 0 , 1, 1,
        0, 0, 0, 0, 0, 0, 0, 0;
    Matrix3f RT = quaternion_to_rotation_matrix(current_state.orientation).transpose();
    Matrix<float, 3, 8> H_rotated = RT * H;
    Matrix<float, 2, 8> H_rotated2;
    H_rotated2 << H_rotated.row(0),  H_rotated.row(1);
    Matrix<float, 16, 1> thrust;
    thrust << H_rotated2.jacobiSvd(ComputeFullU | ComputeFullV).solve(xy_control), Matrix<float, 8, 1>::Zero();
    	std::cout<<"Thrust Force Values:" <<std::endl << thrust.transpose()<<std::endl;
	return thrust;
}

Matrix<float, 16, 1> SCSim6DOF::thrust_times(Matrix<float, 16, 1> thruster_mapping){
    Matrix<float, 16, 1> dt = 4.829 * thruster_mapping / this->pos_rate - Matrix<float, 16, 1>::Constant(0.007686);
    	dt*=1000; //must be in ms for sending/deadbad
	std::cout<< "dt:"<<std::endl << dt.transpose()<<"\n" <<std::endl;
	return dt;
}

Matrix<float, 16, 1> SCSim6DOF::attitude_thruster_mapping(Vector3f control){
    Matrix<float, 3, 16> Bm;
    float l = 0.19;
    float b = 0.19;
    float h1 = 0.23;
    float h2 = 0.23;
    Bm << MatrixXf::Zero(1,8), 0, 0, h1, -h2, 0, 0, -h1, h2,
        MatrixXf::Zero(1,8), h1, -h2, 0, 0, -h1, h2, 0, 0,
        -l, l, -b, b, -l, l, -b, b, MatrixXf::Zero(1,8);
    Matrix<float, 16, 1> thrust = Bm.jacobiSvd(ComputeFullU | ComputeFullV).solve(control);
    return thrust;
}

void SCSim6DOF::send_thruster_command(Matrix<float, 16, 1> thrust){
    hivemind::Thrusters8 msg;
    msg.FXmMZm = thrust(0);
    msg.FXmMZp = thrust(1);
    msg.FYmMZm = thrust(2);
    msg.FYmMZp = thrust(3);
    msg.FXpMZm = thrust(4);
    msg.FXpMZp = thrust(5);
    msg.FYpMZm = thrust(6);
    msg.FYpMZp = thrust(7);
    /**msg.FZpMYm = thrust(8);
    msg.FZmMYp = thrust(9);
    msg.FZpMXp = thrust(10);
    msg.FZmMXm = thrust(11);
    msg.FZpMYp = thrust(12);
    msg.FZmMYm = thrust(13);
    msg.FZmMXp = thrust(14);
    msg.FZpMXm = thrust(15);**/
    //TODO -- change to 16 thrusters
    msg.header.stamp = ros::Time::now();
    thruster_pub.publish(msg);
}

void SCSim6DOF::position_control_loop(const ros::TimerEvent& time){
    Vector2f xy_control = get_position_control(); //calculate desired movement/speed
    Matrix<float, 16, 1> thrust = position_thruster_mapping(xy_control); //map control to thruster forces
    Matrix<float, 16, 1> times = thrust_times(thrust);
    times = adjusted_thrust_times(times);//keep thruster values within acceptable ranges
//	std::cout << "error\t"<< "\t|" << "thrust force\t" << "\t|" << "dt\t" << "\t|" << "adjusted dt" << std::endl;
    send_thruster_command(times);      //actually control the thrusters by sending a ROS message
}

void SCSim6DOF::attitude_control_loop(const ros::TimerEvent& time){
    Vector3f w_ref, wd_ref;
    reference_signal(w_ref, wd_ref); //calculated from current/desired orientation
    Vector3f w = get_body_rates();
    //TODO: get wheel momentum
    Vector4f wheel_momentum;
    Matrix3f R  = quaternion_to_rotation_matrix(current_state.orientation);
    Vector3f control = get_attitude_control(w, w_ref, wd_ref, wheel_momentum, R);
    Vector4f dyn = get_wheel_dynamics(control);
    //TODO: map to speed/thrust, send wheel commands
    for(int i=0; i<4; i++){
        wheel_srv.request.wheel_no = i;
        wheel_srv.request.rpm = 0;
        ros::service::call("reaction_wheel", wheel_srv);
    }
}
