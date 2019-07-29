;; Auto-generated. Do not edit!


(when (boundp 'hivemind::SATO_controller)
  (if (not (find-package "HIVEMIND"))
    (make-package "HIVEMIND"))
  (shadow 'SATO_controller (find-package "HIVEMIND")))
(unless (find-package "HIVEMIND::SATO_CONTROLLER")
  (make-package "HIVEMIND::SATO_CONTROLLER"))

(in-package "ROS")
;;//! \htmlinclude SATO_controller.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass hivemind::SATO_controller
  :super ros::object
  :slots (_name _initial_position ))

(defmethod hivemind::SATO_controller
  (:init
   (&key
    ((:name __name) "")
    ((:initial_position __initial_position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _initial_position __initial_position)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:initial_position
   (&rest __initial_position)
   (if (keywordp (car __initial_position))
       (send* _initial_position __initial_position)
     (progn
       (if __initial_position (setq _initial_position (car __initial_position)))
       _initial_position)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Point _initial_position
    (send _initial_position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Point _initial_position
       (send _initial_position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point _initial_position
     (send _initial_position :deserialize buf ptr-) (incf ptr- (send _initial_position :serialization-length))
   ;;
   self)
  )

(setf (get hivemind::SATO_controller :md5sum-) "c03a91c04ace9722de7dbeaf894c70ca")
(setf (get hivemind::SATO_controller :datatype-) "hivemind/SATO_controller")
(setf (get hivemind::SATO_controller :definition-)
      "#Used for SATO guidance to figure out what other controllers exist/order them
string name                         #the unique name of the controller
geometry_msgs/Point initial_position   #the position of this controller before SATO runs

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :hivemind/SATO_controller "c03a91c04ace9722de7dbeaf894c70ca")


