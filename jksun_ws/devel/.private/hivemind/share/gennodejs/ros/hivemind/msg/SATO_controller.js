// Auto-generated. Do not edit!

// (in-package hivemind.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class SATO_controller {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.initial_position = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('initial_position')) {
        this.initial_position = initObj.initial_position
      }
      else {
        this.initial_position = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SATO_controller
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [initial_position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.initial_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SATO_controller
    let len;
    let data = new SATO_controller(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [initial_position]
    data.initial_position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hivemind/SATO_controller';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c03a91c04ace9722de7dbeaf894c70ca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Used for SATO guidance to figure out what other controllers exist/order them
    string name                         #the unique name of the controller
    geometry_msgs/Point initial_position   #the position of this controller before SATO runs
    
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
    const resolved = new SATO_controller(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.initial_position !== undefined) {
      resolved.initial_position = geometry_msgs.msg.Point.Resolve(msg.initial_position)
    }
    else {
      resolved.initial_position = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = SATO_controller;
