#ifndef GUIDANCE_H
#define GUIDANCE_H
#include "../navigation/Navigation.hpp"
/**
 * Guidance.hpp -- Irene Crowell (icrowell@caltech.edu) 6/27/18
 *
 * Class header file for guiding a controller by getting its position and
 * giving target positions.
 */

#include <eigen3/Eigen/Dense>
#include "../State.hpp"
using namespace Eigen;

/**
 * Abstract class that guides a controller by getting its position and
 * giving target positions.
 *
 * Subclasses should implement guidance_loop to calculate desired positions
*/
class Guidance {
private:
    ros::NodeHandle nh;
    Navigation* nav;

    /** For use by the timer for periodic action **/
    void guidance_callback(const ros::TimerEvent& time){
        update_state(); //gets the current position from navigation
        guidance_loop(time); //implemented in the subclass
    }

protected:
    ros::Timer timer;

    float error_bound;
    /* pose/velocity/acceleration data */
    State current_state;

    std::vector<State> trajectory ={};

    std::string controller_name;

    /**
     * Fetches the current controller state from navigation
     */
    void update_state(){
        nav->get_state(current_state);
    }

    /**
     * Run every time step to allow updates to target state
     */
    virtual void guidance_loop(const ros::TimerEvent& time)=0;

public:
    /**
     * Initialize the algorithm for guiding the controller
     * @param controller_name the name of the associated controller
     * @param rate              the rate to run guidance_loop()
     */
    Guidance(std::string controller_name, float rate){
            this->controller_name = controller_name;
            timer = nh.createTimer(ros::Duration(1/rate), &Guidance::guidance_callback, this);
        }

    /**
     * Set the error bound possible for the associated controller
     */
    void set_error_bound(float error){
        error_bound=error;
    }

    /**
     * Gives the trajectory to track
     * @param a constant reference to the trajectory
     */
    virtual const std::vector<State>& get_trajectory(){
        return trajectory;
    }



    /**
     * Set the associated navigation system
     * @param nav The navigation object to fetch position data from
     */
    void set_navigation(Navigation *nav){
        this->nav = nav;
    }


};
#endif
