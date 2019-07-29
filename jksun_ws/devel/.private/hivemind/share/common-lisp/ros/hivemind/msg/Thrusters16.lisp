; Auto-generated. Do not edit!


(cl:in-package hivemind-msg)


;//! \htmlinclude Thrusters16.msg.html

(cl:defclass <Thrusters16> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (FXmMZm
    :reader FXmMZm
    :initarg :FXmMZm
    :type cl:float
    :initform 0.0)
   (FXmMZp
    :reader FXmMZp
    :initarg :FXmMZp
    :type cl:float
    :initform 0.0)
   (FYmMZm
    :reader FYmMZm
    :initarg :FYmMZm
    :type cl:float
    :initform 0.0)
   (FYmMZp
    :reader FYmMZp
    :initarg :FYmMZp
    :type cl:float
    :initform 0.0)
   (FXpMZm
    :reader FXpMZm
    :initarg :FXpMZm
    :type cl:float
    :initform 0.0)
   (FXpMZp
    :reader FXpMZp
    :initarg :FXpMZp
    :type cl:float
    :initform 0.0)
   (FYpMZm
    :reader FYpMZm
    :initarg :FYpMZm
    :type cl:float
    :initform 0.0)
   (FYpMZp
    :reader FYpMZp
    :initarg :FYpMZp
    :type cl:float
    :initform 0.0)
   (FZpMYm
    :reader FZpMYm
    :initarg :FZpMYm
    :type cl:float
    :initform 0.0)
   (FZmMYp
    :reader FZmMYp
    :initarg :FZmMYp
    :type cl:float
    :initform 0.0)
   (FZpMXp
    :reader FZpMXp
    :initarg :FZpMXp
    :type cl:float
    :initform 0.0)
   (FZmMXm
    :reader FZmMXm
    :initarg :FZmMXm
    :type cl:float
    :initform 0.0)
   (FZpMYp
    :reader FZpMYp
    :initarg :FZpMYp
    :type cl:float
    :initform 0.0)
   (FZmMYm
    :reader FZmMYm
    :initarg :FZmMYm
    :type cl:float
    :initform 0.0)
   (FZmMXp
    :reader FZmMXp
    :initarg :FZmMXp
    :type cl:float
    :initform 0.0)
   (FZpMXm
    :reader FZpMXm
    :initarg :FZpMXm
    :type cl:float
    :initform 0.0))
)

(cl:defclass Thrusters16 (<Thrusters16>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Thrusters16>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Thrusters16)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hivemind-msg:<Thrusters16> is deprecated: use hivemind-msg:Thrusters16 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:header-val is deprecated.  Use hivemind-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'FXmMZm-val :lambda-list '(m))
(cl:defmethod FXmMZm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXmMZm-val is deprecated.  Use hivemind-msg:FXmMZm instead.")
  (FXmMZm m))

(cl:ensure-generic-function 'FXmMZp-val :lambda-list '(m))
(cl:defmethod FXmMZp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXmMZp-val is deprecated.  Use hivemind-msg:FXmMZp instead.")
  (FXmMZp m))

(cl:ensure-generic-function 'FYmMZm-val :lambda-list '(m))
(cl:defmethod FYmMZm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYmMZm-val is deprecated.  Use hivemind-msg:FYmMZm instead.")
  (FYmMZm m))

(cl:ensure-generic-function 'FYmMZp-val :lambda-list '(m))
(cl:defmethod FYmMZp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYmMZp-val is deprecated.  Use hivemind-msg:FYmMZp instead.")
  (FYmMZp m))

(cl:ensure-generic-function 'FXpMZm-val :lambda-list '(m))
(cl:defmethod FXpMZm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXpMZm-val is deprecated.  Use hivemind-msg:FXpMZm instead.")
  (FXpMZm m))

(cl:ensure-generic-function 'FXpMZp-val :lambda-list '(m))
(cl:defmethod FXpMZp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FXpMZp-val is deprecated.  Use hivemind-msg:FXpMZp instead.")
  (FXpMZp m))

(cl:ensure-generic-function 'FYpMZm-val :lambda-list '(m))
(cl:defmethod FYpMZm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYpMZm-val is deprecated.  Use hivemind-msg:FYpMZm instead.")
  (FYpMZm m))

(cl:ensure-generic-function 'FYpMZp-val :lambda-list '(m))
(cl:defmethod FYpMZp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FYpMZp-val is deprecated.  Use hivemind-msg:FYpMZp instead.")
  (FYpMZp m))

(cl:ensure-generic-function 'FZpMYm-val :lambda-list '(m))
(cl:defmethod FZpMYm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZpMYm-val is deprecated.  Use hivemind-msg:FZpMYm instead.")
  (FZpMYm m))

(cl:ensure-generic-function 'FZmMYp-val :lambda-list '(m))
(cl:defmethod FZmMYp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZmMYp-val is deprecated.  Use hivemind-msg:FZmMYp instead.")
  (FZmMYp m))

(cl:ensure-generic-function 'FZpMXp-val :lambda-list '(m))
(cl:defmethod FZpMXp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZpMXp-val is deprecated.  Use hivemind-msg:FZpMXp instead.")
  (FZpMXp m))

(cl:ensure-generic-function 'FZmMXm-val :lambda-list '(m))
(cl:defmethod FZmMXm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZmMXm-val is deprecated.  Use hivemind-msg:FZmMXm instead.")
  (FZmMXm m))

(cl:ensure-generic-function 'FZpMYp-val :lambda-list '(m))
(cl:defmethod FZpMYp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZpMYp-val is deprecated.  Use hivemind-msg:FZpMYp instead.")
  (FZpMYp m))

(cl:ensure-generic-function 'FZmMYm-val :lambda-list '(m))
(cl:defmethod FZmMYm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZmMYm-val is deprecated.  Use hivemind-msg:FZmMYm instead.")
  (FZmMYm m))

(cl:ensure-generic-function 'FZmMXp-val :lambda-list '(m))
(cl:defmethod FZmMXp-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZmMXp-val is deprecated.  Use hivemind-msg:FZmMXp instead.")
  (FZmMXp m))

(cl:ensure-generic-function 'FZpMXm-val :lambda-list '(m))
(cl:defmethod FZpMXm-val ((m <Thrusters16>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hivemind-msg:FZpMXm-val is deprecated.  Use hivemind-msg:FZpMXm instead.")
  (FZpMXm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Thrusters16>) ostream)
  "Serializes a message object of type '<Thrusters16>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXmMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXmMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYmMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYmMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXpMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FXpMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYpMZm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FYpMZp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZpMYm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZmMYp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZpMXp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZmMXm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZpMYp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZmMYm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZmMXp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FZpMXm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Thrusters16>) istream)
  "Deserializes a message object of type '<Thrusters16>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
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
    (cl:setf (cl:slot-value msg 'FXmMZp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FYmMZm) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'FXpMZm) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'FYpMZm) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'FZpMYm) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FZmMYp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FZpMXp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FZmMXm) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FZpMYp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FZmMYm) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FZmMXp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FZpMXm) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Thrusters16>)))
  "Returns string type for a message object of type '<Thrusters16>"
  "hivemind/Thrusters16")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Thrusters16)))
  "Returns string type for a message object of type 'Thrusters16"
  "hivemind/Thrusters16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Thrusters16>)))
  "Returns md5sum for a message object of type '<Thrusters16>"
  "560359edb648a0c537e3d3a2564ae554")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Thrusters16)))
  "Returns md5sum for a message object of type 'Thrusters16"
  "560359edb648a0c537e3d3a2564ae554")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Thrusters16>)))
  "Returns full string definition for message of type '<Thrusters16>"
  (cl:format cl:nil "#Thruster values for the 16DOF (16 thruster) Spacecraft simulator~%std_msgs/Header header~%float32 FXmMZm~%float32 FXmMZp~%float32 FYmMZm~%float32 FYmMZp~%float32 FXpMZm~%float32 FXpMZp~%float32 FYpMZm~%float32 FYpMZp~%float32 FZpMYm~%float32 FZmMYp~%float32 FZpMXp~%float32 FZmMXm~%float32 FZpMYp~%float32 FZmMYm~%float32 FZmMXp~%float32 FZpMXm~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Thrusters16)))
  "Returns full string definition for message of type 'Thrusters16"
  (cl:format cl:nil "#Thruster values for the 16DOF (16 thruster) Spacecraft simulator~%std_msgs/Header header~%float32 FXmMZm~%float32 FXmMZp~%float32 FYmMZm~%float32 FYmMZp~%float32 FXpMZm~%float32 FXpMZp~%float32 FYpMZm~%float32 FYpMZp~%float32 FZpMYm~%float32 FZmMYp~%float32 FZpMXp~%float32 FZmMXm~%float32 FZpMYp~%float32 FZmMYm~%float32 FZmMXp~%float32 FZpMXm~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Thrusters16>))
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
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Thrusters16>))
  "Converts a ROS message object to a list"
  (cl:list 'Thrusters16
    (cl:cons ':header (header msg))
    (cl:cons ':FXmMZm (FXmMZm msg))
    (cl:cons ':FXmMZp (FXmMZp msg))
    (cl:cons ':FYmMZm (FYmMZm msg))
    (cl:cons ':FYmMZp (FYmMZp msg))
    (cl:cons ':FXpMZm (FXpMZm msg))
    (cl:cons ':FXpMZp (FXpMZp msg))
    (cl:cons ':FYpMZm (FYpMZm msg))
    (cl:cons ':FYpMZp (FYpMZp msg))
    (cl:cons ':FZpMYm (FZpMYm msg))
    (cl:cons ':FZmMYp (FZmMYp msg))
    (cl:cons ':FZpMXp (FZpMXp msg))
    (cl:cons ':FZmMXm (FZmMXm msg))
    (cl:cons ':FZpMYp (FZpMYp msg))
    (cl:cons ':FZmMYm (FZmMYm msg))
    (cl:cons ':FZmMXp (FZmMXp msg))
    (cl:cons ':FZpMXm (FZpMXm msg))
))
