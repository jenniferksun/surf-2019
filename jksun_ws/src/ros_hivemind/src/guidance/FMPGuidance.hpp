#ifndef FMPGUIDANCE_H
#define FMPGUIDANCE_H
/**
 * FMPGuidance.hpp -- Irene Crowell (icrowell@caltech.edu) 6/27/18
 *
 * Guidance that directs its spacecraft to move along a series of
 * waypoints read from a trajectory file
 *
 */

#include "Guidance.hpp"
#include "SESCP/SESCP.hpp"
#include <fstream>

class FMPGuidance : public Guidance{
private:
    /* The  waypoints to travel along*/
    std::vector<Vector3f> waypoints;
public:

    /**
     * Read in the Trajectory file and initialize guidance
     * @param controller_name the name of the associated controller
     * @param rate            the rate to run guidance_loop()
     */
    FMPGuidance(std::string controller_name, float rate);

    /**
     * Checks on the status of the controllers's position, and updates
     * the waypoint goal as it reaches each one.
     */
    void guidance_loop(const ros::TimerEvent& time);
};
#endif
