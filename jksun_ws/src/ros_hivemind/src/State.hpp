#ifndef STATE_HPP
#define STATE_HPP
#include <eigen3/Eigen/Dense>
#include <iostream>
using namespace Eigen;
struct State{
    Vector3f x ={0,0,0};//position
    Vector3f xd ={0,0,0};//velocity
    Vector3f xdd = {0,0,0};//acceleration
    Quaternionf orientation={0,0,0,0};
    Quaternionf orientationd={0,0,0,0};//angular velocity
    Quaternionf orientationdd={0,0,0,0};//angular accel
};

struct State3DOF{
    Vector3f x3 ={0,0,0};//position -- x,y,theta yaw
    Vector3f xd3 ={0,0,0};//velocity -- xd, yd, thetad
    Vector3f xdd3 = {0,0,0};//acceleration -- xdd, ydd, thetadd
};

State3DOF to_3DOF(State s6);

State to_6DOF(State3DOF s3);

void to_MRP(State s, Vector3f &mrp, Vector3f &mrpd, Vector3f &mrpdd);

Quaternionf MRP_to_quaternion(Vector3f p);

Matrix3f quaternion_to_rotation_matrix(Quaternionf q);
#endif
