// Auto-generated. Do not edit!

// (in-package hivemind.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SATORequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.initial_positions = null;
      this.final_positions = null;
      this.n = null;
      this.index = null;
    }
    else {
      if (initObj.hasOwnProperty('initial_positions')) {
        this.initial_positions = initObj.initial_positions
      }
      else {
        this.initial_positions = [];
      }
      if (initObj.hasOwnProperty('final_positions')) {
        this.final_positions = initObj.final_positions
      }
      else {
        this.final_positions = [];
      }
      if (initObj.hasOwnProperty('n')) {
        this.n = initObj.n
      }
      else {
        this.n = 0;
      }
      if (initObj.hasOwnProperty('index')) {
        this.index = initObj.index
      }
      else {
        this.index = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SATORequest
    // Serialize message field [initial_positions]
    // Serialize the length for message field [initial_positions]
    bufferOffset = _serializer.uint32(obj.initial_positions.length, buffer, bufferOffset);
    obj.initial_positions.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [final_positions]
    // Serialize the length for message field [final_positions]
    bufferOffset = _serializer.uint32(obj.final_positions.length, buffer, bufferOffset);
    obj.final_positions.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [n]
    bufferOffset = _serializer.int32(obj.n, buffer, bufferOffset);
    // Serialize message field [index]
    bufferOffset = _serializer.int32(obj.index, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SATORequest
    let len;
    let data = new SATORequest(null);
    // Deserialize message field [initial_positions]
    // Deserialize array length for message field [initial_positions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.initial_positions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.initial_positions[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [final_positions]
    // Deserialize array length for message field [final_positions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.final_positions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.final_positions[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [n]
    data.n = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [index]
    data.index = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.initial_positions.length;
    length += 24 * object.final_positions.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hivemind/SATORequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9fe277a57646632f33e40f2ce2b6d017';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point[] initial_positions
    geometry_msgs/Point[] final_positions
    int32 n
    int32 index
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SATORequest(null);
    if (msg.initial_positions !== undefined) {
      resolved.initial_positions = new Array(msg.initial_positions.length);
      for (let i = 0; i < resolved.initial_positions.length; ++i) {
        resolved.initial_positions[i] = geometry_msgs.msg.Point.Resolve(msg.initial_positions[i]);
      }
    }
    else {
      resolved.initial_positions = []
    }

    if (msg.final_positions !== undefined) {
      resolved.final_positions = new Array(msg.final_positions.length);
      for (let i = 0; i < resolved.final_positions.length; ++i) {
        resolved.final_positions[i] = geometry_msgs.msg.Point.Resolve(msg.final_positions[i]);
      }
    }
    else {
      resolved.final_positions = []
    }

    if (msg.n !== undefined) {
      resolved.n = msg.n;
    }
    else {
      resolved.n = 0
    }

    if (msg.index !== undefined) {
      resolved.index = msg.index;
    }
    else {
      resolved.index = 0
    }

    return resolved;
    }
};

class SATOResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajectory = null;
    }
    else {
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SATOResponse
    // Serialize message field [trajectory]
    // Serialize the length for message field [trajectory]
    bufferOffset = _serializer.uint32(obj.trajectory.length, buffer, bufferOffset);
    obj.trajectory.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SATOResponse
    let len;
    let data = new SATOResponse(null);
    // Deserialize message field [trajectory]
    // Deserialize array length for message field [trajectory]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.trajectory = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.trajectory[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.trajectory.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hivemind/SATOResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1036b57ec79878254963e85ecdd45cfe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point[] trajectory
    
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SATOResponse(null);
    if (msg.trajectory !== undefined) {
      resolved.trajectory = new Array(msg.trajectory.length);
      for (let i = 0; i < resolved.trajectory.length; ++i) {
        resolved.trajectory[i] = geometry_msgs.msg.Point.Resolve(msg.trajectory[i]);
      }
    }
    else {
      resolved.trajectory = []
    }

    return resolved;
    }
};

module.exports = {
  Request: SATORequest,
  Response: SATOResponse,
  md5sum() { return 'fbafa20672cd86d3d22a79748644c995'; },
  datatype() { return 'hivemind/SATO'; }
};
