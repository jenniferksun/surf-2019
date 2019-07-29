#ifndef GUIDANCE3DOF_H
#define GUIDANCE3DOF_H
/**
 * Guidance3DOF.hpp -- Irene Crowell (icrowell@caltech.edu) 7/2/18
 *
 * Class header file for guiding a controller by getting its position and
 * giving target positions in the x-y plane.
 */

#include "Guidance.hpp"
#include "../State.hpp"

class Guidance3DOF : public Guidance{
protected:
    State3DOF current_state_3dof;
    State3DOF desired_state_3dof;
    void update_state(){
        Guidance::update_state();
        current_state_3dof = to_3DOF(current_state);
    }

public:
    /**
     * Initialize the algorithm for guiding the controller
     * @param controller_name   the name of the associated controller
     * @param rate              the rate to run guidance_loop()
     */
    Guidance3DOF(std::string controller_name, float rate)
        :Guidance(controller_name, rate){}



};
#endif
