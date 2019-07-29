# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hivemind: 4 messages, 4 services")

set(MSG_I_FLAGS "-Ihivemind:/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hivemind_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv" ""
)

get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv" "std_msgs/MultiArrayLayout:std_msgs/Int64MultiArray:geometry_msgs/PoseArray:geometry_msgs/Pose:std_msgs/Float64MultiArray:std_msgs/Header:geometry_msgs/Point:std_msgs/MultiArrayDimension:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv" NAME_WE)
add_custom_target(_hivemind_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hivemind" "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)
_generate_msg_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)
_generate_msg_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)
_generate_msg_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)

### Generating Services
_generate_srv_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)
_generate_srv_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)
_generate_srv_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Int64MultiArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)
_generate_srv_cpp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
)

### Generating Module File
_generate_module_cpp(hivemind
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hivemind_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hivemind_generate_messages hivemind_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_cpp _hivemind_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hivemind_gencpp)
add_dependencies(hivemind_gencpp hivemind_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hivemind_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)
_generate_msg_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)
_generate_msg_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)
_generate_msg_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)

### Generating Services
_generate_srv_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)
_generate_srv_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)
_generate_srv_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Int64MultiArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)
_generate_srv_eus(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
)

### Generating Module File
_generate_module_eus(hivemind
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hivemind_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hivemind_generate_messages hivemind_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_eus _hivemind_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hivemind_geneus)
add_dependencies(hivemind_geneus hivemind_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hivemind_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)
_generate_msg_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)
_generate_msg_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)
_generate_msg_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)

### Generating Services
_generate_srv_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)
_generate_srv_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)
_generate_srv_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Int64MultiArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)
_generate_srv_lisp(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
)

### Generating Module File
_generate_module_lisp(hivemind
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hivemind_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hivemind_generate_messages hivemind_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_lisp _hivemind_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hivemind_genlisp)
add_dependencies(hivemind_genlisp hivemind_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hivemind_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)
_generate_msg_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)
_generate_msg_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)
_generate_msg_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)

### Generating Services
_generate_srv_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)
_generate_srv_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)
_generate_srv_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Int64MultiArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)
_generate_srv_nodejs(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
)

### Generating Module File
_generate_module_nodejs(hivemind
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hivemind_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hivemind_generate_messages hivemind_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_nodejs _hivemind_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hivemind_gennodejs)
add_dependencies(hivemind_gennodejs hivemind_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hivemind_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)
_generate_msg_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)
_generate_msg_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)
_generate_msg_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)

### Generating Services
_generate_srv_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)
_generate_srv_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)
_generate_srv_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Int64MultiArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)
_generate_srv_py(hivemind
  "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
)

### Generating Module File
_generate_module_py(hivemind
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hivemind_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hivemind_generate_messages hivemind_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/SATO_controller.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/reaction_wheel.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Velocity3.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters8.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg/Thrusters16.msg" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/SATO.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/CVXpy.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/srv/plotting.srv" NAME_WE)
add_dependencies(hivemind_generate_messages_py _hivemind_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hivemind_genpy)
add_dependencies(hivemind_genpy hivemind_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hivemind_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hivemind
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hivemind_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(hivemind_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hivemind
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hivemind_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(hivemind_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hivemind
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hivemind_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(hivemind_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hivemind
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hivemind_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(hivemind_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hivemind
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hivemind_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(hivemind_generate_messages_py geometry_msgs_generate_messages_py)
endif()
