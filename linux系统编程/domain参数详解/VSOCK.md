# VSOCK - 虚拟套接字（VMware VSockets）

## 概述

**虚拟套接字（VSOCK）** 最初是由VMware开发的，旨在为虚拟化环境提供一种高效的通信机制，允许虚拟机（VM）与宿主机或其他虚拟机之间进行直接、快速的网络通信。VSOCK协议提供了一种比传统的TCP/IP套接字更快、更安全和更高效的通信方式，因为它不需要经过传统的网络栈处理。

## VSOCK的关键特性

### 1. **高效通信**

- **内核级通信**：VSOCK通信发生在内核空间，减少了上下文切换和数据复制的开销。
- **直接数据传输**：数据直接在虚拟机和宿主机之间传输，避免了网络设备和网络栈的干预。

### 2. **安全性**

- **隔离**：VSOCK提供了虚拟机之间的隔离，减少了潜在的网络攻击面。
- **控制访问**：可以精确控制哪些虚拟机可以与宿主机或其他虚拟机通信。

### 3. **低延迟**

- **无网络栈**：由于绕过了传统的网络协议栈，数据包的处理速度大大提高。
- **内核旁路**：数据包直接在内核中处理，避免了用户空间到内核空间的切换。

### 4. **简单性**

- **协议简化**：VSOCK协议比TCP/IP简单，减少了配置和管理的复杂性。
- **无需网络配置**：不需要为每个虚拟机配置IP地址或网络接口。

### 5. **灵活性**

- **跨平台支持**：VSOCK可以用于多种虚拟化平台，包括VMware、KVM、Xen等。
- **多种用途**：适用于文件传输、共享剪贴板、设备模拟等多种应用场景。

## VSOCK的工作原理

### 1. **虚拟化环境**

- **虚拟机监控程序**：VSOCK由Hypervisor支持，提供通信的物理基础。
- **虚拟机**：每个虚拟机可以拥有自己的VSOCK接口，与宿主机或其他虚拟机通信。

### 2. **通信机制**

- **VSOCK设备**：每个虚拟机和宿主机都有特定的VSOCK设备，用于通信。
- **CID（Context ID）**：每个虚拟机和宿主机都有唯一的CID，用于标识通信双方。

### 3. **连接建立**

- **连接发起**：一个虚拟机或宿主机可以使用VSOCK API来发起连接。
- **监听**：另一方可以监听特定端口，等待连接。

### 4. **数据传输**

- **直接传输**：数据通过VSOCK设备直接在虚拟机和宿主机之间传输。
- **无需路由**：因为是点对点通信，不需要网络路由。

### 5. **应用层协议**

- **自定义协议**：应用可以根据需要在VSOCK上实现自己的协议。
- **文件传输**：例如，文件传输可以直接通过VSOCK进行，不需要通过传统网络协议。

## VSOCK的实现方式

### 1. **内核支持**

- **Linux内核**：VSOCK被集成到Linux内核中，从Linux 3.9开始支持。
- **驱动程序**：VSOCK需要特定虚拟化平台的驱动支持。

### 2. **用户空间库**

- **libvhost-user**：用于处理VSOCK通信的用户空间库。
- **VMware Tools**：提供对VSOCK的支持，简化虚拟机与宿主机之间的通信。

### 3. **虚拟化平台**

- **VMware Workstation/ESXi**：VMware最初的实现平台。
- **KVM/QEMU**：KVM和QEMU支持VSOCK，提供虚拟机之间的高效通信。
- **Xen**：Xen也有对VSOCK的支持。
- **Hyper-V**：微软的Hyper-V也实现了VSOCK。

## VSOCK的应用场景

### 1. **文件共享和传输**

- **虚拟机与宿主机之间**：快速、安全地传输文件。
- **虚拟机之间的文件共享**：实现VM之间的文件共享机制。

### 2. **设备模拟**

- **USB设备**：模拟USB设备在虚拟机和宿主机之间的传输。
- **图形接口**：通过VSOCK实现虚拟机和宿主机之间的图形设备共享。

### 3. **剪贴板共享**

- **虚拟机与宿主机剪贴板**：实现剪贴板内容的同步和共享。

### 4. **网络隔离**

- **安全通信**：在不需要网络连接的情况下，提供安全的虚拟机间通信。

### 5. **性能测试**

- **网络性能测试**：由于VSOCK的低延迟特性，适用于测试网络性能。

## VSOCK的挑战

### 1. **平台兼容性**

- **虚拟化平台支持**：并非所有虚拟化平台都原生支持VSOCK，需要特别的配置或支持。

### 2. **性能调优**

- **配置优化**：需要对VSOCK通信进行优化，以达到最佳性能。

### 3. **安全性**

- **权限管理**：需要管理VSOCK的访问权限，确保安全性。

### 4. **生态系统**

- **生态支持**：虽然VSOCK在虚拟化环境中很有用，但支持它的软件和工具相对有限。

### 5. **调试与监控**

- **内核级调试**：调试和监控VSOCK通信可能比较困难，需要对内核有深入的了解。

## 总结

虚拟套接字（VSOCK），最初由VMware开发，为虚拟化环境提供了高效、低延迟的通信方式，特别适用于虚拟机与宿主机之间的直接通信。VSOCK的设计简化了虚拟化环境中的网络配置和通信，同时提供了更好的安全性和性能。然而，VSOCK的使用也面临一些挑战，如平台兼容性、性能优化和安全管理等。尽管如此，VSOCK在虚拟化领域仍然是一个重要的技术，用于提高虚拟化环境中的网络性能和简化管理。

vsock(7)				   Miscellaneous Information Manual				     vsock(7)

NAME
       vsock - Linux VSOCK address family

SYNOPSIS
       #include <sys/socket.h>
       #include <linux/vm_sockets.h>

       stream_socket = socket(AF_VSOCK, SOCK_STREAM, 0);
       datagram_socket = socket(AF_VSOCK, SOCK_DGRAM, 0);

DESCRIPTION
       The  VSOCK address family facilitates communication between virtual machines and the host they are running on.
       This address family is used by guest agents and hypervisor services that need a communications channel that is
       independent of virtual machine network configuration.

       Valid socket types are SOCK_STREAM and SOCK_DGRAM.  SOCK_STREAM provides connection-oriented byte streams with
       guaranteed, in-order delivery.  SOCK_DGRAM provides a connectionless datagram packet service with  best-effort
       delivery and best-effort ordering.  Availability of these socket types is dependent on the underlying hypervi‐
       sor.

       A new socket is created with

	   socket(AF_VSOCK, socket_type, 0);

       When  a	process wants to establish a connection, it calls connect(2) with a given destination socket address.
       The socket is automatically bound to a free port if unbound.

       A process can listen for incoming connections by first binding to a socket  address  using  bind(2)  and	 then
       calling listen(2).

       Data  is	 transmitted  using  the  send(2) or write(2) families of system calls and data is received using the
       recv(2) or read(2) families of system calls.

   Address format
       A socket address is defined as a combination of a 32-bit Context Identifier (CID) and a	32-bit	port  number.
       The  CID identifies the source or destination, which is either a virtual machine or the host.  The port number
       differentiates between multiple services running on a single machine.

	   struct sockaddr_vm {
	       sa_family_t    svm_family;    /* Address family: AF_VSOCK */
	       unsigned short svm_reserved1;
	       unsigned int   svm_port;	     /* Port # in host byte order */
	       unsigned int   svm_cid;	     /* Address in host byte order */
	       unsigned char  svm_zero[sizeof(struct sockaddr) -
				       sizeof(sa_family_t) -
				       sizeof(unsigned short) -
				       sizeof(unsigned int) -
				       sizeof(unsigned int)];
	   };

       svm_family is always set to AF_VSOCK.  svm_reserved1 is always set to 0.	 svm_port contains the port number in
       host byte order.	 The port numbers  below  1024	are  called  privileged	 ports.	  Only	a  process  with  the
       CAP_NET_BIND_SERVICE capability may bind(2) to these port numbers.  svm_zero must be zero-filled.

       There are several special addresses: VMADDR_CID_ANY (-1U) means any address for binding; VMADDR_CID_HYPERVISOR
       (0) is reserved for services built into the hypervisor; VMADDR_CID_LOCAL (1) is the well-known address for lo‐
       cal communication (loopback); VMADDR_CID_HOST (2) is the well-known address of the host.

       The special constant VMADDR_PORT_ANY (-1U) means any port number for binding.

   Live migration
       Sockets are affected by live migration of virtual machines.  Connected SOCK_STREAM sockets become disconnected
       when the virtual machine migrates to a new host.	 Applications must reconnect when this happens.

       The local CID may change across live migration if the old CID is not available on the new host.	Bound sockets
       are automatically updated to the new CID.

   Ioctls
       The following ioctls are available on the /dev/vsock device.

       IOCTL_VM_SOCKETS_GET_LOCAL_CID
	      Get the CID of the local machine.	 The argument is a pointer to an unsigned int.

		  ioctl(fd, IOCTL_VM_SOCKETS_GET_LOCAL_CID, &cid);

	      Consider	using  VMADDR_CID_ANY  when  binding  instead  of  getting  the local CID with IOCTL_VM_SOCK‐
	      ETS_GET_LOCAL_CID.

   Local communication
       VMADDR_CID_LOCAL (1) directs packets to the same host that generated them.  This is useful for testing  appli‐
       cations on a single host and for debugging.

       The local CID obtained with IOCTL_VM_SOCKETS_GET_LOCAL_CID can be used for the same purpose, but it is prefer‐
       able to use VMADDR_CID_LOCAL.

ERRORS
       EACCES Unable to bind to a privileged port without the CAP_NET_BIND_SERVICE capability.

       EADDRINUSE
	      Unable to bind to a port that is already in use.

       EADDRNOTAVAIL
	      Unable to find a free port for binding or unable to bind to a nonlocal CID.

       EINVAL Invalid parameters.  This includes: attempting to bind a socket that is already bound, providing an in‐
	      valid struct sockaddr_vm, and other input validation errors.

       ENOPROTOOPT
	      Invalid socket option in setsockopt(2) or getsockopt(2).

       ENOTCONN
	      Unable to perform operation on an unconnected socket.

       EOPNOTSUPP
	      Operation	 not supported.	 This includes: the MSG_OOB flag that is not implemented for the send(2) fam‐
	      ily of syscalls and MSG_PEEK for the recv(2) family of syscalls.

       EPROTONOSUPPORT
	      Invalid socket protocol number.  The protocol should always be 0.

       ESOCKTNOSUPPORT
	      Unsupported socket type in socket(2).  Only SOCK_STREAM and SOCK_DGRAM are valid.

VERSIONS
       Support for VMware (VMCI) has been available since Linux 3.9.  KVM (virtio) is supported since Linux 4.8.  Hy‐
       per-V is supported since Linux 4.14.

       VMADDR_CID_LOCAL is supported since Linux 5.6.  Local communication in the guest and on the host is  available
       since  Linux  5.6.  Previous versions supported only local communication within a guest (not on the host), and
       with only some transports (VMCI and virtio).

SEE ALSO
       bind(2), connect(2), listen(2), recv(2), send(2), socket(2), capabilities(7)

Linux man-pages 6.7				      2024-02-25					     vsock(7)
