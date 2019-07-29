; Auto-generated. Do not edit!


(cl:in-package hivemind-srv)


;//! \htmlinclude CVXpy-request.msg.html

(cl:defclass <CVXpy-request> (roslisp-msg-protocol:ros-message)
  ((x_0
    :reader x_0
    :initarg :x_0
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (x_f
    :reader x_f
    :initarg :x_f
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (U_max
    :reader U_max
    :initarg :U_max
    :type cl:float
    :initform 0.0)
   (nodes
    :reader nodes
    :initarg :nodes
    :type geometry_msgs-msg:PoseArray
    :initform (cl:make-instance 'geometry_msgs-msg:PoseArray))
   (radii
    :reader radii
    :initarg :radii
    :type std_msgs-msg:Float64MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Float64MultiArray))
   (num_steps
    :reader num_steps
    :initarg :num_steps
    :type cl:integer
    :initform 0)
   (num_this_path
    :reader num_this_path
    :initarg :num_this_path
    :type cl:integer
    :initform 0)
   (type_of_dynamics
    :reader type_of_dynamics
    :initarg :type_of_dynamics
    :type cl:integer
    :initform 0)
   (delta_t
    :reader delta_t
    :initarg :delta_t
    :type cl:float
    :initform 0.0)
   (which_radius_array
    :reader which_radius_array
    :initarg :which_radius_array
    :type std_msgs-msg:Int64MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Int64MultiArray))
   (this_path
    :reader this_path
    :initarg :this_path
    :type std_msgs-msg:Int64MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Int64MultiArray)))
)

(cl:defclass CVXpy-request (<CVXpy-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CVXpy-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CVXpy-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<CVXpy-request> is deprecated: use hivemind-srv:CVXpy-request instead.")))

(cl:ensure-generic-function 'x_0-val :lambda-list '(m))
(cl:defmethod x_0-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:x_0-val is deprecated.  Use hivemind-srv:x_0 instead.")
  (x_0 m))

(cl:ensure-generic-function 'x_f-val :lambda-list '(m))
(cl:defmethod x_f-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:x_f-val is deprecated.  Use hivemind-srv:x_f instead.")
  (x_f m))

(cl:ensure-generic-function 'U_max-val :lambda-list '(m))
(cl:defmethod U_max-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:U_max-val is deprecated.  Use hivemind-srv:U_max instead.")
  (U_max m))

(cl:ensure-generic-function 'nodes-val :lambda-list '(m))
(cl:defmethod nodes-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:nodes-val is deprecated.  Use hivemind-srv:nodes instead.")
  (nodes m))

(cl:ensure-generic-function 'radii-val :lambda-list '(m))
(cl:defmethod radii-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:radii-val is deprecated.  Use hivemind-srv:radii instead.")
  (radii m))

(cl:ensure-generic-function 'num_steps-val :lambda-list '(m))
(cl:defmethod num_steps-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:num_steps-val is deprecated.  Use hivemind-srv:num_steps instead.")
  (num_steps m))

(cl:ensure-generic-function 'num_this_path-val :lambda-list '(m))
(cl:defmethod num_this_path-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:num_this_path-val is deprecated.  Use hivemind-srv:num_this_path instead.")
  (num_this_path m))

(cl:ensure-generic-function 'type_of_dynamics-val :lambda-list '(m))
(cl:defmethod type_of_dynamics-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:type_of_dynamics-val is deprecated.  Use hivemind-srv:type_of_dynamics instead.")
  (type_of_dynamics m))

(cl:ensure-generic-function 'delta_t-val :lambda-list '(m))
(cl:defmethod delta_t-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:delta_t-val is deprecated.  Use hivemind-srv:delta_t instead.")
  (delta_t m))

(cl:ensure-generic-function 'which_radius_array-val :lambda-list '(m))
(cl:defmethod which_radius_array-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:which_radius_array-val is deprecated.  Use hivemind-srv:which_radius_array instead.")
  (which_radius_array m))

(cl:ensure-generic-function 'this_path-val :lambda-list '(m))
(cl:defmethod this_path-val ((m <CVXpy-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:this_path-val is deprecated.  Use hivemind-srv:this_path instead.")
  (this_path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CVXpy-request>) ostream)
  "Serializes a message object of type '<CVXpy-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'x_0) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'x_f) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'U_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'nodes) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'radii) ostream)
  (cl:let* ((signed (cl:slot-value msg 'num_steps)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'num_this_path)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'type_of_dynamics)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delta_t))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'which_radius_array) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'this_path) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CVXpy-request>) istream)
  "Deserializes a message object of type '<CVXpy-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'x_0) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'x_f) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'U_max) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'nodes) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'radii) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_steps) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_this_path) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type_of_dynamics) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delta_t) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'which_radius_array) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'this_path) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CVXpy-request>)))
  "Returns string type for a service object of type '<CVXpy-request>"
  "hivemind/CVXpyRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CVXpy-request)))
  "Returns string type for a service object of type 'CVXpy-request"
  "hivemind/CVXpyRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CVXpy-request>)))
  "Returns md5sum for a message object of type '<CVXpy-request>"
  "c0d55e6e98e4357c0e73f9e900c18298")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CVXpy-request)))
  "Returns md5sum for a message object of type 'CVXpy-request"
  "c0d55e6e98e4357c0e73f9e900c18298")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CVXpy-request>)))
  "Returns full string definition for message of type '<CVXpy-request>"
  (cl:format cl:nil "geometry_msgs/Point x_0~%geometry_msgs/Point x_f~%float64 U_max~%geometry_msgs/PoseArray nodes~%std_msgs/Float64MultiArray radii~%int64 num_steps~%int64 num_this_path~%int64 type_of_dynamics~%float64 delta_t~%std_msgs/Int64MultiArray which_radius_array~%std_msgs/Int64MultiArray this_path~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%================================================================================~%MSG: std_msgs/Int64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int64[]           data          # array of data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CVXpy-request)))
  "Returns full string definition for message of type 'CVXpy-request"
  (cl:format cl:nil "geometry_msgs/Point x_0~%geometry_msgs/Point x_f~%float64 U_max~%geometry_msgs/PoseArray nodes~%std_msgs/Float64MultiArray radii~%int64 num_steps~%int64 num_this_path~%int64 type_of_dynamics~%float64 delta_t~%std_msgs/Int64MultiArray which_radius_array~%std_msgs/Int64MultiArray this_path~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%================================================================================~%MSG: std_msgs/Int64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int64[]           data          # array of data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CVXpy-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'x_0))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'x_f))
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'nodes))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'radii))
     8
     8
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'which_radius_array))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'this_path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CVXpy-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CVXpy-request
    (cl:cons ':x_0 (x_0 msg))
    (cl:cons ':x_f (x_f msg))
    (cl:cons ':U_max (U_max msg))
    (cl:cons ':nodes (nodes msg))
    (cl:cons ':radii (radii msg))
    (cl:cons ':num_steps (num_steps msg))
    (cl:cons ':num_this_path (num_this_path msg))
    (cl:cons ':type_of_dynamics (type_of_dynamics msg))
    (cl:cons ':delta_t (delta_t msg))
    (cl:cons ':which_radius_array (which_radius_array msg))
    (cl:cons ':this_path (this_path msg))
))
;//! \htmlinclude CVXpy-response.msg.html

(cl:defclass <CVXpy-response> (roslisp-msg-protocol:ros-message)
  ((x_opt
    :reader x_opt
    :initarg :x_opt
    :type geometry_msgs-msg:PoseArray
    :initform (cl:make-instance 'geometry_msgs-msg:PoseArray))
   (u_opt
    :reader u_opt
    :initarg :u_opt
    :type geometry_msgs-msg:PoseArray
    :initform (cl:make-instance 'geometry_msgs-msg:PoseArray))
   (cost
    :reader cost
    :initarg :cost
    :type cl:float
    :initform 0.0))
)

(cl:defclass CVXpy-response (<CVXpy-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CVXpy-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CVXpy-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<CVXpy-response> is deprecated: use hivemind-srv:CVXpy-response instead.")))

(cl:ensure-generic-function 'x_opt-val :lambda-list '(m))
(cl:defmethod x_opt-val ((m <CVXpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:x_opt-val is deprecated.  Use hivemind-srv:x_opt instead.")
  (x_opt m))

(cl:ensure-generic-function 'u_opt-val :lambda-list '(m))
(cl:defmethod u_opt-val ((m <CVXpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:u_opt-val is deprecated.  Use hivemind-srv:u_opt instead.")
  (u_opt m))

(cl:ensure-generic-function 'cost-val :lambda-list '(m))
(cl:defmethod cost-val ((m <CVXpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:cost-val is deprecated.  Use hivemind-srv:cost instead.")
  (cost m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CVXpy-response>) ostream)
  "Serializes a message object of type '<CVXpy-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'x_opt) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'u_opt) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cost))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CVXpy-response>) istream)
  "Deserializes a message object of type '<CVXpy-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'x_opt) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'u_opt) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cost) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CVXpy-response>)))
  "Returns string type for a service object of type '<CVXpy-response>"
  "hivemind/CVXpyResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CVXpy-response)))
  "Returns string type for a service object of type 'CVXpy-response"
  "hivemind/CVXpyResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CVXpy-response>)))
  "Returns md5sum for a message object of type '<CVXpy-response>"
  "c0d55e6e98e4357c0e73f9e900c18298")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CVXpy-response)))
  "Returns md5sum for a message object of type 'CVXpy-response"
  "c0d55e6e98e4357c0e73f9e900c18298")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CVXpy-response>)))
  "Returns full string definition for message of type '<CVXpy-response>"
  (cl:format cl:nil "geometry_msgs/PoseArray x_opt~%geometry_msgs/PoseArray u_opt~%float64 cost~%~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CVXpy-response)))
  "Returns full string definition for message of type 'CVXpy-response"
  (cl:format cl:nil "geometry_msgs/PoseArray x_opt~%geometry_msgs/PoseArray u_opt~%float64 cost~%~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CVXpy-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'x_opt))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'u_opt))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CVXpy-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CVXpy-response
    (cl:cons ':x_opt (x_opt msg))
    (cl:cons ':u_opt (u_opt msg))
    (cl:cons ':cost (cost msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CVXpy)))
  'CVXpy-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CVXpy)))
  'CVXpy-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CVXpy)))
  "Returns string type for a service object of type '<CVXpy>"
  "hivemind/CVXpy")