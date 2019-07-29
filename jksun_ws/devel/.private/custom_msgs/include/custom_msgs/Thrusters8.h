// Generated by gencpp from file custom_msgs/Thrusters8.msg
// DO NOT EDIT!


#ifndef CUSTOM_MSGS_MESSAGE_THRUSTERS8_H
#define CUSTOM_MSGS_MESSAGE_THRUSTERS8_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace custom_msgs
{
template <class ContainerAllocator>
struct Thrusters8_
{
  typedef Thrusters8_<ContainerAllocator> Type;

  Thrusters8_()
    : header()
    , FXpMZp(0.0)
    , FXpMZm(0.0)
    , FXmMZp(0.0)
    , FXmMZm(0.0)
    , FYpMZp(0.0)
    , FYpMZm(0.0)
    , FYmMZp(0.0)
    , FYmMZm(0.0)  {
    }
  Thrusters8_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , FXpMZp(0.0)
    , FXpMZm(0.0)
    , FXmMZp(0.0)
    , FXmMZm(0.0)
    , FYpMZp(0.0)
    , FYpMZm(0.0)
    , FYmMZp(0.0)
    , FYmMZm(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _FXpMZp_type;
  _FXpMZp_type FXpMZp;

   typedef float _FXpMZm_type;
  _FXpMZm_type FXpMZm;

   typedef float _FXmMZp_type;
  _FXmMZp_type FXmMZp;

   typedef float _FXmMZm_type;
  _FXmMZm_type FXmMZm;

   typedef float _FYpMZp_type;
  _FYpMZp_type FYpMZp;

   typedef float _FYpMZm_type;
  _FYpMZm_type FYpMZm;

   typedef float _FYmMZp_type;
  _FYmMZp_type FYmMZp;

   typedef float _FYmMZm_type;
  _FYmMZm_type FYmMZm;





  typedef boost::shared_ptr< ::custom_msgs::Thrusters8_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::custom_msgs::Thrusters8_<ContainerAllocator> const> ConstPtr;

}; // struct Thrusters8_

typedef ::custom_msgs::Thrusters8_<std::allocator<void> > Thrusters8;

typedef boost::shared_ptr< ::custom_msgs::Thrusters8 > Thrusters8Ptr;
typedef boost::shared_ptr< ::custom_msgs::Thrusters8 const> Thrusters8ConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::custom_msgs::Thrusters8_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::custom_msgs::Thrusters8_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace custom_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'custom_msgs': ['/home/jksun/surf-2019/jksun_ws/src/custom_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::custom_msgs::Thrusters8_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::custom_msgs::Thrusters8_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::custom_msgs::Thrusters8_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::custom_msgs::Thrusters8_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::custom_msgs::Thrusters8_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::custom_msgs::Thrusters8_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::custom_msgs::Thrusters8_<ContainerAllocator> >
{
  static const char* value()
  {
    return "51b0cb1b10c2fc8b58fb90e8108ac3ef";
  }

  static const char* value(const ::custom_msgs::Thrusters8_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x51b0cb1b10c2fc8bULL;
  static const uint64_t static_value2 = 0x58fb90e8108ac3efULL;
};

template<class ContainerAllocator>
struct DataType< ::custom_msgs::Thrusters8_<ContainerAllocator> >
{
  static const char* value()
  {
    return "custom_msgs/Thrusters8";
  }

  static const char* value(const ::custom_msgs::Thrusters8_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::custom_msgs::Thrusters8_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"float32 FXpMZp\n"
"float32 FXpMZm\n"
"float32 FXmMZp\n"
"float32 FXmMZm\n"
"float32 FYpMZp\n"
"float32 FYpMZm\n"
"float32 FYmMZp\n"
"float32 FYmMZm\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::custom_msgs::Thrusters8_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::custom_msgs::Thrusters8_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.FXpMZp);
      stream.next(m.FXpMZm);
      stream.next(m.FXmMZp);
      stream.next(m.FXmMZm);
      stream.next(m.FYpMZp);
      stream.next(m.FYpMZm);
      stream.next(m.FYmMZp);
      stream.next(m.FYmMZm);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Thrusters8_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::custom_msgs::Thrusters8_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::custom_msgs::Thrusters8_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "FXpMZp: ";
    Printer<float>::stream(s, indent + "  ", v.FXpMZp);
    s << indent << "FXpMZm: ";
    Printer<float>::stream(s, indent + "  ", v.FXpMZm);
    s << indent << "FXmMZp: ";
    Printer<float>::stream(s, indent + "  ", v.FXmMZp);
    s << indent << "FXmMZm: ";
    Printer<float>::stream(s, indent + "  ", v.FXmMZm);
    s << indent << "FYpMZp: ";
    Printer<float>::stream(s, indent + "  ", v.FYpMZp);
    s << indent << "FYpMZm: ";
    Printer<float>::stream(s, indent + "  ", v.FYpMZm);
    s << indent << "FYmMZp: ";
    Printer<float>::stream(s, indent + "  ", v.FYmMZp);
    s << indent << "FYmMZm: ";
    Printer<float>::stream(s, indent + "  ", v.FYmMZm);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CUSTOM_MSGS_MESSAGE_THRUSTERS8_H
