;; Auto-generated. Do not edit!


(when (boundp 'hivemind::SATO)
  (if (not (find-package "HIVEMIND"))
    (make-package "HIVEMIND"))
  (shadow 'SATO (find-package "HIVEMIND")))
(unless (find-package "HIVEMIND::SATO")
  (make-package "HIVEMIND::SATO"))
(unless (find-package "HIVEMIND::SATOREQUEST")
  (make-package "HIVEMIND::SATOREQUEST"))
(unless (find-package "HIVEMIND::SATORESPONSE")
  (make-package "HIVEMIND::SATORESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass hivemind::SATORequest
  :super ros::object
  :slots (_initial_positions _final_positions _n _index ))

(defmethod hivemind::SATORequest
  (:init
   (&key
    ((:initial_positions __initial_positions) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:final_positions __final_positions) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:n __n) 0)
    ((:index __index) 0)
    )
   (send-super :init)
   (setq _initial_positions __initial_positions)
   (setq _final_positions __final_positions)
   (setq _n (round __n))
   (setq _index (round __index))
   self)
  (:initial_positions
   (&rest __initial_positions)
   (if (keywordp (car __initial_positions))
       (send* _initial_positions __initial_positions)
     (progn
       (if __initial_positions (setq _initial_positions (car __initial_positions)))
       _initial_positions)))
  (:final_positions
   (&rest __final_positions)
   (if (keywordp (car __final_positions))
       (send* _final_positions __final_positions)
     (progn
       (if __final_positions (setq _final_positions (car __final_positions)))
       _final_positions)))
  (:n
   (&optional __n)
   (if __n (setq _n __n)) _n)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _initial_positions
    (apply #'+ (send-all _initial_positions :serialization-length)) 4
    ;; geometry_msgs/Point[] _final_positions
    (apply #'+ (send-all _final_positions :serialization-length)) 4
    ;; int32 _n
    4
    ;; int32 _index
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _initial_positions
     (write-long (length _initial_positions) s)
     (dolist (elem _initial_positions)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Point[] _final_positions
     (write-long (length _final_positions) s)
     (dolist (elem _final_positions)
       (send elem :serialize s)
       )
     ;; int32 _n
       (write-long _n s)
     ;; int32 _index
       (write-long _index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _initial_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _initial_positions (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _initial_positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Point[] _final_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _final_positions (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _final_positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _n
     (setq _n (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _index
     (setq _index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass hivemind::SATOResponse
  :super ros::object
  :slots (_trajectory ))

(defmethod hivemind::SATOResponse
  (:init
   (&key
    ((:trajectory __trajectory) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    )
   (send-super :init)
   (setq _trajectory __trajectory)
   self)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _trajectory
    (apply #'+ (send-all _trajectory :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _trajectory
     (write-long (length _trajectory) s)
     (dolist (elem _trajectory)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _trajectory
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _trajectory (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _trajectory)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass hivemind::SATO
  :super ros::object
  :slots ())

(setf (get hivemind::SATO :md5sum-) "fbafa20672cd86d3d22a79748644c995")
(setf (get hivemind::SATO :datatype-) "hivemind/SATO")
(setf (get hivemind::SATO :request) hivemind::SATORequest)
(setf (get hivemind::SATO :response) hivemind::SATOResponse)

(defmethod hivemind::SATORequest
  (:response () (instance hivemind::SATOResponse :init)))

(setf (get hivemind::SATORequest :md5sum-) "fbafa20672cd86d3d22a79748644c995")
(setf (get hivemind::SATORequest :datatype-) "hivemind/SATORequest")
(setf (get hivemind::SATORequest :definition-)
      "geometry_msgs/Point[] initial_positions
geometry_msgs/Point[] final_positions
int32 n
int32 index

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
geometry_msgs/Point[] trajectory


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get hivemind::SATOResponse :md5sum-) "fbafa20672cd86d3d22a79748644c995")
(setf (get hivemind::SATOResponse :datatype-) "hivemind/SATOResponse")
(setf (get hivemind::SATOResponse :definition-)
      "geometry_msgs/Point[] initial_positions
geometry_msgs/Point[] final_positions
int32 n
int32 index

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
geometry_msgs/Point[] trajectory


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :hivemind/SATO "fbafa20672cd86d3d22a79748644c995")


