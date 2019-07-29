#include "geometry_msgs/TransformStamped.h"
#include "ros/ros.h"
#include <stdlib.h>     /* srand, rand */
#include <time.h>       /* time */

double fRand(double fMin, double fMax)
{
    double f = (double)rand() / RAND_MAX;
    return fMin + f * (fMax - fMin);
}
/**
 * Generates random Ppose data and publishes it to the vicon channel. Essentially
 * verifies that the vicon code is functioning correctly, without having to connect
 * to the vicon itself.
 */
int main( int argc, char* argv[] )
{
    srand (time(NULL));
    ros::init(argc, argv, "dummy data", ros::init_options::AnonymousName);
    ros::start();
    ros::NodeHandle n;
    std::string controller_name;
    n.getParam("name", controller_name);
    ros::Publisher vicon_pub = n.advertise<geometry_msgs::TransformStamped>("/vicon/"+controller_name + "/" + controller_name, 1000);

    ros::Rate loop_rate(10);
    geometry_msgs::TransformStamped msg;
    while (ros::ok())
    {
        msg.transform.translation.x = fRand(-50,50);
        msg.transform.translation.y = fRand(-50,50);
        msg.transform.translation.z = fRand(-50,50);
        /**want to ensure normalized **/
        float w = fRand(0,1.0);
        float x = fRand(0,1.0);
        float y = fRand(0,1.0);
        float z = fRand(0,1.0);

        msg.transform.rotation.w = w / sqrt(pow(w,2)+pow(x,2)+pow(y,2)+pow(z,2));
        msg.transform.rotation.x = x / sqrt(pow(w,2)+pow(x,2)+pow(y,2)+pow(z,2));
        msg.transform.rotation.y = y / sqrt(pow(w,2)+pow(x,2)+pow(y,2)+pow(z,2));
        msg.transform.rotation.z = z / sqrt(pow(w,2)+pow(x,2)+pow(y,2)+pow(z,2));
        msg.header.stamp = ros::Time::now();
        vicon_pub.publish(msg);
        loop_rate.sleep();
    }


    return 0;
}
