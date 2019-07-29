#ifndef SATOGUIDANCE_H
#define SATOGUIDANCE_H
/**
 * SATOGuidance.hpp -- Irene Crowell (icrowell@caltech.edu) 7/12/18
 *
 * Guidance Algorithm that coordinates with other controllers to move into a
 * specific formation
 *
 */

#include "Guidance.hpp"
#include <hivemind/SATO.h>
#include <hivemind/SATO_controller.h>

class SATOGuidance : public Guidance{
private:
    bool start=true;
    bool published =false;
    bool init_done = false;
    ros::Time start_time;
    //to communicate with other controllers
    ros::NodeHandle nh;
    ros::Publisher pub;
    ros::Subscriber sub;
    ros::ServiceClient client;

    /** The hardcoded positions for moving into **/
    std::vector<Vector3f> desired_positions =
    /**{Vector3f(5, 0.58104, 1.3139), Vector3f(4.4, 1.1621, 2.1278),
    Vector3f(3.9, 1.7431, 2.9416), Vector3f(3, 2.3241, 3.7555),
    Vector3f(2.1, 1.7431, 2.9416), Vector3f(1.6, 1.1621, 2.1278),
    Vector3f(1, 0.58104, 1.3139), Vector3f(3, 1.1621, 2.1278) };**/
    {Vector3f(0, 0.5, 0), Vector3f(0, 1.5, 0),
    Vector3f(0, 2.5, 0), Vector3f(1, 0.5, 0),
    Vector3f(1, 1.5, 0), Vector3f(1, 2.5, 0),
    Vector3f(2, 0.5, 0), Vector3f(2, 1.5, 0) };

    std::map<std::string,Vector3f> initial_positions;
public:
    /**
     * Set up publishers/subscribers
     * @param controller_name   the name of the associated controller
     * @param rate              the rate to run guidance_loop()
     */
    SATOGuidance(std::string controller_name, float rate);


    /**
     * Calculates the trajectory once by calling the SATO service
     */
    void guidance_loop(const ros::TimerEvent& time);

    /**
     * Sets up and calls the sato algorithm service to get the trajectory
     */
    void sato();

    /**
     * Callback for when other controllers respond with their position and node name
     * @param msg the message from the controller with their name and position
     */
    void callback(const hivemind::SATO_controller& msg);
};
#endif
