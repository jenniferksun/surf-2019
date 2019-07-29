// Generated by gencpp from file hivemind/SATOResponse.msg
// DO NOT EDIT!


#ifndef HIVEMIND_MESSAGE_SATORESPONSE_H
#define HIVEMIND_MESSAGE_SATORESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace hivemind
{
template <class ContainerAllocator>
struct SATOResponse_
{
  typedef SATOResponse_<ContainerAllocator> Type;

  SATOResponse_()
    : trajectory()  {
    }
  SATOResponse_(const ContainerAllocator& _alloc)
    : trajectory(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::geometry_msgs::Point_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Point_<ContainerAllocator> >::other >  _trajectory_type;
  _trajectory_type trajectory;





  typedef boost::shared_ptr< ::hivemind::SATOResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hivemind::SATOResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SATOResponse_

typedef ::hivemind::SATOResponse_<std::allocator<void> > SATOResponse;

typedef boost::shared_ptr< ::hivemind::SATOResponse > SATOResponsePtr;
typedef boost::shared_ptr< ::hivemind::SATOResponse const> SATOResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hivemind::SATOResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hivemind::SATOResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace hivemind

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/melodic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'hivemind': ['/home/jksun/surf-2019/jksun_ws/src/ros_hivemind/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::hivemind::SATOResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hivemind::SATOResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hivemind::SATOResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hivemind::SATOResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hivemind::SATOResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hivemind::SATOResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hivemind::SATOResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1036b57ec79878254963e85ecdd45cfe";
  }

  static const char* value(const ::hivemind::SATOResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1036b57ec7987825ULL;
  static const uint64_t static_value2 = 0x4963e85ecdd45cfeULL;
};

template<class ContainerAllocator>
struct DataType< ::hivemind::SATOResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hivemind/SATOResponse";
  }

  static const char* value(const ::hivemind::SATOResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hivemind::SATOResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point[] trajectory\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::hivemind::SATOResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hivemind::SATOResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.trajectory);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SATOResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hivemind::SATOResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hivemind::SATOResponse_<ContainerAllocator>& v)
  {
    s << indent << "trajectory[]" << std::endl;
    for (size_t i = 0; i < v.trajectory.size(); ++i)
    {
      s << indent << "  trajectory[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "    ", v.trajectory[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // HIVEMIND_MESSAGE_SATORESPONSE_H