; Auto-generated. Do not edit!


(cl:in-package hivemind-srv)


;//! \htmlinclude reaction_wheel-request.msg.html

(cl:defclass <reaction_wheel-request> (roslisp-msg-protocol:ros-message)
  ((wheel_no
    :reader wheel_no
    :initarg :wheel_no
    :type cl:integer
    :initform 0)
   (rpm
    :reader rpm
    :initarg :rpm
    :type cl:integer
    :initform 0))
)

(cl:defclass reaction_wheel-request (<reaction_wheel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reaction_wheel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reaction_wheel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<reaction_wheel-request> is deprecated: use hivemind-srv:reaction_wheel-request instead.")))

(cl:ensure-generic-function 'wheel_no-val :lambda-list '(m))
(cl:defmethod wheel_no-val ((m <reaction_wheel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:wheel_no-val is deprecated.  Use hivemind-srv:wheel_no instead.")
  (wheel_no m))

(cl:ensure-generic-function 'rpm-val :lambda-list '(m))
(cl:defmethod rpm-val ((m <reaction_wheel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:rpm-val is deprecated.  Use hivemind-srv:rpm instead.")
  (rpm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reaction_wheel-request>) ostream)
  "Serializes a message object of type '<reaction_wheel-request>"
  (cl:let* ((signed (cl:slot-value msg 'wheel_no)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rpm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reaction_wheel-request>) istream)
  "Deserializes a message object of type '<reaction_wheel-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wheel_no) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rpm) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reaction_wheel-request>)))
  "Returns string type for a service object of type '<reaction_wheel-request>"
  "hivemind/reaction_wheelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reaction_wheel-request)))
  "Returns string type for a service object of type 'reaction_wheel-request"
  "hivemind/reaction_wheelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reaction_wheel-request>)))
  "Returns md5sum for a message object of type '<reaction_wheel-request>"
  "2b5d6a6d532066fbb81f8a947d5d2ca3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reaction_wheel-request)))
  "Returns md5sum for a message object of type 'reaction_wheel-request"
  "2b5d6a6d532066fbb81f8a947d5d2ca3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reaction_wheel-request>)))
  "Returns full string definition for message of type '<reaction_wheel-request>"
  (cl:format cl:nil "int32 wheel_no~%int32 rpm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reaction_wheel-request)))
  "Returns full string definition for message of type 'reaction_wheel-request"
  (cl:format cl:nil "int32 wheel_no~%int32 rpm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reaction_wheel-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reaction_wheel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'reaction_wheel-request
    (cl:cons ':wheel_no (wheel_no msg))
    (cl:cons ':rpm (rpm msg))
))
;//! \htmlinclude reaction_wheel-response.msg.html

(cl:defclass <reaction_wheel-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass reaction_wheel-response (<reaction_wheel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reaction_wheel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reaction_wheel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<reaction_wheel-response> is deprecated: use hivemind-srv:reaction_wheel-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <reaction_wheel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:success-val is deprecated.  Use hivemind-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reaction_wheel-response>) ostream)
  "Serializes a message object of type '<reaction_wheel-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reaction_wheel-response>) istream)
  "Deserializes a message object of type '<reaction_wheel-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reaction_wheel-response>)))
  "Returns string type for a service object of type '<reaction_wheel-response>"
  "hivemind/reaction_wheelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reaction_wheel-response)))
  "Returns string type for a service object of type 'reaction_wheel-response"
  "hivemind/reaction_wheelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reaction_wheel-response>)))
  "Returns md5sum for a message object of type '<reaction_wheel-response>"
  "2b5d6a6d532066fbb81f8a947d5d2ca3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reaction_wheel-response)))
  "Returns md5sum for a message object of type 'reaction_wheel-response"
  "2b5d6a6d532066fbb81f8a947d5d2ca3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reaction_wheel-response>)))
  "Returns full string definition for message of type '<reaction_wheel-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reaction_wheel-response)))
  "Returns full string definition for message of type 'reaction_wheel-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reaction_wheel-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reaction_wheel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'reaction_wheel-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'reaction_wheel)))
  'reaction_wheel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'reaction_wheel)))
  'reaction_wheel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reaction_wheel)))
  "Returns string type for a service object of type '<reaction_wheel>"
  "hivemind/reaction_wheel")