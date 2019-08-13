#ifndef VICON_H
#define VICON_H
/**
 * Vicon.hpp -- Irene Crowell (icrowell@caltech.edu) 6/28/18
 *
 * Navigation position tracking using a Vicon Motion Capture system
 *
 */

#include "Navigation.hpp"
#include "geometry_msgs/TransformStamped.h"

class Vicon : public Navigation {
private:
    ros::NodeHandle node;
    ros::Subscriber pos_sub;
    ros::Time last = ros::Time(0);
    /**
     * Called each time the Vicon gives a position update
     * @param vmsg the ROS message from the Vicon with the new position
     */
    void position_callback(const geometry_msgs::TransformStamped &vmsg);

public:
    /**
     * Initialize the Vicon's ROS channel for listening to the position
     * @param controller_name the name of the associated controller
     * @param control_rate    the rate to run navigation_loop()
     */
    Vicon(std::string controller_name, float control_rate);


    /**
     * An empty loop, since the position is updated through ROS callbacks
     */
    void navigation_loop(const ros::TimerEvent& time);
};
#endif
