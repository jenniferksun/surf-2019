#ifndef TESTBOT_H
#define TESTBOT_H
/**
 * TestBot.hpp -- Irene Crowell (icrowell@caltech.edu) 7/12/18
 *
 * Class header file for a test controller that send its position to TestNav for graphing.
 */

#include <iostream>
#include "Controller.hpp"

#include "ros/ros.h"
#include "../constants.hpp"

class TestBot : public Controller{
public:
    /**
     * Initializes the test controller with its publishers/subscribers.
     * @param name  The name of the testbot
     */
    TestBot(std::string name);

    /**
     * Continuously called for the TestBot to update/send its position
     */
    void position_control_loop(const ros::TimerEvent& time);

    /**
     * Currently does nothing
     */
    void attitude_control_loop(const ros::TimerEvent& time);

};
#endif
