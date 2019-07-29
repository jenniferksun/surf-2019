#ifndef SCSIM6DOF_H
#define SCSIM6DOF_H
/**
 * SCSim6DOF.hpp -- Irene Crowell (icrowell@caltech.edu) 7/12/18
 *
 * Class header file for a 6DOF Spacecraft Simulator, which controls its thrusters
 * and reaction wheels to effectively move as dictated by the Guidance algorithm.
 */

#include <iostream>
#include "Controller.hpp"

#include "ros/ros.h"
#include <hivemind/Thrusters8.h>//TODO
#include "../constants.hpp"
#include <hivemind/reaction_wheel.h>
/**
* SpaceCraft Simulator capable of movement via PID control
*/
class SCSim6DOF : public Controller{
private:
    /* thruster ranges */
    float thrust_max;
    float thrust_min;
    float deadband;

    /*for communicating with the thrusters*/
    ros::NodeHandle node;
    ros::Publisher thruster_pub;
    hivemind::reaction_wheel wheel_srv;

    /** For attitude dynamics**/
    Matrix<float, 3, 4> G;
    Matrix<float, 4, 3> G_pinv;
    Matrix3f Js;
    float Jw;
    float m_s;
    float m_w;
    Vector3f r_cg;
    float g;
    Vector3f g_vec;

    /**For position control**/
    float kP;
    float kD;

    Vector4f get_wheel_dynamics(Vector3f control);
    Vector3f get_attitude_control(Vector3f w, Vector3f w_ref, Vector3f wd_ref, Vector4f wheel_momentum, Matrix3f R);
    Vector2f get_position_control();
    Matrix<float, 16, 1> thrust_times(Matrix<float, 16, 1> thruster_mapping);
    Matrix<float, 16, 1> adjusted_thrust_times(Matrix<float, 16, 1>  thrust_times);
    Matrix<float, 16, 1> position_thruster_mapping(Vector2f xy_control);
    Matrix<float, 16, 1> attitude_thruster_mapping(Vector3f control);
    void send_thruster_command(Matrix<float, 16, 1> thrust);


    void set_thruster_range();
public:
    /**
     * Initializes the simulator with its publishers/subscribers.
     * @param name  The name of the simulator (ex: sc1)
     */
    SCSim6DOF(std::string name, bool testing = false);

    /**
     * Continuously called for the simulator to update its thruster values
     */
    void position_control_loop(const ros::TimerEvent& time);

    /**
     * Continuously called for the simulator to update its reaction wheel
     */
    void attitude_control_loop(const ros::TimerEvent& time);


    /**
     * Set PID gains for thrusters
     */
    void set_gains(double kP, double kD){
        this->kP = kP;
        this->kD=kD;
        std::cout<<"kP: "<<kP<<"\t"<<"kD: "<<kD<<std::endl;
       //TODO: add in kI support?
    }
};
#endif
