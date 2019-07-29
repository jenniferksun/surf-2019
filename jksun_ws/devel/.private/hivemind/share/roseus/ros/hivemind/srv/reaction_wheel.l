;; Auto-generated. Do not edit!


(when (boundp 'hivemind::reaction_wheel)
  (if (not (find-package "HIVEMIND"))
    (make-package "HIVEMIND"))
  (shadow 'reaction_wheel (find-package "HIVEMIND")))
(unless (find-package "HIVEMIND::REACTION_WHEEL")
  (make-package "HIVEMIND::REACTION_WHEEL"))
(unless (find-package "HIVEMIND::REACTION_WHEELREQUEST")
  (make-package "HIVEMIND::REACTION_WHEELREQUEST"))
(unless (find-package "HIVEMIND::REACTION_WHEELRESPONSE")
  (make-package "HIVEMIND::REACTION_WHEELRESPONSE"))

(in-package "ROS")





(defclass hivemind::reaction_wheelRequest
  :super ros::object
  :slots (_wheel_no _rpm ))

(defmethod hivemind::reaction_wheelRequest
  (:init
   (&key
    ((:wheel_no __wheel_no) 0)
    ((:rpm __rpm) 0)
    )
   (send-super :init)
   (setq _wheel_no (round __wheel_no))
   (setq _rpm (round __rpm))
   self)
  (:wheel_no
   (&optional __wheel_no)
   (if __wheel_no (setq _wheel_no __wheel_no)) _wheel_no)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:serialization-length
   ()
   (+
    ;; int32 _wheel_no
    4
    ;; int32 _rpm
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _wheel_no
       (write-long _wheel_no s)
     ;; int32 _rpm
       (write-long _rpm s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _wheel_no
     (setq _wheel_no (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rpm
     (setq _rpm (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass hivemind::reaction_wheelResponse
  :super ros::object
  :slots (_success ))

(defmethod hivemind::reaction_wheelResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass hivemind::reaction_wheel
  :super ros::object
  :slots ())

(setf (get hivemind::reaction_wheel :md5sum-) "2b5d6a6d532066fbb81f8a947d5d2ca3")
(setf (get hivemind::reaction_wheel :datatype-) "hivemind/reaction_wheel")
(setf (get hivemind::reaction_wheel :request) hivemind::reaction_wheelRequest)
(setf (get hivemind::reaction_wheel :response) hivemind::reaction_wheelResponse)

(defmethod hivemind::reaction_wheelRequest
  (:response () (instance hivemind::reaction_wheelResponse :init)))

(setf (get hivemind::reaction_wheelRequest :md5sum-) "2b5d6a6d532066fbb81f8a947d5d2ca3")
(setf (get hivemind::reaction_wheelRequest :datatype-) "hivemind/reaction_wheelRequest")
(setf (get hivemind::reaction_wheelRequest :definition-)
      "int32 wheel_no
int32 rpm
---
bool success

")

(setf (get hivemind::reaction_wheelResponse :md5sum-) "2b5d6a6d532066fbb81f8a947d5d2ca3")
(setf (get hivemind::reaction_wheelResponse :datatype-) "hivemind/reaction_wheelResponse")
(setf (get hivemind::reaction_wheelResponse :definition-)
      "int32 wheel_no
int32 rpm
---
bool success

")



(provide :hivemind/reaction_wheel "2b5d6a6d532066fbb81f8a947d5d2ca3")


