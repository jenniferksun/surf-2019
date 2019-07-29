// Auto-generated. Do not edit!

// (in-package hivemind.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class CVXpyRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_0 = null;
      this.x_f = null;
      this.U_max = null;
      this.nodes = null;
      this.radii = null;
      this.num_steps = null;
      this.num_this_path = null;
      this.type_of_dynamics = null;
      this.delta_t = null;
      this.which_radius_array = null;
      this.this_path = null;
    }
    else {
      if (initObj.hasOwnProperty('x_0')) {
        this.x_0 = initObj.x_0
      }
      else {
        this.x_0 = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('x_f')) {
        this.x_f = initObj.x_f
      }
      else {
        this.x_f = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('U_max')) {
        this.U_max = initObj.U_max
      }
      else {
        this.U_max = 0.0;
      }
      if (initObj.hasOwnProperty('nodes')) {
        this.nodes = initObj.nodes
      }
      else {
        this.nodes = new geometry_msgs.msg.PoseArray();
      }
      if (initObj.hasOwnProperty('radii')) {
        this.radii = initObj.radii
      }
      else {
        this.radii = new std_msgs.msg.Float64MultiArray();
      }
      if (initObj.hasOwnProperty('num_steps')) {
        this.num_steps = initObj.num_steps
      }
      else {
        this.num_steps = 0;
      }
      if (initObj.hasOwnProperty('num_this_path')) {
        this.num_this_path = initObj.num_this_path
      }
      else {
        this.num_this_path = 0;
      }
      if (initObj.hasOwnProperty('type_of_dynamics')) {
        this.type_of_dynamics = initObj.type_of_dynamics
      }
      else {
        this.type_of_dynamics = 0;
      }
      if (initObj.hasOwnProperty('delta_t')) {
        this.delta_t = initObj.delta_t
      }
      else {
        this.delta_t = 0.0;
      }
      if (initObj.hasOwnProperty('which_radius_array')) {
        this.which_radius_array = initObj.which_radius_array
      }
      else {
        this.which_radius_array = new std_msgs.msg.Int64MultiArray();
      }
      if (initObj.hasOwnProperty('this_path')) {
        this.this_path = initObj.this_path
      }
      else {
        this.this_path = new std_msgs.msg.Int64MultiArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CVXpyRequest
    // Serialize message field [x_0]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.x_0, buffer, bufferOffset);
    // Serialize message field [x_f]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.x_f, buffer, bufferOffset);
    // Serialize message field [U_max]
    bufferOffset = _serializer.float64(obj.U_max, buffer, bufferOffset);
    // Serialize message field [nodes]
    bufferOffset = geometry_msgs.msg.PoseArray.serialize(obj.nodes, buffer, bufferOffset);
    // Serialize message field [radii]
    bufferOffset = std_msgs.msg.Float64MultiArray.serialize(obj.radii, buffer, bufferOffset);
    // Serialize message field [num_steps]
    bufferOffset = _serializer.int64(obj.num_steps, buffer, bufferOffset);
    // Serialize message field [num_this_path]
    bufferOffset = _serializer.int64(obj.num_this_path, buffer, bufferOffset);
    // Serialize message field [type_of_dynamics]
    bufferOffset = _serializer.int64(obj.type_of_dynamics, buffer, bufferOffset);
    // Serialize message field [delta_t]
    bufferOffset = _serializer.float64(obj.delta_t, buffer, bufferOffset);
    // Serialize message field [which_radius_array]
    bufferOffset = std_msgs.msg.Int64MultiArray.serialize(obj.which_radius_array, buffer, bufferOffset);
    // Serialize message field [this_path]
    bufferOffset = std_msgs.msg.Int64MultiArray.serialize(obj.this_path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CVXpyRequest
    let len;
    let data = new CVXpyRequest(null);
    // Deserialize message field [x_0]
    data.x_0 = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [x_f]
    data.x_f = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [U_max]
    data.U_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [nodes]
    data.nodes = geometry_msgs.msg.PoseArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [radii]
    data.radii = std_msgs.msg.Float64MultiArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_steps]
    data.num_steps = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [num_this_path]
    data.num_this_path = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [type_of_dynamics]
    data.type_of_dynamics = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [delta_t]
    data.delta_t = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [which_radius_array]
    data.which_radius_array = std_msgs.msg.Int64MultiArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [this_path]
    data.this_path = std_msgs.msg.Int64MultiArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseArray.getMessageSize(object.nodes);
    length += std_msgs.msg.Float64MultiArray.getMessageSize(object.radii);
    length += std_msgs.msg.Int64MultiArray.getMessageSize(object.which_radius_array);
    length += std_msgs.msg.Int64MultiArray.getMessageSize(object.this_path);
    return length + 88;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hivemind/CVXpyRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0e30bdb1c0d2912e355585699a39d0ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point x_0
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
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
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
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CVXpyRequest(null);
    if (msg.x_0 !== undefined) {
      resolved.x_0 = geometry_msgs.msg.Point.Resolve(msg.x_0)
    }
    else {
      resolved.x_0 = new geometry_msgs.msg.Point()
    }

    if (msg.x_f !== undefined) {
      resolved.x_f = geometry_msgs.msg.Point.Resolve(msg.x_f)
    }
    else {
      resolved.x_f = new geometry_msgs.msg.Point()
    }

    if (msg.U_max !== undefined) {
      resolved.U_max = msg.U_max;
    }
    else {
      resolved.U_max = 0.0
    }

    if (msg.nodes !== undefined) {
      resolved.nodes = geometry_msgs.msg.PoseArray.Resolve(msg.nodes)
    }
    else {
      resolved.nodes = new geometry_msgs.msg.PoseArray()
    }

    if (msg.radii !== undefined) {
      resolved.radii = std_msgs.msg.Float64MultiArray.Resolve(msg.radii)
    }
    else {
      resolved.radii = new std_msgs.msg.Float64MultiArray()
    }

    if (msg.num_steps !== undefined) {
      resolved.num_steps = msg.num_steps;
    }
    else {
      resolved.num_steps = 0
    }

    if (msg.num_this_path !== undefined) {
      resolved.num_this_path = msg.num_this_path;
    }
    else {
      resolved.num_this_path = 0
    }

    if (msg.type_of_dynamics !== undefined) {
      resolved.type_of_dynamics = msg.type_of_dynamics;
    }
    else {
      resolved.type_of_dynamics = 0
    }

    if (msg.delta_t !== undefined) {
      resolved.delta_t = msg.delta_t;
    }
    else {
      resolved.delta_t = 0.0
    }

    if (msg.which_radius_array !== undefined) {
      resolved.which_radius_array = std_msgs.msg.Int64MultiArray.Resolve(msg.which_radius_array)
    }
    else {
      resolved.which_radius_array = new std_msgs.msg.Int64MultiArray()
    }

    if (msg.this_path !== undefined) {
      resolved.this_path = std_msgs.msg.Int64MultiArray.Resolve(msg.this_path)
    }
    else {
      resolved.this_path = new std_msgs.msg.Int64MultiArray()
    }

    return resolved;
    }
};

class CVXpyResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_opt = null;
      this.u_opt = null;
      this.cost = null;
    }
    else {
      if (initObj.hasOwnProperty('x_opt')) {
        this.x_opt = initObj.x_opt
      }
      else {
        this.x_opt = new geometry_msgs.msg.PoseArray();
      }
      if (initObj.hasOwnProperty('u_opt')) {
        this.u_opt = initObj.u_opt
      }
      else {
        this.u_opt = new geometry_msgs.msg.PoseArray();
      }
      if (initObj.hasOwnProperty('cost')) {
        this.cost = initObj.cost
      }
      else {
        this.cost = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CVXpyResponse
    // Serialize message field [x_opt]
    bufferOffset = geometry_msgs.msg.PoseArray.serialize(obj.x_opt, buffer, bufferOffset);
    // Serialize message field [u_opt]
    bufferOffset = geometry_msgs.msg.PoseArray.serialize(obj.u_opt, buffer, bufferOffset);
    // Serialize message field [cost]
    bufferOffset = _serializer.float64(obj.cost, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CVXpyResponse
    let len;
    let data = new CVXpyResponse(null);
    // Deserialize message field [x_opt]
    data.x_opt = geometry_msgs.msg.PoseArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [u_opt]
    data.u_opt = geometry_msgs.msg.PoseArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [cost]
    data.cost = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseArray.getMessageSize(object.x_opt);
    length += geometry_msgs.msg.PoseArray.getMessageSize(object.u_opt);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hivemind/CVXpyResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '281be2cb3229293f0f36c1d2e7cc90d3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CVXpyResponse(null);
    if (msg.x_opt !== undefined) {
      resolved.x_opt = geometry_msgs.msg.PoseArray.Resolve(msg.x_opt)
    }
    else {
      resolved.x_opt = new geometry_msgs.msg.PoseArray()
    }

    if (msg.u_opt !== undefined) {
      resolved.u_opt = geometry_msgs.msg.PoseArray.Resolve(msg.u_opt)
    }
    else {
      resolved.u_opt = new geometry_msgs.msg.PoseArray()
    }

    if (msg.cost !== undefined) {
      resolved.cost = msg.cost;
    }
    else {
      resolved.cost = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: CVXpyRequest,
  Response: CVXpyResponse,
  md5sum() { return 'c0d55e6e98e4357c0e73f9e900c18298'; },
  datatype() { return 'hivemind/CVXpy'; }
};
