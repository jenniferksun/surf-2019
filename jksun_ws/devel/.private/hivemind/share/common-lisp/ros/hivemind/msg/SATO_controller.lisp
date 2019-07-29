; Auto-generated. Do not edit!


(cl:in-package hivemind-msg)


;//! \htmlinclude SATO_controller.msg.html

(cl:defclass <SATO_controller> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (initial_position
    :reader initial_position
    :initarg :initial_position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass SATO_controller (<SATO_controller>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SATO_controller>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SATO_controller)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-msg:<SATO_controller> is deprecated: use hivemind-msg:SATO_controller instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SATO_controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:name-val is deprecated.  Use hivemind-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'initial_position-val :lambda-list '(m))
(cl:defmethod initial_position-val ((m <SATO_controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:initial_position-val is deprecated.  Use hivemind-msg:initial_position instead.")
  (initial_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SATO_controller>) ostream)
  "Serializes a message object of type '<SATO_controller>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'initial_position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SATO_controller>) istream)
  "Deserializes a message object of type '<SATO_controller>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'initial_position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SATO_controller>)))
  "Returns string type for a message object of type '<SATO_controller>"
  "hivemind/SATO_controller")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SATO_controller)))
  "Returns string type for a message object of type 'SATO_controller"
  "hivemind/SATO_controller")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SATO_controller>)))
  "Returns md5sum for a message object of type '<SATO_controller>"
  "c03a91c04ace9722de7dbeaf894c70ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SATO_controller)))
  "Returns md5sum for a message object of type 'SATO_controller"
  "c03a91c04ace9722de7dbeaf894c70ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SATO_controller>)))
  "Returns full string definition for message of type '<SATO_controller>"
  (cl:format cl:nil "#Used for SATO guidance to figure out what other controllers exist/order them~%string name                         #the unique name of the controller~%geometry_msgs/Point initial_position   #the position of this controller before SATO runs~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SATO_controller)))
  "Returns full string definition for message of type 'SATO_controller"
  (cl:format cl:nil "#Used for SATO guidance to figure out what other controllers exist/order them~%string name                         #the unique name of the controller~%geometry_msgs/Point initial_position   #the position of this controller before SATO runs~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SATO_controller>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'initial_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SATO_controller>))
  "Converts a ROS message object to a list"
  (cl:list 'SATO_controller
    (cl:cons ':name (name msg))
    (cl:cons ':initial_position (initial_position msg))
))
