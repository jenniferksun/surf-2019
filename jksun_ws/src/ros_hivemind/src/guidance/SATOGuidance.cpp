/**
 * SATOGuidance.cpp -- Irene Crowell (icrowell@caltech.edu) 7/12/18
 *
 * Guidance Algorithm that coordinates with other controllers to move into a
 * specific formation (which is currently hard coded)
 *
 * See header file for function details
 */


#include "SATOGuidance.hpp"

SATOGuidance::SATOGuidance(std::string controller_name, float rate)
    : Guidance(controller_name, rate){
        pub = nh.advertise<hivemind::SATO_controller>("SATO", 1000);
        sub = nh.subscribe("SATO", 1000, &SATOGuidance::callback, this);
        hivemind::SATO_controller msg;
        client =  nh.serviceClient<hivemind::SATO>("sato_traj_generation");
        msg.name = ros::this_node::getName();
}

void SATOGuidance::guidance_loop(const ros::TimerEvent& time){
    if(init_done){//TODO: update trajectory?
        return;
    }

    //we do this instead of sleeping in the constructor etc to allow for the rest of the system to be set up
    if(start){
        start_time = ros::Time::now();
        start=false;
    }
    //wait 5 seconds to allow other controllers to get ready, let the nav system
    //give us the position
    if(!published && ros::Time::now()-start_time >= ros::Duration(5)){
        hivemind::SATO_controller msg;
        msg.name = ros::this_node::getName();
        msg.initial_position.x = current_state.x[0];
        msg.initial_position.y = current_state.x[1];
        msg.initial_position.z = current_state.x[2];
        pub.publish(msg);
        published=true;
    }
    //after 10 seconds, assume all controllers up, calculate trajectories
    else if(ros::Time::now()-start_time >= ros::Duration(10)){
        sato();
        init_done=true;
    }
}

void SATOGuidance::callback(const hivemind::SATO_controller& msg)
{
    Vector3f position;
    position << msg.initial_position.x, msg.initial_position.y,
            msg.initial_position.z;
    initial_positions.insert(std::pair<std::string,Vector3f>(msg.name, position));
}

void SATOGuidance::sato(){
    hivemind::SATO srv;
    srv.request.n = initial_positions.size();
    if (srv.request.n > desired_positions.size()){
        std::cout<< "Not enough goal positions for number of controllers!!"<<std::endl;
        ros::shutdown();
        return;
    }
    //The map is sorted by name, we want to find the index of our initial position
    //so we we can request our own trajectory from the service
    int i=0;
    for(auto it = initial_positions.begin(); it != initial_positions.end(); ++it ) {
        if(it->first == ros::this_node::getName()){
            srv.request.index=i;
        }
        //get all the initial positions that were published by us/others
        geometry_msgs::Point init_pos;
        init_pos.x = it->second[0];
        init_pos.y = it->second[1];
        init_pos.z = it->second[2];

        srv.request.initial_positions.push_back(init_pos);

        geometry_msgs::Point final_pos;
        final_pos.x = desired_positions[i][0];
        final_pos.y = desired_positions[i][1];
        final_pos.z = desired_positions[i][2];
        srv.request.final_positions.push_back(final_pos);
        i++;
    }
    /**
    std::cout<<"index: "<<srv.request.index<<std::endl
        <<"init positions: "<<srv.request.initial_poses<<std::endl
        <<"final positions: "<<srv.request.final_poses<<std::endl;
    **/
    //Call the SATO algorithm to get our trajectory
    if (client.call(srv)){
        for(geometry_msgs::Point p : srv.response.trajectory){//get my trajectory
            State waypoint;
            waypoint.x << p.x, p.y, p.z;
            trajectory.push_back(waypoint);
        }
    }
    else{
        std::cout<< "SATO trajectory calculation failed"<<std::endl;
        ros::shutdown();
        return;
    }
}
