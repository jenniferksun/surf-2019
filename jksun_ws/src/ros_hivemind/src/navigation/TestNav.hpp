#ifndef TestNav_H
#define TestNav_H
/**
 * TestNav.hpp -- Irene Crowell (icrowell@caltech.edu) 7/3/18
 *
 * Navigation position tracking by integrating the velocity of the TestBot
 * (designed for Framework testing)
 *
 */

#include "Navigation.hpp"
#include "geometry_msgs/Accel.h"
#include "geometry_msgs/Point.h"

#include "std_msgs/String.h"
#include <hivemind/plotting.h>

class TestNav : public Navigation{
private:
    ros::NodeHandle node;
    ros::Subscriber acceleration_sub;
    ros::Subscriber position_sub;
    bool first_loop=true;

    /*For keeping track of what other test bots there are (helps with graphing)*/
    ros::Publisher name_pub;
    ros::Subscriber name_sub;
    std_msgs::String name_msg;
    std::set<std::string> testbots;


    void name_callback(const std_msgs::String &msg);
    int id=-1;

    /*For graphing current pose*/
    hivemind::plotting graph_srv;

    /**
     * Called each time a controller gives an acceleration update
     * @param the acceleration
     */
    void acceleration_callback(const geometry_msgs::Accel &amsg);

    /**
     * Called each time a controller gives a position update
     * @param the position
     */
    void position_callback(const geometry_msgs::Point &pmsg);
public:
    /**
     * Initialize the ROS channel for listening to the velocity
     * @param controller_name the name of the associated controller
     * @param rate            the rate to run navigation_loop()
     * @param initial_position the (x,y,z) where the testbot is starting
     */
    TestNav(std::string controller_name, float rate, Vector3f initial_position);


    /**
     * Integrates the velocity over the timestep to get the new position
     */
    void navigation_loop(const ros::TimerEvent& time);
};
#endif
