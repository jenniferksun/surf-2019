; Auto-generated. Do not edit!


(cl:in-package hivemind-msg)


;//! \htmlinclude Thrusters8.msg.html

(cl:defclass <Thrusters8> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (FXpMZp
    :reader FXpMZp
    :initarg :FXpMZp
    :type cl:float
    :initform 0.0)
   (FXpMZm
    :reader FXpMZm
    :initarg :FXpMZm
    :type cl:float
    :initform 0.0)
   (FXmMZp
    :reader FXmMZp
    :initarg :FXmMZp
    :type cl:float
    :initform 0.0)
   (FXmMZm
    :reader FXmMZm
    :initarg :FXmMZm
    :type cl:float
    :initform 0.0)
   (FYpMZp
    :reader FYpMZp
    :initarg :FYpMZp
    :type cl:float
    :initform 0.0)
   (FYpMZm
    :reader FYpMZm
    :initarg :FYpMZm
    :type cl:float
    :initform 0.0)
   (FYmMZp
    :reader FYmMZp
    :initarg :FYmMZp
    :type cl:float
    :initform 0.0)
   (FYmMZm
    :reader FYmMZm
    :initarg :FYmMZm
    :type cl:float
    :initform 0.0))
)

(cl:defclass Thrusters8 (<Thrusters8>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Thrusters8>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Thrusters8)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-msg:<Thrusters8> is deprecated: use hivemind-msg:Thrusters8 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:header-val is deprecated.  Use hivemind-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'FXpMZp-val :lambda-list '(m))
(cl:defmethod FXpMZp-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXpMZp-val is deprecated.  Use hivemind-msg:FXpMZp instead.")
  (FXpMZp m))

(cl:ensure-generic-function 'FXpMZm-val :lambda-list '(m))
(cl:defmethod FXpMZm-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXpMZm-val is deprecated.  Use hivemind-msg:FXpMZm instead.")
  (FXpMZm m))

(cl:ensure-generic-function 'FXmMZp-val :lambda-list '(m))
(cl:defmethod FXmMZp-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXmMZp-val is deprecated.  Use hivemind-msg:FXmMZp instead.")
  (FXmMZp m))

(cl:ensure-generic-function 'FXmMZm-val :lambda-list '(m))
(cl:defmethod FXmMZm-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXmMZm-val is deprecated.  Use hivemind-msg:FXmMZm instead.")
  (FXmMZm m))

(cl:ensure-generic-function 'FYpMZp-val :lambda-list '(m))
(cl:defmethod FYpMZp-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYpMZp-val is deprecated.  Use hivemind-msg:FYpMZp instead.")
  (FYpMZp m))

(cl:ensure-generic-function 'FYpMZm-val :lambda-list '(m))
(cl:defmethod FYpMZm-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYpMZm-val is deprecated.  Use hivemind-msg:FYpMZm instead.")
  (FYpMZm m))

(cl:ensure-generic-function 'FYmMZp-val :lambda-list '(m))
(cl:defmethod FYmMZp-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYmMZp-val is deprecated.  Use hivemind-msg:FYmMZp instead.")
  (FYmMZp m))

(cl:ensure-generic-function 'FYmMZm-val :lambda-list '(m))
(cl:defmethod FYmMZm-val ((m <Thrusters8>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYmMZm-val is deprecated.  Use hivemind-msg:FYmMZm instead.")
  (FYmMZm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Thrusters8>) ostream)
  "Serializes a message object of type '<Thrusters8>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXpMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXpMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXmMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXmMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYpMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYpMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYmMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYmMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Thrusters8>) istream)
  "Deserializes a message object of type '<Thrusters8>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FXpMZp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FXpMZm) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FXmMZp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FXmMZm) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FYpMZp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FYpMZm) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FYmMZp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FYmMZm) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Thrusters8>)))
  "Returns string type for a message object of type '<Thrusters8>"
  "hivemind/Thrusters8")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Thrusters8)))
  "Returns string type for a message object of type 'Thrusters8"
  "hivemind/Thrusters8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Thrusters8>)))
  "Returns md5sum for a message object of type '<Thrusters8>"
  "51b0cb1b10c2fc8b58fb90e8108ac3ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Thrusters8)))
  "Returns md5sum for a message object of type 'Thrusters8"
  "51b0cb1b10c2fc8b58fb90e8108ac3ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Thrusters8>)))
  "Returns full string definition for message of type '<Thrusters8>"
  (cl:format cl:nil "#Thruster values for the 3DOF (8 thruster) Spacecraft simulator~%std_msgs/Header header~%float32 FXpMZp~%float32 FXpMZm~%float32 FXmMZp~%float32 FXmMZm~%float32 FYpMZp~%float32 FYpMZm~%float32 FYmMZp~%float32 FYmMZm~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Thrusters8)))
  "Returns full string definition for message of type 'Thrusters8"
  (cl:format cl:nil "#Thruster values for the 3DOF (8 thruster) Spacecraft simulator~%std_msgs/Header header~%float32 FXpMZp~%float32 FXpMZm~%float32 FXmMZp~%float32 FXmMZm~%float32 FYpMZp~%float32 FYpMZm~%float32 FYmMZp~%float32 FYmMZm~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Thrusters8>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Thrusters8>))
  "Converts a ROS message object to a list"
  (cl:list 'Thrusters8
    (cl:cons ':header (header msg))
    (cl:cons ':FXpMZp (FXpMZp msg))
    (cl:cons ':FXpMZm (FXpMZm msg))
    (cl:cons ':FXmMZp (FXmMZp msg))
    (cl:cons ':FXmMZm (FXmMZm msg))
    (cl:cons ':FYpMZp (FYpMZp msg))
    (cl:cons ':FYpMZm (FYpMZm msg))
    (cl:cons ':FYmMZp (FYmMZp msg))
    (cl:cons ':FYmMZm (FYmMZm msg))
))