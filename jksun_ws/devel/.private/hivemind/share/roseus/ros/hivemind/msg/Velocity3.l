;; Auto-generated. Do not edit!


(when (boundp 'hivemind::Velocity3)
  (if (not (find-package "HIVEMIND"))
    (make-package "HIVEMIND"))
  (shadow 'Velocity3 (find-package "HIVEMIND")))
(unless (find-package "HIVEMIND::VELOCITY3")
  (make-package "HIVEMIND::VELOCITY3"))

(in-package "ROS")
;;//! \htmlinclude Velocity3.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hivemind::Velocity3
  :super ros::object
  :slots (_header _v_x _v_y _v_theta ))

(defmethod hivemind::Velocity3
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:v_x __v_x) 0.0)
    ((:v_y __v_y) 0.0)
    ((:v_theta __v_theta) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _v_x (float __v_x))
   (setq _v_y (float __v_y))
   (setq _v_theta (float __v_theta))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:v_x
   (&optional __v_x)
   (if __v_x (setq _v_x __v_x)) _v_x)
  (:v_y
   (&optional __v_y)
   (if __v_y (setq _v_y __v_y)) _v_y)
  (:v_theta
   (&optional __v_theta)
   (if __v_theta (setq _v_theta __v_theta)) _v_theta)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _v_x
    4
    ;; float32 _v_y
    4
    ;; float32 _v_theta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _v_x
       (sys::poke _v_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_y
       (sys::poke _v_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_theta
       (sys::poke _v_theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _v_x
     (setq _v_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_y
     (setq _v_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_theta
     (setq _v_theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hivemind::Velocity3 :md5sum-) "38e5dd26a0c385d1458fff4afb16abfd")
(setf (get hivemind::Velocity3 :datatype-) "hivemind/Velocity3")
(setf (get hivemind::Velocity3 :definition-)
      "#Current velocity of a testbot, for testbot navigation to update its \"position\"
std_msgs/Header header
float32 v_x
float32 v_y
float32 v_theta

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



(provide :hivemind/Velocity3 "38e5dd26a0c385d1458fff4afb16abfd")


