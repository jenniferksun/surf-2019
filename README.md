# surf-2019

Currently working on creating a virtual simulation environment of the ARCL space
room and spacecraft dynamics simulator, or spacecraft testbeds, using ROS Melodic 
and Gazebo 9. Movement of the spacecraft simulators can be simulated by applying 
vectorized force trajectories at relative thruster location. This was interfaced 
with ROS using a custom Gazebo model plugin. The simulation environment is also 
designed to work with controllers that take Vicon positions of a spacecraft as 
input and output thruster messages according to various guidance and navigation 
algorithms. As of late-August 2019, the simulation environment has been updated to 
handle waypoint guidance with the 3-DOF spacecraft simulator model and the 5-DOF
spacecraft simulator model has been completed.

More information about usage of the current simulation environment can be found in
ARCL spacecraft simulator user manual, or in the various packages. More details
to this workspace will be added later.
