;; Auto-generated. Do not edit!


(when (boundp 'hivemind::plotting)
  (if (not (find-package "HIVEMIND"))
    (make-package "HIVEMIND"))
  (shadow 'plotting (find-package "HIVEMIND")))
(unless (find-package "HIVEMIND::PLOTTING")
  (make-package "HIVEMIND::PLOTTING"))
(unless (find-package "HIVEMIND::PLOTTINGREQUEST")
  (make-package "HIVEMIND::PLOTTINGREQUEST"))
(unless (find-package "HIVEMIND::PLOTTINGRESPONSE")
  (make-package "HIVEMIND::PLOTTINGRESPONSE"))

(in-package "ROS")





(defclass hivemind::plottingRequest
  :super ros::object
  :slots (_x _y _z _id ))

(defmethod hivemind::plottingRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _id (round __id))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; int32 _id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _id
       (write-long _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass hivemind::plottingResponse
  :super ros::object
  :slots ())

(defmethod hivemind::plottingResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass hivemind::plotting
  :super ros::object
  :slots ())

(setf (get hivemind::plotting :md5sum-) "e7bc8cc39d0310ad493be8b4e35f3ce5")
(setf (get hivemind::plotting :datatype-) "hivemind/plotting")
(setf (get hivemind::plotting :request) hivemind::plottingRequest)
(setf (get hivemind::plotting :response) hivemind::plottingResponse)

(defmethod hivemind::plottingRequest
  (:response () (instance hivemind::plottingResponse :init)))

(setf (get hivemind::plottingRequest :md5sum-) "e7bc8cc39d0310ad493be8b4e35f3ce5")
(setf (get hivemind::plottingRequest :datatype-) "hivemind/plottingRequest")
(setf (get hivemind::plottingRequest :definition-)
      "float32 x
float32 y
float32 z
int32 id
---

")

(setf (get hivemind::plottingResponse :md5sum-) "e7bc8cc39d0310ad493be8b4e35f3ce5")
(setf (get hivemind::plottingResponse :datatype-) "hivemind/plottingResponse")
(setf (get hivemind::plottingResponse :definition-)
      "float32 x
float32 y
float32 z
int32 id
---

")



(provide :hivemind/plotting "e7bc8cc39d0310ad493be8b4e35f3ce5")


