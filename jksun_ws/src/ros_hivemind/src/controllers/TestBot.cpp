
/**
 * TestBot.cpp -- Irene Crowell (icrowell@caltech.edu) 7/12/18
 *
 * A test controller that send its position to TestNav for graphing. Mostly useful
 * for checking generated trajectories
 *
 * (See .hpp file for function details)
 */
#include "TestBot.hpp"

TestBot::TestBot(std::string name)
    : Controller(name, TEST_RATE, TEST_RATE, TEST_ERROR, TEST_ERROR, true){

}

void TestBot::position_control_loop(const ros::TimerEvent& time){
    test_position(desired_state.x);
}

void TestBot::attitude_control_loop(const ros::TimerEvent& time){
}
