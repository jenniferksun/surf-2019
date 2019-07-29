#ifndef WAYPOINTGUIDANCE_H
#define WAYPOINTGUIDANCE_H
/**
 * WaypointGuidance.hpp -- Irene Crowell (icrowell@caltech.edu) 6/28/18
 *
 * Guidance algorithm that directs its spacecraft to move along a series of
 * waypoints (hardcoded)
 *
 */

#include "Guidance.hpp"

class WaypointGuidance : public Guidance{
private:
    std::vector<Vector3f> pos_waypoints
//	={Vector3f(0,0,0)};
        //= {Vector3f(0, -1.5708, 0), /**Vector3f(0.3420, -1.2217, 0),**/ Vector3f(0.6428, -0.8727, 0),
        //    /**Vector3f(0.8660, -0.5236, 0),**/ Vector3f(0.9848,-0.1745, 0), /**Vector3f(0.9848,0.1745, 0),**/
        //    Vector3f(0.8660, 0.5236, 0), /**Vector3f(0.6428, 0.8727, 0),**/ Vector3f(0.3420, 1.2217, 0),
        //    Vector3f(0, 1.5708, 0)};
        //= {Vector3f(5,0,5), Vector3f(5,5,10), Vector3f(0,5,15), Vector3f(0,0,20)};
        //={Vector3f(0,6,0), Vector3f(-3.5,1.25,0), Vector3f(2,4,0), Vector3f(-3.75,5.75,0), Vector3f(0,0,0)};
		={Vector3f(0, -1.0, 0),
		Vector3f(0.5878, -0.8090, 0),
		Vector3f(0.9511, -0.3090, 0),
		Vector3f(0.9511, 0.3090, 0),
		Vector3f(0.5878, 0.8090, 0),
		Vector3f(0, 1.0, 0),
		Vector3f(0, 1.0, 0)};
	std::vector<Vector3f> vel_waypoints = {};
	/**	={Vector3f(0.0628, 0, 0),
		Vector3f(0.0508, -0.0369, 0),
		Vector3f(0.0194, -0.0598, 0),
		Vector3f(-0.0194, -0.0598, 0),
		Vector3f(-0.0508, -0.0369, 0),
		Vector3f(-0.0628, 0, 0),
		Vector3f(0, 0, 0)};**/
	std::vector<Vector3f> accel_waypoints = {};
	/**	={Vector3f(0, 0.0039, 0),
		Vector3f(0.0023, 0.0032, 0),
		Vector3f(0.0038, 0.0012, 0),
		Vector3f(0.0038, -0.0012, 0),
		Vector3f(0.0023, -0.0032, 0),
		Vector3f(0, -0.0039, 0),
		Vector3f(0, 0, 0)};**/
public:
    /**
     * Initialize the Guidance Algorithm for a controller
     * @param controller_name the name of the associated controller
     * @param control_rate    the rate to run guidance_loop()
     */
    WaypointGuidance(std::string controller_name, float rate);


    /**
     * Does nothing here, since tbe trajectory is hardcoded
     */
    void guidance_loop(const ros::TimerEvent& time);
};
#endif
