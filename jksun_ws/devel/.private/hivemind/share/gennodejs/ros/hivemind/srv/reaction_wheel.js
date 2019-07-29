// Auto-generated. Do not edit!

// (in-package hivemind.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class reaction_wheelRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.wheel_no = null;
      this.rpm = null;
    }
    else {
      if (initObj.hasOwnProperty('wheel_no')) {
        this.wheel_no = initObj.wheel_no
      }
      else {
        this.wheel_no = 0;
      }
      if (initObj.hasOwnProperty('rpm')) {
        this.rpm = initObj.rpm
      }
      else {
        this.rpm = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type reaction_wheelRequest
    // Serialize message field [wheel_no]
    bufferOffset = _serializer.int32(obj.wheel_no, buffer, bufferOffset);
    // Serialize message field [rpm]
    bufferOffset = _serializer.int32(obj.rpm, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type reaction_wheelRequest
    let len;
    let data = new reaction_wheelRequest(null);
    // Deserialize message field [wheel_no]
    data.wheel_no = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rpm]
    data.rpm = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hivemind/reaction_wheelRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a1c10355086de630a9a85c0bec0cf16a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 wheel_no
    int32 rpm
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new reaction_wheelRequest(null);
    if (msg.wheel_no !== undefined) {
      resolved.wheel_no = msg.wheel_no;
    }
    else {
      resolved.wheel_no = 0
    }

    if (msg.rpm !== undefined) {
      resolved.rpm = msg.rpm;
    }
    else {
      resolved.rpm = 0
    }

    return resolved;
    }
};

class reaction_wheelResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type reaction_wheelResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type reaction_wheelResponse
    let len;
    let data = new reaction_wheelResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hivemind/reaction_wheelResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new reaction_wheelResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: reaction_wheelRequest,
  Response: reaction_wheelResponse,
  md5sum() { return '2b5d6a6d532066fbb81f8a947d5d2ca3'; },
  datatype() { return 'hivemind/reaction_wheel'; }
};
