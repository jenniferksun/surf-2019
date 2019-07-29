#ifndef ENVIRONMENTS_HPP
#define ENVIRONMENTS_HPP
// Specifies which environment to load into the SESCP program
// Written by Rebecca Foust, limited functionality achieved. Search TODO for remaining work
#include <eigen3/Eigen/Dense>
#include <cmath>
#include <iostream>

using namespace std;
using namespace Eigen;
// Multiple SCP loops
int num_optimize_loops = 3;

// SPECIFY WHICH DYNAMICS TO USE -----------------------------------------------------
// 1: Distance Minimization: x[k+1]=x[k]+u[k]
// 2: Single Integrator: \dot{x} = u
// 3: Double Integrator: \ddot{x} = u
int type_of_dynamics = 2;
// -----------------------------------------------------------------------------------

// SPECIFY WHICH ENVIRONMENT TO USE --------------------------------------------------
// 1: room, 2: room_v2, [3:all_shapes], 4: ROS_House, 5: ROS_Kitchen, 6:Asteroid Field
int envFlag = 3;
// -----------------------------------------------------------------------------------
// prototypes

// Define Classes
class Obstacle {
public:
    int shape;
    vector<Vector3f> vertices; // for face/rectangle types
    vector<float> data; //for sphere and cyl types
    Obstacle(int newShape, vector<Vector3f> newVert){
        this->shape = newShape;
        this->vertices = newVert;
    }
    Obstacle(){}
    Obstacle(int newShape, vector<float> newData){
        this->shape = newShape;
        this->data = newData;
    }
    void set(int newShape, vector<float> newData) {
        this->shape = newShape;
        this->data = newData;
    }
    void set(int newShape, vector<Vector3f> newVert){
        this->shape = newShape;
        this->vertices = newVert;
    }
};

class Node {
public:
    Vector3f pos;
    float minObs;
    float dist; // distance from source node
};

class Edge {
public:
    int first;
    int second;
    float weight;
};

// Global Variables correspoinding to environments
Node x_0,x_f;
float room_length[2];
float room_width[2];
float room_height[2];
vector<Obstacle> all_obstacles;
bool fileFlag = false;
string fName;

// load global variables
void load_environment(int envFlag) {
    switch (envFlag){
        case 1: {//Benchmark_room;
            printf("Using Environment Benchmark Room\n");

            // Start and End positions
            x_0.pos << 10,10,5;
            x_f.pos << 55,10,10;

            // Room Definition
            room_length[0] = 0;
            room_length[1] = 60;
            room_width[0] = 0;
            room_width[1] = 50;
            room_height[0] = 0;
            room_height[1] = 20;

            // Obstacle Definitons
            all_obstacles.clear();
            all_obstacles.reserve(7);

            // Cuboid
            vector<Vector3f> vert(8);
            vert[0]<< 0, 30, 0;
            vert[1]<< 10, 30, 0;
            vert[2]<< 10, 40, 0;
            vert[3]<< 0, 40, 0;
            vert[4]<< 0, 30, 20;
            vert[5]<< 10, 30, 20;
            vert[6]<< 10, 40, 20;
            vert[7]<< 0, 40, 20;
            Obstacle obs(1,vert);
            all_obstacles.push_back(obs);
            vert.clear();
            obs.vertices.clear();

            // Cuboid
            vert.resize(8);
            vert[0]<< 20, 20, 0;
            vert[1]<< 30, 20, 0;
            vert[2]<< 30, 50, 0;
            vert[3]<< 20, 50, 0;
            vert[4]<< 20, 20, 5;
            vert[5]<< 30, 20, 5;
            vert[6]<< 30, 50, 5;
            vert[7]<< 20, 50, 5;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            vert.clear();
            obs.vertices.clear();

            // Cuboid
            vert.resize(8);
            vert[0]<< 20, 10, 0;
            vert[1]<< 30, 10, 0;
            vert[2]<< 30, 20, 0;
            vert[3]<< 20, 20, 0;
            vert[4]<< 20, 10, 20;
            vert[5]<< 30, 10, 20;
            vert[6]<< 30, 20, 20;
            vert[7]<< 20, 20, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            vert.clear();
            obs.vertices.clear();

            // Cuboid
            vert.resize(8);
            vert[0]<< 40, 0, 0;
            vert[1]<< 50, 0, 0;
            vert[2]<< 50, 20, 0;
            vert[3]<< 40, 20, 0;
            vert[4]<< 40, 0, 20;
            vert[5]<< 50, 0, 20;
            vert[6]<< 50, 20, 20;
            vert[7]<< 40, 20, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            vert.clear();
            obs.vertices.clear();

            // Cuboid
            vert.resize(8);
            vert[0]<< 40, 30, 0;
            vert[1]<< 60, 30, 0;
            vert[2]<< 60, 40, 0;
            vert[3]<< 40, 40, 0;
            vert[4]<< 40, 30, 20;
            vert[5]<< 60, 30, 20;
            vert[6]<< 60, 40, 20;
            vert[7]<< 40, 40, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            vert.clear();
            obs.vertices.clear();

            // Face
            vert.resize(3);
            vert[0]<< 0, 0, 0;
            vert[1]<< 60, 0, 0;
            vert[2]<< 0, 50, 0;
            obs.set(2,vert);
            all_obstacles.push_back(obs);
            vert.clear();
            obs.vertices.clear();

            // Face
            vert.resize(3);
            vert[0]<< 60, 50, 0;
            vert[1]<< 60, 0, 0;
            vert[2]<< 0, 50, 0;
            obs.set(2,vert);
            all_obstacles.push_back(obs);
            vert.clear();
            obs.vertices.clear();
            break;
        }
        case 2: {//Benchmark_room_v2;
            printf("Using Environment Benchmark Room v2\n");

            // Start and End positions
            x_0.pos << 65,5,5;
            x_f.pos << 65,65,5;

            // Room Definition
            room_length[0] = 0;
            room_length[1] = 70;
            room_width[0] = 0;
            room_width[1] = 70;
            room_height[0] = 0;
            room_height[1] = 20;

            // Obstacle Definitons
            all_obstacles.clear();
            all_obstacles.reserve(11);

            // Cuboid
            vector<Vector3f> vert(8);
            vert[0] << 0, 10, 0;
            vert[1] << 20, 10, 0;
            vert[2] << 20, 20, 0;
            vert[3] << 0, 20, 0;
            vert[4] << 0, 10, 20;
            vert[5] << 20, 10, 20;
            vert[6] << 20, 20, 20;
            vert[7] << 0, 20, 20;
            Obstacle obs(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 20, 10, 0;
            vert[1] << 30, 10, 0;
            vert[2] << 30, 20, 0;
            vert[3] << 20, 20, 0;
            vert[4] << 20, 10, 5;
            vert[5] << 30, 10, 5;
            vert[6] << 30, 20, 5;
            vert[7] << 20, 20, 5;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 30, 10, 0;
            vert[1] << 70, 10, 0;
            vert[2] << 70, 20, 0;
            vert[3] << 30, 20, 0;
            vert[4] << 30, 10, 20;
            vert[5] << 70, 10, 20;
            vert[6] << 70, 20, 20;
            vert[7] << 30, 20, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 0, 30, 0;
            vert[1] << 40, 30, 0;
            vert[2] << 40, 40, 0;
            vert[3] << 0, 40, 0;
            vert[4] << 0, 30, 20;
            vert[5] << 40, 30, 20;
            vert[6] << 40, 40, 20;
            vert[7] << 0, 40, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 40, 30, 0;
            vert[1] << 50, 30, 0;
            vert[2] << 50, 40, 0;
            vert[3] << 40, 40, 0;
            vert[4] << 40, 30, 5;
            vert[5] << 50, 30, 5;
            vert[6] << 50, 40, 5;
            vert[7] << 40, 40, 5;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 50, 30, 0;
            vert[1] << 70, 30, 0;
            vert[2] << 70, 40, 0;
            vert[3] << 50, 40, 0;
            vert[4] << 50, 30, 20;
            vert[5] << 70, 30, 20;
            vert[6] << 70, 40, 20;
            vert[7] << 50, 40, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 0, 50, 0;
            vert[1] << 20, 50, 0;
            vert[2] << 20, 60, 0;
            vert[3] << 0, 60, 0;
            vert[4] << 0, 50, 20;
            vert[5] << 20, 50, 20;
            vert[6] << 20, 60, 20;
            vert[7] << 0, 60, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 20, 50, 0;
            vert[1] << 30, 50, 0;
            vert[2] << 30, 60, 0;
            vert[3] << 20, 60, 0;
            vert[4] << 20, 50, 5;
            vert[5] << 30, 50, 5;
            vert[6] << 30, 60, 5;
            vert[7] << 20, 60, 5;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Cuboid
            vert.resize(8);
            vert[0] << 30, 50, 0;
            vert[1] << 70, 50, 0;
            vert[2] << 70, 60, 0;
            vert[3] << 30, 60, 0;
            vert[4] << 30, 50, 20;
            vert[5] << 70, 50, 20;
            vert[6] << 70, 60, 20;
            vert[7] << 30, 60, 20;
            obs.set(1,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Face
            vert.resize(3);
            vert[0] << 0, 0, 0;
            vert[1] << 70, 0, 0;
            vert[2] << 0, 70, 0;
            obs.set(2,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            // Face
            vert.resize(3);
            vert[0] << 70, 70, 0;
            vert[1] << 70, 0, 0;
            vert[2] << 0, 70, 0;
            obs.set(2,vert);
            all_obstacles.push_back(obs);
            obs.vertices.clear();
            vert.clear();

            break;
        }
        case 3: {//Benchmark_all_shapes;
            printf("Using Environment Benchmark All Shapes\n");

            // Start and End positions
            x_0.pos << 10,10,5;
            x_f.pos << 42,45,5;

            // Room Definition
            room_length[0] = 0;
            room_length[1] = 60;
            room_width[0] = 0;
            room_width[1] = 50;
            room_height[0] = 0;
            room_height[1] = 20;

            // Obstacle Definitons
            all_obstacles.clear();
            all_obstacles.reserve(6);

            // Rect Prism
            vector<Vector3f> vert(8);
            vert[0] << 0, 30, 0;
            vert[1] << 10, 30, 0;
            vert[2] << 10, 40, 0;
            vert[3] << 0, 40, 0;
            vert[4] << 0, 30, 20;
            vert[5] << 10, 30, 20;
            vert[6] << 10, 40, 20;
            vert[7] << 0, 40, 20;
            Obstacle obs(1, vert);
            all_obstacles.push_back(obs);
            vert.clear();

            // Face
            vert.resize(3);
            vert[0] << 20, 0, 0;
            vert[1] << 20, 20, 0;
            vert[2] << 20, 10, 20;
            obs.set(2,vert);
            all_obstacles.push_back(obs);
            vert.clear();

            // Cylinder
            vector<float> data(5);
            data[0] = 30;
            data[1] = 40;
            data[2] = 0;
            data[3] = 10;
            data[4] = 20;
            obs.set(3,data);
            all_obstacles.push_back(obs);
            data.clear();

            // Sphere
            data.resize(4);
            data[0] = 40;
            data[1] = 10;
            data[2] = 10;
            data[3] = 10;
            obs.set(4,data);
            all_obstacles.push_back(obs);

            // Face
            vert.resize(3);
            vert[0] << 0,0,0;
            vert[1] << room_length[1], 0, 0;
            vert[2] << 0, room_width[1], 0;
            obs.set(2,vert);
            all_obstacles.push_back(obs);
            vert.clear();

            // Face
            vert.resize(3);
            vert[0] << room_length[1], room_width[1], 0;
            vert[1] << room_length[1], 0, 0;
            vert[2] << 0, room_width[1], 0;
            obs.set(2,vert);
            all_obstacles.push_back(obs);
            vert.clear();

            break;
        }
        case 4: {//ROS_House;
            // TODO this doesn't work exactly like matlab, the WRL has two coordinate sets, C++ takes the first set,
            // Matlab takes the second. Saptarshi says this environment isn't used, so you guys decide if you care.
            printf("Using Environment ROS House\n");

            // Start and End positions
            x_0.pos << -1,1,0;
            x_f.pos << 2,-1,1;

            // Room Definition
            room_length[0] = -4;
            room_length[1] = 6;
            room_width[0] = -3;
            room_width[1] = 4;
            room_height[0] = -1;
            room_height[1] = 5;

            // Obstacle Definitons
            fileFlag = true;
            fName = "house.wrl";

            break;
        }
        case 5: {//ROS_Kitchen;
            printf("Using Environment ROS Kitchen\n");

            // Start and End positions
            x_0.pos << -2,-2,1;
            x_f.pos << 3,6,1;

            // Room Definition
            room_length[0] = -4;
            room_length[1] = 4;
            room_width[0] = -8;
            room_width[1] = 8;
            room_height[0] = -1;
            room_height[1] = 4;

            // Obstacle Definitons
            fileFlag = true;
            fName = "kitchen.wrl";

            break;
        }
        case 6: {//Benchmark_Asteroid_Field;
            printf("THIS CASE ISNT RIGHT, ASTROID FIELD DOESNT HAVE A WRL FILE, USING ASTEROID INSTEAD");
            printf("Using Environment Asteroid Field\n");

            // Start and End positions
            x_0.pos << 10,10,0;
            x_f.pos << 42,45,10;

            // Room Definition
            room_length[0] = -4;
            room_length[1] = 4;
            room_width[0] = -8;
            room_width[1] = 8;
            room_height[0] = -1;
            room_height[1] = 4;

            // Obstacle Definitons
            // bool multiObsFlag = true;
            fileFlag = true;
            fName = "asteroid.wrl"; //SHOULD BE ASTEROID FIELD

            // TODO: To properly make an asteroid field, use multiObsFlag to indicate multiple obstacles
            // Then, create a variable for xyz centroid positions of the obstacles, and make fName an array
            // In load_obstacles, if multiObsFlag, read in the separate wrl files, offsetting the vertices by the centroid positions
            // This would be useful for a bunch of purposes, could make a street with multiple houses and people walking by

            break;
        }
        default:{
            printf("Should never reach here\n");
            break;
        }
    }
}
#endif
