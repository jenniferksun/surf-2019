; Auto-generated. Do not edit!


(cl:in-package hivemind-msg)


;//! \htmlinclude Velocity3.msg.html

(cl:defclass <Velocity3> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (v_x
    :reader v_x
    :initarg :v_x
    :type cl:float
    :initform 0.0)
   (v_y
    :reader v_y
    :initarg :v_y
    :type cl:float
    :initform 0.0)
   (v_theta
    :reader v_theta
    :initarg :v_theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass Velocity3 (<Velocity3>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Velocity3>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Velocity3)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-msg:<Velocity3> is deprecated: use hivemind-msg:Velocity3 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Velocity3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:header-val is deprecated.  Use hivemind-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'v_x-val :lambda-list '(m))
(cl:defmethod v_x-val ((m <Velocity3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:v_x-val is deprecated.  Use hivemind-msg:v_x instead.")
  (v_x m))

(cl:ensure-generic-function 'v_y-val :lambda-list '(m))
(cl:defmethod v_y-val ((m <Velocity3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:v_y-val is deprecated.  Use hivemind-msg:v_y instead.")
  (v_y m))

(cl:ensure-generic-function 'v_theta-val :lambda-list '(m))
(cl:defmethod v_theta-val ((m <Velocity3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:v_theta-val is deprecated.  Use hivemind-msg:v_theta instead.")
  (v_theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Velocity3>) ostream)
  "Serializes a message object of type '<Velocity3>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Velocity3>) istream)
  "Deserializes a message object of type '<Velocity3>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_theta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Velocity3>)))
  "Returns string type for a message object of type '<Velocity3>"
  "hivemind/Velocity3")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Velocity3)))
  "Returns string type for a message object of type 'Velocity3"
  "hivemind/Velocity3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Velocity3>)))
  "Returns md5sum for a message object of type '<Velocity3>"
  "38e5dd26a0c385d1458fff4afb16abfd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Velocity3)))
  "Returns md5sum for a message object of type 'Velocity3"
  "38e5dd26a0c385d1458fff4afb16abfd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Velocity3>)))
  "Returns full string definition for message of type '<Velocity3>"
  (cl:format cl:nil "#Current velocity of a testbot, for testbot navigation to update its \"position\"~%std_msgs/Header header~%float32 v_x~%float32 v_y~%float32 v_theta~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Velocity3)))
  "Returns full string definition for message of type 'Velocity3"
  (cl:format cl:nil "#Current velocity of a testbot, for testbot navigation to update its \"position\"~%std_msgs/Header header~%float32 v_x~%float32 v_y~%float32 v_theta~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Velocity3>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Velocity3>))
  "Converts a ROS message object to a list"
  (cl:list 'Velocity3
    (cl:cons ':header (header msg))
    (cl:cons ':v_x (v_x msg))
    (cl:cons ':v_y (v_y msg))
    (cl:cons ':v_theta (v_theta msg))
))
