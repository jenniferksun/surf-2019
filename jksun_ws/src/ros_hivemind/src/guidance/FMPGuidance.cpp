/**
 * FMPGuidance.cpp -- Irene Crowell (icrowell@caltech.edu) 6/25/18
 *
 * Guidance that directs its controller to move along a series of waypoints read
 * from a trajectory file -- xyz only, no attitude dictated
 *
 * See header file for function details
 */


#include "FMPGuidance.hpp"

FMPGuidance::FMPGuidance(std::string controller_name, float rate)
    : Guidance(controller_name, rate){

    calculate_trajectory(waypoints);//from SESCP -- runs the algorithm for trajectory calculation
    for(Vector3f wp: waypoints){
        State state;
        state.x = wp;
        trajectory.push_back(state);
    }
}

void FMPGuidance::guidance_loop(const ros::TimerEvent& time){
    //TODO: update trajectory
}
