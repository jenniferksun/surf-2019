#ifndef SESCP_HPP
#define SESCP_HPP
// Code to perform Spherical Expansion Sequential Convex Programming in C++ (mostly)
// Written by Rebecca Foust (foust3@illinois.edu)
// Currently limited functionality is achieved, search TODO to see what needs to be done

#include <cmath>
#include <stdexcept>
#include <iostream>
#include <ros/ros.h>
#include <numeric>

#include <eigen3/Eigen/Dense>

#include <ctime>
#include <sstream>
#include <fstream>
#include <string>
#include <pwd.h>

#include <hivemind/CVXpy.h>
// #include <frmp_generation/diffFlat.h>
#include <geometry_msgs/Point.h>
#include <std_msgs/Int64.h>
#include <std_msgs/Float64.h>
#include <std_msgs/Float64MultiArray.h>
#include <std_msgs/Int64MultiArray.h>
#include <geometry_msgs/PoseArray.h>
#include <geometry_msgs/Pose.h>
// #include <frmp_generation/Traj.h>

int calculate_trajectory(std::vector<Eigen::Vector3f> &trajectory);
#endif
