; Auto-generated. Do not edit!


(cl:in-package hivemind-srv)


;//! \htmlinclude plotting-request.msg.html

(cl:defclass <plotting-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0))
)

(cl:defclass plotting-request (<plotting-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plotting-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plotting-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<plotting-request> is deprecated: use hivemind-srv:plotting-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <plotting-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:x-val is deprecated.  Use hivemind-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <plotting-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:y-val is deprecated.  Use hivemind-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <plotting-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:z-val is deprecated.  Use hivemind-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <plotting-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:id-val is deprecated.  Use hivemind-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plotting-request>) ostream)
  "Serializes a message object of type '<plotting-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plotting-request>) istream)
  "Deserializes a message object of type '<plotting-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plotting-request>)))
  "Returns string type for a service object of type '<plotting-request>"
  "hivemind/plottingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plotting-request)))
  "Returns string type for a service object of type 'plotting-request"
  "hivemind/plottingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plotting-request>)))
  "Returns md5sum for a message object of type '<plotting-request>"
  "e7bc8cc39d0310ad493be8b4e35f3ce5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plotting-request)))
  "Returns md5sum for a message object of type 'plotting-request"
  "e7bc8cc39d0310ad493be8b4e35f3ce5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plotting-request>)))
  "Returns full string definition for message of type '<plotting-request>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%int32 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plotting-request)))
  "Returns full string definition for message of type 'plotting-request"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%int32 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plotting-request>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plotting-request>))
  "Converts a ROS message object to a list"
  (cl:list 'plotting-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':id (id msg))
))
;//! \htmlinclude plotting-response.msg.html

(cl:defclass <plotting-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass plotting-response (<plotting-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plotting-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plotting-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<plotting-response> is deprecated: use hivemind-srv:plotting-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plotting-response>) ostream)
  "Serializes a message object of type '<plotting-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plotting-response>) istream)
  "Deserializes a message object of type '<plotting-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plotting-response>)))
  "Returns string type for a service object of type '<plotting-response>"
  "hivemind/plottingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plotting-response)))
  "Returns string type for a service object of type 'plotting-response"
  "hivemind/plottingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plotting-response>)))
  "Returns md5sum for a message object of type '<plotting-response>"
  "e7bc8cc39d0310ad493be8b4e35f3ce5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plotting-response)))
  "Returns md5sum for a message object of type 'plotting-response"
  "e7bc8cc39d0310ad493be8b4e35f3ce5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plotting-response>)))
  "Returns full string definition for message of type '<plotting-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plotting-response)))
  "Returns full string definition for message of type 'plotting-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plotting-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plotting-response>))
  "Converts a ROS message object to a list"
  (cl:list 'plotting-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'plotting)))
  'plotting-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'plotting)))
  'plotting-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plotting)))
  "Returns string type for a service object of type '<plotting>"
  "hivemind/plotting")