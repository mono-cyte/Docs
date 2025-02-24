# NETLINK

## 概述

**NETLINK**是Linux内核中的一种通信机制，允许用户空间应用程序与内核空间进行双向通信。它被设计为一种高效、灵活的IPC（进程间通信）方式，专门用于网络子系统和其他内核模块与用户空间应用之间的交互。

## 特点

- **异步通信**：支持异步通信，允许内核和用户空间应用进行并发操作。
- **多协议支持**：NETLINK可以承载多种协议数据，如NETLINK_ROUTE、NETLINK_FIREWALL等。
- **内核模块扩展**：内核模块可以使用NETLINK协议来提供自己的用户空间接口。
- **可靠性**：NETLINK使用SOCK_DGRAM或SOCK_RAW类型的套接字，提供一定程度的可靠性。
- **广播和多播**：支持广播和多播通信，允许一个消息被发送到多个接收者。

## 使用场景

- **网络管理**：用于配置和监控网络接口、路由、防火墙等。
- **系统监控**：获取系统状态、性能统计、事件通知等。
- **内核模块扩展**：自定义内核模块可以使用NETLINK提供用户空间接口。
- **用户空间应用**：如dhcpd、wpa_supplicant等需要与内核交互的应用。

netlink(3)				       Library Functions Manual					   netlink(3)

NAME
       netlink - Netlink macros

LIBRARY
       Standard C library (libc, -lc)

SYNOPSIS
       #include <asm/types.h>
       #include <linux/netlink.h>

       int NLMSG_ALIGN(size_t len);
       int NLMSG_LENGTH(size_t len);
       int NLMSG_SPACE(size_t len);
       void *NLMSG_DATA(struct nlmsghdr *nlh);
       struct nlmsghdr *NLMSG_NEXT(struct nlmsghdr *nlh, int len);
       int NLMSG_OK(struct nlmsghdr *nlh, int len);
       int NLMSG_PAYLOAD(struct nlmsghdr *nlh, int len);

DESCRIPTION
       <linux/netlink.h> defines several standard macros to access or create a netlink datagram.  They are similar in
       spirit  to  the	macros defined in cmsg(3) for auxiliary data.  The buffer passed to and from a netlink socket
       should be accessed using only these macros.

       NLMSG_ALIGN()
	      Round the length of a netlink message up to align it properly.

       NLMSG_LENGTH()
	      Given the payload length, len, this macro returns the aligned length to store in the nlmsg_len field of
	      the nlmsghdr.

       NLMSG_SPACE()
	      Return the number of bytes that a netlink message with payload of len would occupy.

       NLMSG_DATA()
	      Return a pointer to the payload associated with the passed nlmsghdr.

       NLMSG_NEXT()
	      Get the next nlmsghdr in a multipart message.  The caller must check if  the  current  nlmsghdr  didn't
	      have  the	 NLMSG_DONE set—this function doesn't return NULL on end.  The len argument is an lvalue con‐
	      taining the remaining length of the message buffer.  This macro decrements it by the length of the mes‐
	      sage header.

       NLMSG_OK()
	      Return true if the netlink message is not truncated and is in a form suitable for parsing.

       NLMSG_PAYLOAD()
	      Return the length of the payload associated with the nlmsghdr.

VERSIONS
       It is often better to use netlink via libnetlink than via the low-level kernel interface.

STANDARDS
       Linux.

SEE ALSO
       libnetlink(3), netlink(7)

Linux man-pages 6.7				      2023-10-31					   netlink(3)
