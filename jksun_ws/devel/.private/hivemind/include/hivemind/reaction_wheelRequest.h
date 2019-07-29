// Generated by gencpp from file hivemind/reaction_wheelRequest.msg
// DO NOT EDIT!


#ifndef HIVEMIND_MESSAGE_REACTION_WHEELREQUEST_H
#define HIVEMIND_MESSAGE_REACTION_WHEELREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace hivemind
{
template <class ContainerAllocator>
struct reaction_wheelRequest_
{
  typedef reaction_wheelRequest_<ContainerAllocator> Type;

  reaction_wheelRequest_()
    : wheel_no(0)
    , rpm(0)  {
    }
  reaction_wheelRequest_(const ContainerAllocator& _alloc)
    : wheel_no(0)
    , rpm(0)  {
  (void)_alloc;
    }



   typedef int32_t _wheel_no_type;
  _wheel_no_type wheel_no;

   typedef int32_t _rpm_type;
  _rpm_type rpm;





  typedef boost::shared_ptr< ::hivemind::reaction_wheelRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hivemind::reaction_wheelRequest_<ContainerAllocator> const> ConstPtr;

}; // struct reaction_wheelRequest_

typedef ::hivemind::reaction_wheelRequest_<std::allocator<void> > reaction_wheelRequest;

typedef boost::shared_ptr< ::hivemind::reaction_wheelRequest > reaction_wheelRequestPtr;
typedef boost::shared_ptr< ::hivemind::reaction_wheelRequest const> reaction_wheelRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hivemind::reaction_wheelRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace hivemind

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/melodic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'hivemind': ['/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hivemind::reaction_wheelRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hivemind::reaction_wheelRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hivemind::reaction_wheelRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a1c10355086de630a9a85c0bec0cf16a";
  }

  static const char* value(const ::hivemind::reaction_wheelRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa1c10355086de630ULL;
  static const uint64_t static_value2 = 0xa9a85c0bec0cf16aULL;
};

template<class ContainerAllocator>
struct DataType< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hivemind/reaction_wheelRequest";
  }

  static const char* value(const ::hivemind::reaction_wheelRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 wheel_no\n"
"int32 rpm\n"
;
  }

  static const char* value(const ::hivemind::reaction_wheelRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.wheel_no);
      stream.next(m.rpm);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct reaction_wheelRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hivemind::reaction_wheelRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hivemind::reaction_wheelRequest_<ContainerAllocator>& v)
  {
    s << indent << "wheel_no: ";
    Printer<int32_t>::stream(s, indent + "  ", v.wheel_no);
    s << indent << "rpm: ";
    Printer<int32_t>::stream(s, indent + "  ", v.rpm);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HIVEMIND_MESSAGE_REACTION_WHEELREQUEST_H
