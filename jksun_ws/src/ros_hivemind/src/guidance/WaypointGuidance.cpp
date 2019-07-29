/**
 * WaypointGuidance.cpp -- Irene Crowell (icrowell@caltech.edu) 6/28/18
 *
 * Guidance Algorithm that directs its controller to move along a series of
 * waypoints (hardcoded)
 *
 * See header file for function details
 */


#include "WaypointGuidance.hpp"

WaypointGuidance::WaypointGuidance(std::string controller_name, float rate)
    : Guidance(controller_name, rate){
	for(int i=0; i<pos_waypoints.size(); i++){
		State state;
		state.x = pos_waypoints[i];
		if(i < vel_waypoints.size() && i  < accel_waypoints.size()){
			state.xd = vel_waypoints[i];
			state.xdd = accel_waypoints[i];
		}
		trajectory.push_back(state);
	}
}

void WaypointGuidance::guidance_loop(const ros::TimerEvent& time){
    //do nothing -- we don't need to update the trajectory ever
}
