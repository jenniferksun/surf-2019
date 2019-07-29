// Generated by gencpp from file hivemind/reaction_wheelResponse.msg
// DO NOT EDIT!


#ifndef HIVEMIND_MESSAGE_REACTION_WHEELRESPONSE_H
#define HIVEMIND_MESSAGE_REACTION_WHEELRESPONSE_H


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
struct reaction_wheelResponse_
{
  typedef reaction_wheelResponse_<ContainerAllocator> Type;

  reaction_wheelResponse_()
    : success(false)  {
    }
  reaction_wheelResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::hivemind::reaction_wheelResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hivemind::reaction_wheelResponse_<ContainerAllocator> const> ConstPtr;

}; // struct reaction_wheelResponse_

typedef ::hivemind::reaction_wheelResponse_<std::allocator<void> > reaction_wheelResponse;

typedef boost::shared_ptr< ::hivemind::reaction_wheelResponse > reaction_wheelResponsePtr;
typedef boost::shared_ptr< ::hivemind::reaction_wheelResponse const> reaction_wheelResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hivemind::reaction_wheelResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hivemind::reaction_wheelResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hivemind::reaction_wheelResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hivemind::reaction_wheelResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::hivemind::reaction_wheelResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hivemind/reaction_wheelResponse";
  }

  static const char* value(const ::hivemind::reaction_wheelResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
"\n"
;
  }

  static const char* value(const ::hivemind::reaction_wheelResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct reaction_wheelResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hivemind::reaction_wheelResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hivemind::reaction_wheelResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HIVEMIND_MESSAGE_REACTION_WHEELRESPONSE_H
