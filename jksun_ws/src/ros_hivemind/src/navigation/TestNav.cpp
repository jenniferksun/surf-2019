/**
 * TestNav.cpp -- Irene Crowell (icrowell@caltech.edu) 7/3/18
 *
 * Navigation position tracking that listens on ROS channels for the the controller's
 * acceleration control
 */


#include "TestNav.hpp"

TestNav::TestNav(std::string controller_name, float rate, Vector3f initial_position)
    : Navigation(controller_name, rate){
    current_state.x = initial_position;

    acceleration_sub = node.subscribe( "/acceleration/"+controller_name, 1000,
        &TestNav::acceleration_callback, this);
    position_sub = node.subscribe( "/position/"+controller_name, 1000,
        &TestNav::position_callback, this);
    name_pub = node.advertise<std_msgs::String>("testbot_names", 1000);
    name_msg.data = std::to_string(ros::Time::now().toSec())+controller_name;
    name_sub = node.subscribe("testbot_names",
        1000, &TestNav::name_callback, this);
}

void TestNav::name_callback(const std_msgs::String &msg){
    //keep other testbots ordered and updated -- they need to order themselves for graphing
    testbots.insert(msg.data);
    id = std::distance(testbots.begin(), testbots.find(name_msg.data));
    //std::cout<<name_msg.data <<"(id "<< id << ") knows about "<<msg.data <<"!"<<std::endl;
}

void TestNav::acceleration_callback(const geometry_msgs::Accel &amsg){
    current_state.xdd << amsg.linear.x , amsg.linear.y , amsg.linear.z;
}
void TestNav::position_callback(const geometry_msgs::Point &pmsg){
    current_state.x << pmsg.x , pmsg.y, pmsg.z;
    current_state.xd << 0,0,0;
    current_state.xdd << 0,0,0;
}

void TestNav::navigation_loop(const ros::TimerEvent& time){
    name_pub.publish(name_msg);

    if(id != -1){//graph current pose in the correct color
        graph_srv.request.x = current_state.x[0];
        graph_srv.request.y = current_state.x[1];
        graph_srv.request.z = current_state.x[2];
        graph_srv.request.id = id;
        ros::service::call("plotting", graph_srv);
    }

    if(!first_loop){//first time step is way off

        ros::Duration time_step = time.current_real - time.last_real;
        Vector3f velocity_old = current_state.xd;
        current_state.xd += current_state.xdd * time_step.toSec();
        current_state.x += (current_state.xd + velocity_old) / 2.0 * time_step.toSec();
        /**std::cout << "Position for " <<controller_name << ": "<< current_state.x[0]<<", "
                <<current_state.x[1]<<", "<<theta<<std::endl;**/
        //TODO: angular movement
    }
    else{
        first_loop=false;
    }
}
