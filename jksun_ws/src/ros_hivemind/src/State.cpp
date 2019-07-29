#include "State.hpp"
State3DOF to_3DOF(State s6){
    State3DOF s3;
    Vector3f euler_angles = s6.orientation.toRotationMatrix().eulerAngles(0, 1, 2);
    s3.x3 << s6.x[0] , s6.x[1] , euler_angles[2];
    euler_angles = s6.orientationd.toRotationMatrix().eulerAngles(0, 1, 2);
    s3.xd3 << s6.xd[0] , s6.xd[1] , euler_angles[2];
    euler_angles = s6.orientationdd.toRotationMatrix().eulerAngles(0, 1, 2);
    s3.xdd3 << s6.xdd[0] , s6.xdd[1] , euler_angles[2];
    return s3;
}

State to_6DOF(State3DOF s3){
    State s6;
    s6.x << s3.x3[0] , s3.x3[1] , 0;
    s6.xd << s3.xd3[0] , s3.xd3[1] , 0;
    s6.xdd << s3.xdd3[0] , s3.xdd3[1] , 0;
    s6.orientation = AngleAxisf(0, Vector3f::UnitX())//roll
                    * AngleAxisf(0, Vector3f::UnitY())//pitch
                    * AngleAxisf(s3.x3[2], Vector3f::UnitZ());//yaw
    s6.orientationd = AngleAxisf(0, Vector3f::UnitX())//roll
                    * AngleAxisf(0, Vector3f::UnitY())//pitch
                    * AngleAxisf(s3.xd3[2], Vector3f::UnitZ());//yaw
    s6.orientationdd = AngleAxisf(0, Vector3f::UnitX())//roll
                    * AngleAxisf(0, Vector3f::UnitY())//pitch
                    * AngleAxisf(s3.xdd3[2], Vector3f::UnitZ());//yaw
}

/**
 * Converts the state quaternions/derivatives to a modified rodrigues parameters
 * and derivatives
 * @param s     the state who's quaternions we are converting
 * @param mrp   the returned mrp
 * @param mrpd  the returned mrp derivative
 * @param mrpdd the returned mrp double derivative.
 */
void to_MRP(State s, Vector3f &mrp, Vector3f &mrpd, Vector3f &mrpdd){
    Vector4f q(s.orientation.x(), s.orientation.y(), s.orientation.z(), s.orientation.w());
    Vector4f qd(s.orientationd.x(), s.orientationd.y(), s.orientationd.z(), s.orientationd.w());
    Vector4f qdd(s.orientationdd.x(), s.orientationdd.y(), s.orientationdd.z(), s.orientationdd.w());
    mrp << q[0], q[1], q[2];
    if(1+q[3] == 0){
        std::cerr << "Division by zero in conversion to MRP!!"<<std::endl;
        return;
    }
    mrp /= 1+q[3];

    for(int i=0; i<3; i++){
        mrpd[i] = - q[i] * pow(1+q[3],-2) * qd[3]+ qd[i]/(1+q[3]);

        mrpdd[i] = q[i] * (- pow(1+q[3],-2) * qdd[3] + qd[3] * 2 * pow(1+q[3],-3))
                - qd[i] * pow(1+q[3],-2) * (1 + qd[3])
                + qdd[i] / (1+q[3]);
    }
}

/**
 * Converts a modified rodrigues parameter to a quaternion
 * @param  p the MRP
 * @return   the quaternion
 */
Quaternionf MRP_to_quaternion(Vector3f p){
    Vector4f q;
    q << 1 - p.squaredNorm(), 2*p[0], 2*p[1], 2*p[2];
    q /= 1 + p.squaredNorm();
    return Quaternionf(q[0], q[1], q[2], q[3]);
}

/**
 * Converts a quaternion to a rotation matrix
 * @param  q the quaternion
 * @return   The attitude/rotation matrix
 */
Matrix3f quaternion_to_rotation_matrix(Quaternionf q){
    float q4 = q.w();
    Vector3f q13(q.x(), q.y(), q.z());
    Matrix3f q13X;
    q13X << 0, -q13[2], q13[1],
            q13[2], 0, -q13[0],
            -q13[1], q13[0], 0;
    return (q4*q4 -q13.squaredNorm())*Matrix3f::Identity()
            - 2 * q4 * q13X + 2 * q13 * q13.transpose();
}
