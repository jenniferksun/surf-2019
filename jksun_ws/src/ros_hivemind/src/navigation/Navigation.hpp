#ifndef NAVIGATION_H
#define NAVIGATION_H
/**
 * Navigation.hpp -- Irene Crowell (icrowell@caltech.edu) 6/28/18
 *
 * Class header file for tracking a controller's position in some way
 */

#include "ros/ros.h"
#include <eigen3/Eigen/Dense>
#include "../State.hpp"
using namespace Eigen;

/**
 * Abstract class that tracks a controller's position
 *
 * Subclasses should implement navigation_loop to update the position
 */
class Navigation {
private:
    ros::NodeHandle nh;
    /** For use by the timer for periodic state updates **/
    void navigation_callback(const ros::TimerEvent& time){
        navigation_loop(time);
    }
protected:
    ros::Timer timer;
    State current_state;

    std::string controller_name;

    /**
     * Run every time step to allow updates to current state
     */
    virtual void navigation_loop(const ros::TimerEvent& time)=0;


public:
    Navigation(std::string controller_name, float rate){
        this->controller_name = controller_name;
        timer = nh.createTimer(ros::Duration(1/rate), &Navigation::navigation_callback, this);
    }

    void get_state(State &state){
        state = this->current_state;
    }




};
#endif
