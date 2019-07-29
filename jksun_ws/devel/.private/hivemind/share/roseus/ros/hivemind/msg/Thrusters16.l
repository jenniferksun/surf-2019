;; Auto-generated. Do not edit!


(when (boundp 'hivemind::Thrusters16)
  (if (not (find-package "HIVEMIND"))
    (make-package "HIVEMIND"))
  (shadow 'Thrusters16 (find-package "HIVEMIND")))
(unless (find-package "HIVEMIND::THRUSTERS16")
  (make-package "HIVEMIND::THRUSTERS16"))

(in-package "ROS")
;;//! \htmlinclude Thrusters16.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hivemind::Thrusters16
  :super ros::object
  :slots (_header _FXmMZm _FXmMZp _FYmMZm _FYmMZp _FXpMZm _FXpMZp _FYpMZm _FYpMZp _FZpMYm _FZmMYp _FZpMXp _FZmMXm _FZpMYp _FZmMYm _FZmMXp _FZpMXm ))

(defmethod hivemind::Thrusters16
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:FXmMZm __FXmMZm) 0.0)
    ((:FXmMZp __FXmMZp) 0.0)
    ((:FYmMZm __FYmMZm) 0.0)
    ((:FYmMZp __FYmMZp) 0.0)
    ((:FXpMZm __FXpMZm) 0.0)
    ((:FXpMZp __FXpMZp) 0.0)
    ((:FYpMZm __FYpMZm) 0.0)
    ((:FYpMZp __FYpMZp) 0.0)
    ((:FZpMYm __FZpMYm) 0.0)
    ((:FZmMYp __FZmMYp) 0.0)
    ((:FZpMXp __FZpMXp) 0.0)
    ((:FZmMXm __FZmMXm) 0.0)
    ((:FZpMYp __FZpMYp) 0.0)
    ((:FZmMYm __FZmMYm) 0.0)
    ((:FZmMXp __FZmMXp) 0.0)
    ((:FZpMXm __FZpMXm) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _FXmMZm (float __FXmMZm))
   (setq _FXmMZp (float __FXmMZp))
   (setq _FYmMZm (float __FYmMZm))
   (setq _FYmMZp (float __FYmMZp))
   (setq _FXpMZm (float __FXpMZm))
   (setq _FXpMZp (float __FXpMZp))
   (setq _FYpMZm (float __FYpMZm))
   (setq _FYpMZp (float __FYpMZp))
   (setq _FZpMYm (float __FZpMYm))
   (setq _FZmMYp (float __FZmMYp))
   (setq _FZpMXp (float __FZpMXp))
   (setq _FZmMXm (float __FZmMXm))
   (setq _FZpMYp (float __FZpMYp))
   (setq _FZmMYm (float __FZmMYm))
   (setq _FZmMXp (float __FZmMXp))
   (setq _FZpMXm (float __FZpMXm))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:FXmMZm
   (&optional __FXmMZm)
   (if __FXmMZm (setq _FXmMZm __FXmMZm)) _FXmMZm)
  (:FXmMZp
   (&optional __FXmMZp)
   (if __FXmMZp (setq _FXmMZp __FXmMZp)) _FXmMZp)
  (:FYmMZm
   (&optional __FYmMZm)
   (if __FYmMZm (setq _FYmMZm __FYmMZm)) _FYmMZm)
  (:FYmMZp
   (&optional __FYmMZp)
   (if __FYmMZp (setq _FYmMZp __FYmMZp)) _FYmMZp)
  (:FXpMZm
   (&optional __FXpMZm)
   (if __FXpMZm (setq _FXpMZm __FXpMZm)) _FXpMZm)
  (:FXpMZp
   (&optional __FXpMZp)
   (if __FXpMZp (setq _FXpMZp __FXpMZp)) _FXpMZp)
  (:FYpMZm
   (&optional __FYpMZm)
   (if __FYpMZm (setq _FYpMZm __FYpMZm)) _FYpMZm)
  (:FYpMZp
   (&optional __FYpMZp)
   (if __FYpMZp (setq _FYpMZp __FYpMZp)) _FYpMZp)
  (:FZpMYm
   (&optional __FZpMYm)
   (if __FZpMYm (setq _FZpMYm __FZpMYm)) _FZpMYm)
  (:FZmMYp
   (&optional __FZmMYp)
   (if __FZmMYp (setq _FZmMYp __FZmMYp)) _FZmMYp)
  (:FZpMXp
   (&optional __FZpMXp)
   (if __FZpMXp (setq _FZpMXp __FZpMXp)) _FZpMXp)
  (:FZmMXm
   (&optional __FZmMXm)
   (if __FZmMXm (setq _FZmMXm __FZmMXm)) _FZmMXm)
  (:FZpMYp
   (&optional __FZpMYp)
   (if __FZpMYp (setq _FZpMYp __FZpMYp)) _FZpMYp)
  (:FZmMYm
   (&optional __FZmMYm)
   (if __FZmMYm (setq _FZmMYm __FZmMYm)) _FZmMYm)
  (:FZmMXp
   (&optional __FZmMXp)
   (if __FZmMXp (setq _FZmMXp __FZmMXp)) _FZmMXp)
  (:FZpMXm
   (&optional __FZpMXm)
   (if __FZpMXm (setq _FZpMXm __FZpMXm)) _FZpMXm)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _FXmMZm
    4
    ;; float32 _FXmMZp
    4
    ;; float32 _FYmMZm
    4
    ;; float32 _FYmMZp
    4
    ;; float32 _FXpMZm
    4
    ;; float32 _FXpMZp
    4
    ;; float32 _FYpMZm
    4
    ;; float32 _FYpMZp
    4
    ;; float32 _FZpMYm
    4
    ;; float32 _FZmMYp
    4
    ;; float32 _FZpMXp
    4
    ;; float32 _FZmMXm
    4
    ;; float32 _FZpMYp
    4
    ;; float32 _FZmMYm
    4
    ;; float32 _FZmMXp
    4
    ;; float32 _FZpMXm
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _FXmMZm
       (sys::poke _FXmMZm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FXmMZp
       (sys::poke _FXmMZp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FYmMZm
       (sys::poke _FYmMZm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FYmMZp
       (sys::poke _FYmMZp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FXpMZm
       (sys::poke _FXpMZm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FXpMZp
       (sys::poke _FXpMZp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FYpMZm
       (sys::poke _FYpMZm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FYpMZp
       (sys::poke _FYpMZp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZpMYm
       (sys::poke _FZpMYm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZmMYp
       (sys::poke _FZmMYp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZpMXp
       (sys::poke _FZpMXp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZmMXm
       (sys::poke _FZmMXm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZpMYp
       (sys::poke _FZpMYp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZmMYm
       (sys::poke _FZmMYm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZmMXp
       (sys::poke _FZmMXp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FZpMXm
       (sys::poke _FZpMXm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _FXmMZm
     (setq _FXmMZm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FXmMZp
     (setq _FXmMZp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FYmMZm
     (setq _FYmMZm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FYmMZp
     (setq _FYmMZp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FXpMZm
     (setq _FXpMZm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FXpMZp
     (setq _FXpMZp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FYpMZm
     (setq _FYpMZm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FYpMZp
     (setq _FYpMZp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZpMYm
     (setq _FZpMYm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZmMYp
     (setq _FZmMYp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZpMXp
     (setq _FZpMXp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZmMXm
     (setq _FZmMXm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZpMYp
     (setq _FZpMYp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZmMYm
     (setq _FZmMYm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZmMXp
     (setq _FZmMXp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FZpMXm
     (setq _FZpMXm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hivemind::Thrusters16 :md5sum-) "560359edb648a0c537e3d3a2564ae554")
(setf (get hivemind::Thrusters16 :datatype-) "hivemind/Thrusters16")
(setf (get hivemind::Thrusters16 :definition-)
      "#Thruster values for the 16DOF (16 thruster) Spacecraft simulator
std_msgs/Header header
float32 FXmMZm
float32 FXmMZp
float32 FYmMZm
float32 FYmMZp
float32 FXpMZm
float32 FXpMZp
float32 FYpMZm
float32 FYpMZp
float32 FZpMYm
float32 FZmMYp
float32 FZpMXp
float32 FZmMXm
float32 FZpMYp
float32 FZmMYm
float32 FZmMXp
float32 FZpMXm

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :hivemind/Thrusters16 "560359edb648a0c537e3d3a2564ae554")


