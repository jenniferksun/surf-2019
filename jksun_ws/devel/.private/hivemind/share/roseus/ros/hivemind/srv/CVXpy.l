;; Auto-generated. Do not edit!


(when (boundp 'hivemind::CVXpy)
  (if (not (find-package "HIVEMIND"))
    (make-package "HIVEMIND"))
  (shadow 'CVXpy (find-package "HIVEMIND")))
(unless (find-package "HIVEMIND::CVXPY")
  (make-package "HIVEMIND::CVXPY"))
(unless (find-package "HIVEMIND::CVXPYREQUEST")
  (make-package "HIVEMIND::CVXPYREQUEST"))
(unless (find-package "HIVEMIND::CVXPYRESPONSE")
  (make-package "HIVEMIND::CVXPYRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass hivemind::CVXpyRequest
  :super ros::object
  :slots (_x_0 _x_f _U_max _nodes _radii _num_steps _num_this_path _type_of_dynamics _delta_t _which_radius_array _this_path ))

(defmethod hivemind::CVXpyRequest
  (:init
   (&key
    ((:x_0 __x_0) (instance geometry_msgs::Point :init))
    ((:x_f __x_f) (instance geometry_msgs::Point :init))
    ((:U_max __U_max) 0.0)
    ((:nodes __nodes) (instance geometry_msgs::PoseArray :init))
    ((:radii __radii) (instance std_msgs::Float64MultiArray :init))
    ((:num_steps __num_steps) 0)
    ((:num_this_path __num_this_path) 0)
    ((:type_of_dynamics __type_of_dynamics) 0)
    ((:delta_t __delta_t) 0.0)
    ((:which_radius_array __which_radius_array) (instance std_msgs::Int64MultiArray :init))
    ((:this_path __this_path) (instance std_msgs::Int64MultiArray :init))
    )
   (send-super :init)
   (setq _x_0 __x_0)
   (setq _x_f __x_f)
   (setq _U_max (float __U_max))
   (setq _nodes __nodes)
   (setq _radii __radii)
   (setq _num_steps (round __num_steps))
   (setq _num_this_path (round __num_this_path))
   (setq _type_of_dynamics (round __type_of_dynamics))
   (setq _delta_t (float __delta_t))
   (setq _which_radius_array __which_radius_array)
   (setq _this_path __this_path)
   self)
  (:x_0
   (&rest __x_0)
   (if (keywordp (car __x_0))
       (send* _x_0 __x_0)
     (progn
       (if __x_0 (setq _x_0 (car __x_0)))
       _x_0)))
  (:x_f
   (&rest __x_f)
   (if (keywordp (car __x_f))
       (send* _x_f __x_f)
     (progn
       (if __x_f (setq _x_f (car __x_f)))
       _x_f)))
  (:U_max
   (&optional __U_max)
   (if __U_max (setq _U_max __U_max)) _U_max)
  (:nodes
   (&rest __nodes)
   (if (keywordp (car __nodes))
       (send* _nodes __nodes)
     (progn
       (if __nodes (setq _nodes (car __nodes)))
       _nodes)))
  (:radii
   (&rest __radii)
   (if (keywordp (car __radii))
       (send* _radii __radii)
     (progn
       (if __radii (setq _radii (car __radii)))
       _radii)))
  (:num_steps
   (&optional __num_steps)
   (if __num_steps (setq _num_steps __num_steps)) _num_steps)
  (:num_this_path
   (&optional __num_this_path)
   (if __num_this_path (setq _num_this_path __num_this_path)) _num_this_path)
  (:type_of_dynamics
   (&optional __type_of_dynamics)
   (if __type_of_dynamics (setq _type_of_dynamics __type_of_dynamics)) _type_of_dynamics)
  (:delta_t
   (&optional __delta_t)
   (if __delta_t (setq _delta_t __delta_t)) _delta_t)
  (:which_radius_array
   (&rest __which_radius_array)
   (if (keywordp (car __which_radius_array))
       (send* _which_radius_array __which_radius_array)
     (progn
       (if __which_radius_array (setq _which_radius_array (car __which_radius_array)))
       _which_radius_array)))
  (:this_path
   (&rest __this_path)
   (if (keywordp (car __this_path))
       (send* _this_path __this_path)
     (progn
       (if __this_path (setq _this_path (car __this_path)))
       _this_path)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _x_0
    (send _x_0 :serialization-length)
    ;; geometry_msgs/Point _x_f
    (send _x_f :serialization-length)
    ;; float64 _U_max
    8
    ;; geometry_msgs/PoseArray _nodes
    (send _nodes :serialization-length)
    ;; std_msgs/Float64MultiArray _radii
    (send _radii :serialization-length)
    ;; int64 _num_steps
    8
    ;; int64 _num_this_path
    8
    ;; int64 _type_of_dynamics
    8
    ;; float64 _delta_t
    8
    ;; std_msgs/Int64MultiArray _which_radius_array
    (send _which_radius_array :serialization-length)
    ;; std_msgs/Int64MultiArray _this_path
    (send _this_path :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _x_0
       (send _x_0 :serialize s)
     ;; geometry_msgs/Point _x_f
       (send _x_f :serialize s)
     ;; float64 _U_max
       (sys::poke _U_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/PoseArray _nodes
       (send _nodes :serialize s)
     ;; std_msgs/Float64MultiArray _radii
       (send _radii :serialize s)
     ;; int64 _num_steps
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _num_steps (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _num_steps) (= (length (_num_steps . bv)) 2)) ;; bignum
              (write-long (ash (elt (_num_steps . bv) 0) 0) s)
              (write-long (ash (elt (_num_steps . bv) 1) -1) s))
             ((and (class _num_steps) (= (length (_num_steps . bv)) 1)) ;; big1
              (write-long (elt (_num_steps . bv) 0) s)
              (write-long (if (>= _num_steps 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _num_steps s)(write-long (if (>= _num_steps 0) 0 #xffffffff) s)))
     ;; int64 _num_this_path
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _num_this_path (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _num_this_path) (= (length (_num_this_path . bv)) 2)) ;; bignum
              (write-long (ash (elt (_num_this_path . bv) 0) 0) s)
              (write-long (ash (elt (_num_this_path . bv) 1) -1) s))
             ((and (class _num_this_path) (= (length (_num_this_path . bv)) 1)) ;; big1
              (write-long (elt (_num_this_path . bv) 0) s)
              (write-long (if (>= _num_this_path 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _num_this_path s)(write-long (if (>= _num_this_path 0) 0 #xffffffff) s)))
     ;; int64 _type_of_dynamics
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _type_of_dynamics (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _type_of_dynamics) (= (length (_type_of_dynamics . bv)) 2)) ;; bignum
              (write-long (ash (elt (_type_of_dynamics . bv) 0) 0) s)
              (write-long (ash (elt (_type_of_dynamics . bv) 1) -1) s))
             ((and (class _type_of_dynamics) (= (length (_type_of_dynamics . bv)) 1)) ;; big1
              (write-long (elt (_type_of_dynamics . bv) 0) s)
              (write-long (if (>= _type_of_dynamics 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _type_of_dynamics s)(write-long (if (>= _type_of_dynamics 0) 0 #xffffffff) s)))
     ;; float64 _delta_t
       (sys::poke _delta_t (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; std_msgs/Int64MultiArray _which_radius_array
       (send _which_radius_array :serialize s)
     ;; std_msgs/Int64MultiArray _this_path
       (send _this_path :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _x_0
     (send _x_0 :deserialize buf ptr-) (incf ptr- (send _x_0 :serialization-length))
   ;; geometry_msgs/Point _x_f
     (send _x_f :deserialize buf ptr-) (incf ptr- (send _x_f :serialization-length))
   ;; float64 _U_max
     (setq _U_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/PoseArray _nodes
     (send _nodes :deserialize buf ptr-) (incf ptr- (send _nodes :serialization-length))
   ;; std_msgs/Float64MultiArray _radii
     (send _radii :deserialize buf ptr-) (incf ptr- (send _radii :serialization-length))
   ;; int64 _num_steps
#+(or :alpha :irix6 :x86_64)
      (setf _num_steps (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _num_steps (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _num_this_path
#+(or :alpha :irix6 :x86_64)
      (setf _num_this_path (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _num_this_path (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _type_of_dynamics
#+(or :alpha :irix6 :x86_64)
      (setf _type_of_dynamics (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _type_of_dynamics (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _delta_t
     (setq _delta_t (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; std_msgs/Int64MultiArray _which_radius_array
     (send _which_radius_array :deserialize buf ptr-) (incf ptr- (send _which_radius_array :serialization-length))
   ;; std_msgs/Int64MultiArray _this_path
     (send _this_path :deserialize buf ptr-) (incf ptr- (send _this_path :serialization-length))
   ;;
   self)
  )

(defclass hivemind::CVXpyResponse
  :super ros::object
  :slots (_x_opt _u_opt _cost ))

(defmethod hivemind::CVXpyResponse
  (:init
   (&key
    ((:x_opt __x_opt) (instance geometry_msgs::PoseArray :init))
    ((:u_opt __u_opt) (instance geometry_msgs::PoseArray :init))
    ((:cost __cost) 0.0)
    )
   (send-super :init)
   (setq _x_opt __x_opt)
   (setq _u_opt __u_opt)
   (setq _cost (float __cost))
   self)
  (:x_opt
   (&rest __x_opt)
   (if (keywordp (car __x_opt))
       (send* _x_opt __x_opt)
     (progn
       (if __x_opt (setq _x_opt (car __x_opt)))
       _x_opt)))
  (:u_opt
   (&rest __u_opt)
   (if (keywordp (car __u_opt))
       (send* _u_opt __u_opt)
     (progn
       (if __u_opt (setq _u_opt (car __u_opt)))
       _u_opt)))
  (:cost
   (&optional __cost)
   (if __cost (setq _cost __cost)) _cost)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseArray _x_opt
    (send _x_opt :serialization-length)
    ;; geometry_msgs/PoseArray _u_opt
    (send _u_opt :serialization-length)
    ;; float64 _cost
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseArray _x_opt
       (send _x_opt :serialize s)
     ;; geometry_msgs/PoseArray _u_opt
       (send _u_opt :serialize s)
     ;; float64 _cost
       (sys::poke _cost (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseArray _x_opt
     (send _x_opt :deserialize buf ptr-) (incf ptr- (send _x_opt :serialization-length))
   ;; geometry_msgs/PoseArray _u_opt
     (send _u_opt :deserialize buf ptr-) (incf ptr- (send _u_opt :serialization-length))
   ;; float64 _cost
     (setq _cost (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass hivemind::CVXpy
  :super ros::object
  :slots ())

(setf (get hivemind::CVXpy :md5sum-) "c0d55e6e98e4357c0e73f9e900c18298")
(setf (get hivemind::CVXpy :datatype-) "hivemind/CVXpy")
(setf (get hivemind::CVXpy :request) hivemind::CVXpyRequest)
(setf (get hivemind::CVXpy :response) hivemind::CVXpyResponse)

(defmethod hivemind::CVXpyRequest
  (:response () (instance hivemind::CVXpyResponse :init)))

(setf (get hivemind::CVXpyRequest :md5sum-) "c0d55e6e98e4357c0e73f9e900c18298")
(setf (get hivemind::CVXpyRequest :datatype-) "hivemind/CVXpyRequest")
(setf (get hivemind::CVXpyRequest :definition-)
      "geometry_msgs/Point x_0
geometry_msgs/Point x_f
float64 U_max
geometry_msgs/PoseArray nodes
std_msgs/Float64MultiArray radii
int64 num_steps
int64 num_this_path
int64 type_of_dynamics
float64 delta_t
std_msgs/Int64MultiArray which_radius_array
std_msgs/Int64MultiArray this_path

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/PoseArray
# An array of poses with a header for global reference.

Header header

Pose[] poses

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: std_msgs/Float64MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float64[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
uint32 stride  # stride of given dimension
================================================================================
MSG: std_msgs/Int64MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int64[]           data          # array of data

---
geometry_msgs/PoseArray x_opt
geometry_msgs/PoseArray u_opt
float64 cost


================================================================================
MSG: geometry_msgs/PoseArray
# An array of poses with a header for global reference.

Header header

Pose[] poses

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get hivemind::CVXpyResponse :md5sum-) "c0d55e6e98e4357c0e73f9e900c18298")
(setf (get hivemind::CVXpyResponse :datatype-) "hivemind/CVXpyResponse")
(setf (get hivemind::CVXpyResponse :definition-)
      "geometry_msgs/Point x_0
geometry_msgs/Point x_f
float64 U_max
geometry_msgs/PoseArray nodes
std_msgs/Float64MultiArray radii
int64 num_steps
int64 num_this_path
int64 type_of_dynamics
float64 delta_t
std_msgs/Int64MultiArray which_radius_array
std_msgs/Int64MultiArray this_path

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/PoseArray
# An array of poses with a header for global reference.

Header header

Pose[] poses

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: std_msgs/Float64MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float64[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
uint32 stride  # stride of given dimension
================================================================================
MSG: std_msgs/Int64MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int64[]           data          # array of data

---
geometry_msgs/PoseArray x_opt
geometry_msgs/PoseArray u_opt
float64 cost


================================================================================
MSG: geometry_msgs/PoseArray
# An array of poses with a header for global reference.

Header header

Pose[] poses

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :hivemind/CVXpy "c0d55e6e98e4357c0e73f9e900c18298")


