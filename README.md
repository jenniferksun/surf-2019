# surf-2019

Currently working on creating a virtual simulation environment of the Caltech 
Aerospace Robotics and Control Lab space room and spacecraft dynamics simulators, 
or spacecraft testbeds, using ROS Melodic and Gazebo 9. Movement of the spacecraft 
simulators can be simulated by applying vectorized force trajectories at relative 
thruster location. This was interfaced with ROS using a custom Gazebo model plugin. 
The simulation environment is also designed to work with controllers that take Vicon 
positions of a spacecraft as input and output thruster messages according to various 
guidance and navigation algorithms. As of late-August 2019, the simulation environment 
has been updated to handle waypoint guidance with the 3-DOF spacecraft simulator model 
and the 5-DOF spacecraft simulator model has been completed.

More information about the various ROS packages found within the catkin workspace 
(jksun_ws/src) are described below:

- blackroom 
    
    This packages contains the majority of the scripts used to interface the virtual 
    environment in Gazebo with ROS. Furthermore, this packages contains a simplified
    virtual model of the ARCL space room. This package also allows a user to spawn the 
    simulation environment and set specific arguments to start the simulation, record 
    the model’s pose, spawn multiple spacecrafts, and more. Additional arguments that 
    can be set can be found at jksun_ws/src/blackroom/launch/spacecraft_simulator.launch.

        To simply spawn the virtual world, first build the ROS workspace and run the following line:
        roslaunch blackroom spacecraftsimulator.launch

        To additionally start the simulation environment, instead run the following line:
        roslaunch blackroom spacecraftsimulator.launch sim:=yes

- custom_msgs
    
    This package contains custom ROS message types for the spacecraft simulators. 
    Thruster8 and Thruster16 messages are defined in this package for use in the virtual 
    environment and spacecraft simulator models.
  
- gazebo_plugins
    
    This package contains 2 custom Gazebo model plugins used to interface ROS with the 
    custom Gazebo models of the 3-DOF and 5-DOF spacecraft simulators. Rather than applying
    vectorized force trajectories at a link's center of mass, these custom plugins apply 
    vectorized force trajectoreis at specific locations of the link to simulate thruster fires.
 
- spacecraft_simulator_description
    
    This package contains all of the relevant files used to model the spacecraft simulators.
    Separate ROS urdf and xacro formats are used to define both the 3-DOF and 5-DOF spacecraft 
    simulators. As of date, both the 3-DOF and 5-DOF models have been completed.
