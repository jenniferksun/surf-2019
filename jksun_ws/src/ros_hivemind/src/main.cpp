#include "controllers/SCSim6DOF.hpp"
#include "controllers/TestBot.hpp"
#include "guidance/FMPGuidance.hpp"
#include "guidance/WaypointGuidance.hpp"
#include "guidance/SATOGuidance.hpp"
#include "navigation/Vicon.hpp"
#include "navigation/TestNav.hpp"
#include <cstring>
#include "constants.hpp"

/**
 * control.cpp -- Irene Crowell (icrowell@caltech.edu) 6/27/18
 *
 * Sets up a controller with associated guidance and navigation algorithms
 *
 */



/**
 * Parses parameters for Control, Guidance, and Navigation and
 * starts infinite control loop.
 */
int main( int argc, char* argv[] )
{
    Controller* control = NULL;
    Guidance* guide = NULL;
    Navigation* nav = NULL;
    //Program options for nodes -- ROS will remove remapping args from argc/argv
    ros::init(argc, argv, "controller", ros::init_options::AnonymousName);
    ros::start();
    ros::NodeHandle n;

    std::string controller_name, controller, guidance, navigation;
    // std::string simulation;
    if(!ros::param::get("~controller_name", controller_name)
        || !ros::param::get("~controller", controller)
        || !ros::param::get("~guidance", guidance)
        || !ros::param::get("~navigation", navigation)){
        std::cerr << "must specify controller_name, controller, guidance, and navigation"<<std::endl;
        return -1;
    }

    // ros::param::get("~simulation", simulation)

    ros::param::get("NAV_RATE", NAV_RATE);
    ros::param::get("GUIDE_RATE", GUIDE_RATE);

    ros::param::get("SCSIM_ATT_ERROR", SCSIM_ATT_ERROR);
    std::cout<<"att error"<< SCSIM_ATT_ERROR;
    ros::param::get("SCSIM_POS_ERROR", SCSIM_POS_ERROR);
    ros::param::get("SCSIM_ATT_RATE", SCSIM_ATT_RATE);
    ros::param::get("SCSIM_POS_RATE", SCSIM_POS_RATE);

    ros::param::get("SMALL_ERROR", SMALL_ERROR);
    ros::param::get("SMALL_VELOCITY", SMALL_VELOCITY);
    ros::param::get("BIG_VELOCITY", BIG_VELOCITY);
    ros::param::get("KP_DEFAULT", KP_DEFAULT);
    ros::param::get("KD_DEFAULT", KD_DEFAULT);
    ros::param::get("KP_BIG", KP_BIG);
    ros::param::get("KD_BIG", KD_BIG);


    if(controller == "spacecraft"){

        bool testing = false;
        ros::param::get("testing", testing);
        control = new SCSim6DOF(controller_name, testing);
        ((SCSim6DOF*)control)->set_gains(KP_DEFAULT, KD_DEFAULT);//TODO: add kI support?

    }
    else if(controller =="test"){
        control = new TestBot(controller_name);
    }
    else{
        std::cerr << "Invalid controller. Options are: spacecraft, test\n";
        return -1;
    }

    if(guidance == "fmp"){
        guide = new FMPGuidance(controller_name, GUIDE_RATE);
    }
    else if(guidance == "waypoint"){
        guide = new WaypointGuidance(controller_name, GUIDE_RATE);
    }
    else if (guidance == "sato"){
        guide = new SATOGuidance(controller_name, GUIDE_RATE);
    }
    else{
        std::cerr << "Invalid guidance. Options are: fmp, waypoint, sato\n";
        return -1;
    }

    if(navigation=="vicon"){
        nav = new Vicon(controller_name, NAV_RATE);
    }
    else if(navigation=="test"){
        ros::NodeHandle nh("~");
        std::vector<double> initial_pos;
        nh.getParam("initial_position", initial_pos);
        Vector3f initial_position;
        initial_position << initial_pos[0], initial_pos[1], initial_pos[2];
        nav = new TestNav(controller_name, NAV_RATE, initial_position);
    }
    else{
        std::cerr << "Invalid navigation. Options are: vicon, test\n";
        return -1;
    }

    control->set_guidance(guide);
    control->set_navigation(nav);
    guide->set_navigation(nav);

    ros::spin();
}
