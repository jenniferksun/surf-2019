#ifndef CONTROLLER_H
#define CONTROLLER_H
#include "../navigation/Navigation.hpp"
#include "../guidance/Guidance.hpp"
/**
 * Controller.hpp -- Irene Crowell (icrowell@caltech.edu) 8/7/18
 *
 * Controllers correspond to some physical system, for example a spacecraft
 * simulator or the flying ambulance. Based on their current position as
 * received from Navigation, and the target trajectory from a Guidance Algorithm,
 * they are able to control their motion so as to move towards the target
 * position.
 *
 * Subclasses implement the position_control_loop() and attitude_control_loop()
 * which are periodically run after updates are fetched from Guidance and
 * Navigation.
 */

 #include <iostream>
 #include <eigen3/Eigen/Dense>
 #include "../State.hpp"
 #include "geometry_msgs/Accel.h"
  #include "geometry_msgs/Point.h"
 #include "geometry_msgs/Twist.h"
using namespace Eigen;

/**
 * Abstract class for controlling the movement of a physical system
 */
class Controller{
private:
    ros::NodeHandle nh;

    /*for publishing the acceleration when testing*/
    bool testing;
    ros::Publisher accel_pub;
    geometry_msgs::Accel accel_msg;

    ros::Publisher pos_pub;
    geometry_msgs::Point pos_msg;


    Guidance* guide;
    Navigation* nav;


    /** For use by the timer for periodic action **/
    void attitude_control_callback(const ros::TimerEvent& time);
    void position_control_callback(const ros::TimerEvent& time);

public:


    /**
     * Initialize the cotnroller's state values
     * @param name            the name of the controller
     * @param att_rate        the rate in Hz to run the attitude controller at
     * @param pos_rate        the rate in Hz to run the position controller at
     * @param att_error_bound the attitude error bound the system can achieve
     * @param pos_error_bound the position error bound the system can achieve
     * @param testing         whether to broadcast control data for test graphs
     */
    Controller(std::string name, float att_rate, float pos_rate, float att_error_bound, float pos_error_bound, bool testing=false);

    /**
     * Set the associated guidance algorithm
     * @param g The guidance object to fetch instructions from
     */
    void set_guidance(Guidance * g){
        guide = g;
    }

    /**
     * Set the associated navigation system
     * @param n The navigation object to fetch position data from
     */
    void set_navigation(Navigation *n){
        nav = n;
    }

protected:
    int waypoint = 0;//index of current waypoint along the trajectory
    std::vector<State> trajectory;
    float att_rate;
    float pos_rate;
    ros::Timer attitude_timer;
    ros::Timer position_timer;

    float att_error_bound;//the error bound this controller can achieve for attitude
    float pos_error_bound;//the error bound this controller can achieve for position

    /* pose/velocity/acceleration data */
    State current_state;
    State desired_state; //point along the trajectory the controller currently wants to achieve


    std::string name;
    /**
     * Fetch the latest state from the Navigation System
     */
    virtual void update_state();

    /**
     * Fetch the latest desired trajectory from the Guidance System
     */
    void update_trajectory();

    /**
     * Calculate current waypoint target
     */
    virtual void update_desired();

    /**
     * Publishes acceleration to the TestNav system when testing = true
     * @param accel current output acceleration (x,y,z) from the controller
     */
    void test_acceleration(Vector3f accel);

    /**
     * Publishes a position to the TestNav system when testing = true. can
     * be used instead of test_acceleration to quickly check trajectories. should
     * not be used for testing any actual controllers (which dont teleport)
     *
     * @param pos current position (x,y,z) of the controller
     */
    void test_position(Vector3f pos);

    /**
     * Change the loop rate of the attitude controller
     * @param att_rate the new rate
     */
    void set_att_rate(float att_rate){
        this->att_rate = att_rate;
        attitude_timer.setPeriod(ros::Duration(1.0/att_rate));
    }

    /**
     * Change the loop rate of the position controller
     * @param pos_rate the new rate
     */
    void set_pos_rate(float pos_rate){
        this->pos_rate = pos_rate;
        position_timer.setPeriod(ros::Duration(1.0/pos_rate));
    }


    /**
     * Calculates the transformation matrix from body rates to MRP rates
     * @param  q MRP of current attitude
     * @return   the transformation matrix z
     */
    Matrix3f get_z(Vector3f q);

    /**
     * Calculates the current body rates of the controller
     * @return The controller's body rates
     */
    Vector3f get_body_rates();

    /**
     * Calculates a body rate trajectory by looking at the current
     * orientatation/derivatives, and the desired
     * @param w_ref  the returned reference body rate
     * @param wd_ref the returned reference body rate derivative (acceleration)
     */
    void reference_signal(Vector3f & w_ref, Vector3f & wd_ref);

    /**
     * Run every time step to allow updates to attitude control
     */
    virtual void attitude_control_loop(const ros::TimerEvent& time)=0;

    /**
     * Run every time step to allow updates to position control
     */
    virtual void position_control_loop(const ros::TimerEvent& time)=0;



};

#endif
