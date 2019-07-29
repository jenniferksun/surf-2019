; Auto-generated. Do not edit!


(cl:in-package hivemind-srv)


;//! \htmlinclude SATO-request.msg.html

(cl:defclass <SATO-request> (roslisp-msg-protocol:ros-message)
  ((initial_positions
    :reader initial_positions
    :initarg :initial_positions
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (final_positions
    :reader final_positions
    :initarg :final_positions
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (n
    :reader n
    :initarg :n
    :type cl:integer
    :initform 0)
   (index
    :reader index
    :initarg :index
    :type cl:integer
    :initform 0))
)

(cl:defclass SATO-request (<SATO-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SATO-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SATO-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<SATO-request> is deprecated: use hivemind-srv:SATO-request instead.")))

(cl:ensure-generic-function 'initial_positions-val :lambda-list '(m))
(cl:defmethod initial_positions-val ((m <SATO-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:initial_positions-val is deprecated.  Use hivemind-srv:initial_positions instead.")
  (initial_positions m))

(cl:ensure-generic-function 'final_positions-val :lambda-list '(m))
(cl:defmethod final_positions-val ((m <SATO-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:final_positions-val is deprecated.  Use hivemind-srv:final_positions instead.")
  (final_positions m))

(cl:ensure-generic-function 'n-val :lambda-list '(m))
(cl:defmethod n-val ((m <SATO-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:n-val is deprecated.  Use hivemind-srv:n instead.")
  (n m))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <SATO-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:index-val is deprecated.  Use hivemind-srv:index instead.")
  (index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SATO-request>) ostream)
  "Serializes a message object of type '<SATO-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'initial_positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'initial_positions))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'final_positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'final_positions))
  (cl:let* ((signed (cl:slot-value msg 'n)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SATO-request>) istream)
  "Deserializes a message object of type '<SATO-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'initial_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'initial_positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'final_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'final_positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'n) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SATO-request>)))
  "Returns string type for a service object of type '<SATO-request>"
  "hivemind/SATORequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SATO-request)))
  "Returns string type for a service object of type 'SATO-request"
  "hivemind/SATORequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SATO-request>)))
  "Returns md5sum for a message object of type '<SATO-request>"
  "fbafa20672cd86d3d22a79748644c995")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SATO-request)))
  "Returns md5sum for a message object of type 'SATO-request"
  "fbafa20672cd86d3d22a79748644c995")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SATO-request>)))
  "Returns full string definition for message of type '<SATO-request>"
  (cl:format cl:nil "geometry_msgs/Point[] initial_positions~%geometry_msgs/Point[] final_positions~%int32 n~%int32 index~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SATO-request)))
  "Returns full string definition for message of type 'SATO-request"
  (cl:format cl:nil "geometry_msgs/Point[] initial_positions~%geometry_msgs/Point[] final_positions~%int32 n~%int32 index~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SATO-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'initial_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'final_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SATO-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SATO-request
    (cl:cons ':initial_positions (initial_positions msg))
    (cl:cons ':final_positions (final_positions msg))
    (cl:cons ':n (n msg))
    (cl:cons ':index (index msg))
))
;//! \htmlinclude SATO-response.msg.html

(cl:defclass <SATO-response> (roslisp-msg-protocol:ros-message)
  ((trajectory
    :reader trajectory
    :initarg :trajectory
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass SATO-response (<SATO-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SATO-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SATO-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-srv:<SATO-response> is deprecated: use hivemind-srv:SATO-response instead.")))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <SATO-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-srv:trajectory-val is deprecated.  Use hivemind-srv:trajectory instead.")
  (trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SATO-response>) ostream)
  "Serializes a message object of type '<SATO-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trajectory))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'trajectory))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SATO-response>) istream)
  "Deserializes a message object of type '<SATO-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trajectory) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trajectory)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SATO-response>)))
  "Returns string type for a service object of type '<SATO-response>"
  "hivemind/SATOResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SATO-response)))
  "Returns string type for a service object of type 'SATO-response"
  "hivemind/SATOResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SATO-response>)))
  "Returns md5sum for a message object of type '<SATO-response>"
  "fbafa20672cd86d3d22a79748644c995")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SATO-response)))
  "Returns md5sum for a message object of type 'SATO-response"
  "fbafa20672cd86d3d22a79748644c995")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SATO-response>)))
  "Returns full string definition for message of type '<SATO-response>"
  (cl:format cl:nil "geometry_msgs/Point[] trajectory~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SATO-response)))
  "Returns full string definition for message of type 'SATO-response"
  (cl:format cl:nil "geometry_msgs/Point[] trajectory~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SATO-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trajectory) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SATO-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SATO-response
    (cl:cons ':trajectory (trajectory msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SATO)))
  'SATO-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SATO)))
  'SATO-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SATO)))
  "Returns string type for a service object of type '<SATO>"
  "hivemind/SATO")