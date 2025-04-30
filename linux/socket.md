# Socket(2) - System Calls Manual

socket 译作"套接字", 非常不符合中文的直观性，要取其抽象含义倒不如直接用原词"socket"

## NAME

**socket** - create an endpoint for communication

-   **socket** - 创建一个通信端点(endpoint)

### 说明

-   一般来说, "Endpoint"(端点)是指通信通道的一端，即两个系统进行交互的地方。
-   在网络编程中, Endpoint 通常指代访问服务的地址，可以是 URL、IP 地址或其他形式的网络地址。Endpoint 是客户端和服务器之间进行通信的入口点。
-   在 Web 服务中, Endpoint 通常表示一个 URL，这些 URL 在 API 的文档中被描述，客户端通过这些 URL 访问服务器上的资源。
-   Endpoint 是 API 的具体实现之一，用于访问 API 的特定功能，可以将其视为 API 的子集。

## LIBRARY

Standard C library (libc, -lc)

> [!NOTE]
>
> **标准 C 库**: 这是为 C 程序提供核心功能的基础库, 它包含了用于输入/输出、内存管理、字符串处理和数学计算等基本操作的必要函数, 充当应用程序代码和操作系统之间的接口  
> 标准 C 库是基本库，在大多数系统上，会默认链接它, 编译器会自动完成这个操作。值得注意的是，在不同的操作系统上，实际的实现可能有不同的名称（例如，在 Windows 上是 MSVCRT.dll），但功能保持相似  
> **符号说明**:
>
> -   `"libc"` 是库的实际名称（C 库）
> -   `"-lc"` 是用于链接到此库的链接器标志。
>
> 在这个上下文中，括号只是用来将这些相关术语分组在一起，表明它们指的是同一个事物。  
> **为什么写成“libc”和“-lc”?**
>
> -   `"libc"` 是库文件的常规名称（例如，在类 Unix 系统上是 libc.so 或 libc.a）。
> -   `"-lc"` 是相应的链接器标志：
>
> -   `"-l"`前缀告诉链接器去寻找一个库
> -   `"c"`部分指示它特别寻找 C 标准库
>
> 当你使用“-lc”时, 链接器将寻找名为“libc.so”或“libc.a”的文件  
> 例如，虽然你通常不需要显式地链接 C 标准库（因为编译器会自动完成），如果你需要这样做，你会用: `gcc myprogram.c -lc`  
> 这个命名约定（`-l` + 库名称）在 Unix 类系统上是标准的，其中:
>
> -   名为“libxyz.so”的库将使用“-lxyz”来链接。
> -   链接器会假定“lib”前缀和“.so”后缀。

## SYNOPSIS

```c
#include <sys/socket.h>

int socket(int domain, int type, int protocol);
```

> [!NOTE]
>
> -   **domain**: 通信域|协议族
> -   **type**: 类型
> -   **protocol**: 协议

## DESCRIPTION

`socket()` creates an endpoint for communication and returns a file descriptor that refers to that endpoint. The file descriptor returned by a successful call will be the lowest-numbered file descriptor not currently open for the process.

**socket()** 创建一个用于通信的端点并返回一个文件描述符，该文件描述符引用该端点。成功调用时返回的文件描述符将是当前进程中未打开的最低编号的文件描述符。

### domain

这选择将用于通信的协议族。这些族在 `<sys/socket.h>` 中定义。Linux 内核当前理解的格式包括：

| 名称             | 目的                                                                                                                                                                  | 手册页     |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| **AF_UNIX**      | Local communication 本地通信                                                                                                                                          | unix(7)    |
| **AF_LOCAL**     | IPv4 Internet protocols Synonym for AF_UNIX AF_UNIX 的同义词                                                                                                          |            |
| **AF_INET**      | IPv4 Internet protocols IPv4 Internet 协议                                                                                                                            | ip(7)      |
| **AF_AX25**      | Amateur radio AX.25 protocol 业余无线电 AX.25 协议                                                                                                                    | ax25(4)    |
| **AF_IPX**       | IPX - Novell protocols IPX - Novell 协议                                                                                                                              |            |
| **AF_APPLETALK** | AppleTalk                                                                                                                                                             | ddp(7)     |
| **AF_X25**       | ITU-T X.25 / ISO/IEC 8208 protocol ITU-T X.25 / ISO/IEC 8208 协议                                                                                                     | x25(7)     |
| **AF_INET6**     | IPv6 Internet protocols IPv6 Internet 协议                                                                                                                            | ipv6(7)    |
| **AF_DECnet**    | DECnet protocol sockets DECnet 协议 socket                                                                                                                            |            |
| **AF_KEY**       | Key management protocol, originally developed for usage with IPsec 密钥管理协议，起初为 IPsec 使用开发                                                                |            |
| **AF_NETLINK**   | Kernel user interface device 内核用户界面设备                                                                                                                         | netlink(7) |
| **AF_PACKET**    | Low-level packet interface 低级别数据包接口                                                                                                                           | packet(7)  |
| **AF_RDS**       | Reliable Datagram Sockets (RDS) protocol 可靠数据报 socket (RDS)协议                                                                                                  | rds(7)     |
| **AF_PPPOX**     | Generic PPP transport layer, for setting up L2 tunnels (L2TP and PPPoE) 通用 PPP 传输层，用于设置 L2 隧道（L2TP 和 PPPoE）                                            |            |
| **AF_LLC**       | Logical link control (IEEE 802.2 LLC) protocol 逻辑链接控制（IEEE 802.2 LLC）协议                                                                                     |            |
| **AF_IB**        | InfiniBand native addressing InfiniBand 本机寻址                                                                                                                      |            |
| **AF_MPLS**      | Multiprotocol Label Switching 多协议标签交换                                                                                                                          |            |
| **AF_CAN**       | Controller Area Network automotive bus protocol 控制区域网络汽车总线协议                                                                                              |            |
| **AF_TIPC**      | TIPC, "cluster domain sockets" protocol TIPC，"集群域 socket "协议                                                                                                    |            |
| **AF_BLUETOOTH** | Bluetooth low-level socket protocol Bluetooth 低级别 socket 协议                                                                                                      |            |
| **AF_ALG**       | Interface to kernel crypto API 内核加密 API 接口                                                                                                                      |            |
| **AF_VSOCK**     | VSOCK (Virtual Socket, originally "VMWare VSockets") vsock(7) protocol for hypervisor-guest communication VSOCK（最初为"VMWare VSockets"）协议，用于超级用户-来宾通信 | vsock(7)   |
| **AF_KCM**       | KCM (kernel connection multiplexer) interface KCM（内核连接多路复用器）接口                                                                                           |            |
| **AF_XDP**       | XDP (express data path) interface XDP（快速数据路径）接口                                                                                                             |            |

> [!NOTE]
>
> **address families** (**AF**): 地址族, 指网络协议中的地址类型，比如 IPv4 和 IPv6 等
>
> **PACKET**: (数据)包
>
> **RDM** :"**Reliable Datagram**"，代表可靠的数据报
>
> **PPPOX**: **Point-to-Point Protocol Over X**, 是用来描述通过不同的网络协议（如 Ethernet 或其他）封装点对点协议（PPP）的方式

Further details of the above address families, as well as information on several other address families, can be found in address_families(7).

-   关于地址族更多的 **详细信息** 可以参考 `address_families(7)` 手册页。

### type

The socket has the indicated type, which specifies the communication semantics.

Currently defined types are:

-   **socket** 具有指定的类型，该类型规定了通信的语义。目前定义的类型包括：

    ​ SOCK_STREAM

    ​ Provides sequenced, reliable, two-way, connection-based byte streams. An out-of-band data

    ​ transmission mechanism may be supported.

-   **SOCK_STREAM**: 提供有序、可靠的、双向的、基于连接的字节流。可能支持带外数据传输机制。

    SOCK_DGRAM

    Supports datagrams (connectionless, unreliable messages of a fixed maximum length)

-   **SOCK_DGRAM**: 支持数据报（无连接的、不可靠的固定最大长度的消息）。

    SOCK_SEQPACKET

    Provides a sequenced, reliable, two-way connection-based data transmission path for datagrams
    of fixed maximum length; a consumer is required to read an entire packet with each input system call.

-   **SOCK_SEQPACKET**: 提供有序、可靠的、双向的基于连接的数据传输路径，用于固定最大长度的数据报；每次输入系统调用时消费者需要读取整个数据包。

    SOCK_RAW

    Provides raw network protocol access.

-   **SOCK_RAW**: 提供原始网络协议访问。

    SOCK_RDM

    Provides a reliable datagram layer that does not guarantee ordering.

-   **SOCK_RDM**: 提供不保证顺序的可靠数据报层。

    SOCK_PACKET

    Obsolete and should not be used in new programs; see packet(7).

-   **SOCK_PACKET**: 已经废弃，不应在新程序中使用；参见 `packet(7)`。


    > [!NOTE]
    >
    > **DGRAM** 是 "**Reliable Datagram**" 的缩写，代表数据报文
    >
    > **SEQPACKET** 是一种在传输层的 socket 类型，指代“顺序数据包”（Sequential Packet），通常与 **SCTP**（Stream Control Transmission Protocol：流控制传输协议）配合使用

    Some socket types may not be implemented by all protocol families.

-   某些 socket 类型可能并非所有协议( protocol )都支持。

    Since Linux 2.6.27, the type argument serves a second purpose: in addition to specifying a socket type, it may include the bitwise OR of any of the following values, to modify the behavior of socket():

-   自从 Linux 2.6.27 版本以来，`type` 参数有了第二个用途：除了指定 socket 类型外，它还可以包括以下任一值的**按位或**，以修改 `socket()` 的行为：

    ​ SOCK_NONBLOCK Set the O_NONBLOCK file status flag on the open file description (see open(2)) referred to by
    ​ the new file descriptor. Using this flag saves extra calls to fcntl(2) to achieve the same result.

-   **SOCK_NONBLOCK**: 在新文件描述符引用的打开文件描述上设置 `O_NONBLOCK` 文件状态标志（参见 `open(2)`）。使用此标志可以避免额外的 `fcntl(2)` 调用以达到相同的结果。

    SOCK_CLOEXEC Set the close-on-exec (FD_CLOEXEC) flag on the new file descriptor. See the description of the O_CLOEXEC flag in open(2) for reasons why this may be useful.

-   **SOCK_CLOEXEC**: 在新文件描述符上设置关闭-执行（FD_CLOEXEC）标志。参见 `open(2)` 中对 `O_CLOEXEC` 标志的描述，了解为什么这可能有用。


    > [!NOTE]
    >
    > -   Bitwise OR（按位或）是一种位运算，对其中两个二进制数的对应位进行比较
    >
    >     如果其中一个位为 1，结果的该位就为 1，否则为 0。
    >
    >     以下是其工作原理：
    >
    >   -   `1 OR 0 = 1`
    >
    >   -   `0 OR 1 = 1`
    >
    >   -   `1 OR 1 = 1`
    >
    >   -   `0 OR 0 = 0`
    >
    >         例如:
    >
    >         A: 10101100
    >         B: 11010010
    >
    > ***
    >
    > ​ A | B: 11111110
    >
    > ***
    >
    > -   **SOCK_NONBLOCK**: 这个标志的全称是 "Socket Non-Blocking"。设置这个标志后, socket 将以非阻塞模式工作。这意味着如果一个操作（如读或写）不能立即完成，调用不会阻塞，而是立即返回一个错误（通常是 `EAGAIN` 或 `EWOULDBLOCK`）
    >
    > -   **SOCK_CLOEXEC**: 这个标志的全称是 "Socket Close on Exec"。当设置这个标志时， socket 会在执行 `exec` 函数族（如 `execve`）时自动关闭。这有助于防止文件描述符泄漏到子进程中，提高了安全性和资源管理的效率

### protocol

The **protocol** specifies a particular protocol to be used with the socket. Normally only a single protocol exists to support a particular socket type within a given protocol family, in which case protocol can be specified as 0. However, it is possible that many protocols may exist, in which case a particular protocol must be specified in this manner. The protocol number to use is specific to the “communication domain” in which communication is to take place; see protocols(5). See getprotoent(3) on how to map protocol name strings to protocol numbers.

-   **protocol** 指定与 socket 一起使用的特定协议。**通常在一个给定的协议族内只存在一种协议来支持特定的 socket 类型，在这种情况下 `protocol` 可以指定为 0 (相当于默认参数)**。然而，可能会存在多种协议，在这种情况下必须以这种方式指定特定的协议。使用的协议编号是特定于通信将发生的“通信域”的；参见 `protocols(5)`。有关如何将协议名称字符串映射到协议编号的信息，请参见 `getprotoent(3)`。

    Sockets of type SOCK_STREAM are full-duplex byte streams. They do not preserve record boundaries. A stream socket must be in a connected state before any data may be sent or received on it. A connection to another socket is created with a connect(2) call. Once connected, data may be transferred using read(2) and write(2) calls or some variant of the send(2) and recv(2) calls. When a session has been completed a close(2) may be performed. Out-of-band data may also be transmitted as described in send(2) and received as described in recv(2).

-   类型为 **SOCK_STREAM** 的 socket 是全双工字节流。它们不保留记录边界。流 socket 必须处于连接状态之前才能在其上发送或接收任何数据。通过 `connect(2)` 调用创建到另一个 socket 的连接。连接后，可以使用 `read(2)` 和 `write(2)` 调用或 `send(2)` 和 `recv(2)` 调用的某些变体传输数据。完成会话后，可以执行 `close(2)`。带外数据也可以如 `send(2)` 中所述发送，并如 `recv(2)` 中所述接收。

    > [!NOTE]
    >
    > 全双工通信: 在 TCP 连接的两端，数据可以同时双向传输，即客户端和服务器都能在同一时间内发送和接收数据，而不会相互干扰。

    The communications protocols which implement a SOCK_STREAM ensure that data is not lost or duplicated. If a piece of data for which the peer protocol has buffer space cannot be successfully transmitted within a reasonable length of time, then the connection is considered to be dead. When SO_KEEPALIVE is enabled on the socket the protocol checks in a protocol-specific manner if the other end is still alive. A SIGPIPE signal is raised if a process sends or receives on a broken stream; this causes naive processes, which do not handle the signal, to exit. SOCK_SEQPACKET sockets employ the same system calls as SOCK_STREAM sockets. The only difference is that read(2) calls will return only the amount of data requested, and any data remaining in the arriving packet will be discarded. Also all message boundaries in incoming datagrams are preserved.

-   实现 **SOCK_STREAM** 的通信协议确保数据不会丢失或重复。实现 `SOCK_STREAM` 的通信协议确保数据不会丢失或重复。如果一份数据在对端协议有足够的缓冲空间的情况下，在合理的时间长度内不能成功传输，那么这个连接将被认为是断开的。如果一个进程在已断开的流上进行发送或接收操作，则会触发 `SIGPIPE` 信号；这会导致那些不处理该信号的简单进程退出。**SOCK_SEQPACKET** socket 使用与 **SOCK_STREAM** socket 相同的系统调用，唯一的区别在于 `read(2)` 调用只会返回请求的数据量，任何在到达的数据包中剩余的数据将被丢弃。同时，保留所有进入数据报中的消息边界。

    SOCK_DGRAM and SOCK_RAW sockets allow sending of datagrams to correspondents named in sendto(2) calls. Datagrams are generally received with recvfrom(2), which returns the next datagram along with the address of its sender.

-   **SOCK_DGRAM** 和 **SOCK_RAW** socket 允许向在 `sendto(2)` 调用中命名的对应方发送数据报。数据报通常通过 `recvfrom(2)` 接收，它返回下一个数据报以及发送者的地址。

    SOCK_PACKET is an obsolete socket type to receive raw packets directly from the device driver. Use packet(7) instead.

-   **SOCK_PACKET** 是接收设备驱动程序直接发送的原始数据包的过时 socket 类型。请使用 `packet(7)` 替代。

    An fcntl(2) F_SETOWN operation can be used to specify a process or process group to receive a SIGURG signal when the out-of-band data arrives or SIGPIPE signal when a SOCK_STREAM connection breaks unexpectedly. This operation may also be used to set the process or process group that receives the I/O and asynchronous notification of I/O events via SIGIO. Using F_SETOWN is equivalent to an ioctl(2) call with the FIOSETOWN or SIOCSPGRP argument.

-   **fcntl(2)** 调用的 `F_SETOWN` 操作可以用来指定一个进程或进程组，以便在出带数据到达时接收 `SIGURG` 信号，或者在 `SOCK_STREAM` 连接意外中断时接收 `SIGPIPE` 信号。这个操作也可用于设置接收 I/O 事件的 I/O 异步通知（通过 `SIGIO` 信号）的进程或进程组。

    使用 `F_SETOWN` 等同于调用 `ioctl(2)`并对其使用 `FIOSETOWN` 或 `SIOCSPGRP` 参数 。

    When the network signals an error condition to the protocol module (e.g., using an ICMP message for IP) the pending error flag is set for the socket. The next operation on this socket will return the error code of the pending error. For some protocols it is possible to enable a per-socket error queue to retrieve detailed information about the error; see IP_RECVERR in ip(7).

-   当网络通过某种方式（如通过 IP 的 ICMP 消息）向协议模块通知一个错误条件时， socket 的待处理错误标志就会被设置。该 socket 的下一个操作将返回待处理错误的错误代码。对于某些协议来说，可以启用每个 socket 的错误队列，以获取有关错误的详细信息；具体请参见 `ip(7)` 中的 `IP_RECVERR`。

    The operation of sockets is controlled by socket level options. These options are defined in <sys/socket.h>. The functions setsockopt(2) and getsockopt(2) are used to set and get options.

-   socket 的操作由 socket 级别的选项控制。这些选项在 `<sys/socket.h>` 中定义。`setsockopt(2)` 和 `getsockopt(2)` 函数用于设置和获取选项。

## RETURN VALUE

On success, a file descriptor for the new socket is returned. On error, -1 is returned, and errno is set to indicate the error.

成功时，返回一个新的 socket 的文件描述符。出错时，返回 -1，并设置 `errno` 以指示错误。

## ERRORS

​ EACCES Permission to create a socket of the specified type and/or protocol is denied.

-   **EACCES**: 拒绝创建指定类型和/或协议的 socket 的权限。

    EAFNOSUPPORT The implementation does not support the specified address family.

-   **EAFNOSUPPORT**: 不支持指定的地址族。

    EINVAL Unknown protocol, or protocol family not available.

-   **EINVAL**: 未知协议或协议族不可用。

    EINVAL Invalid flags in type.

-   **EINVAL**: `type` 中的无效标志。

    EMFILE The per-process limit on the number of open file descriptors has been reached.

-   **EMFILE**: 进程中打开的文件描述符数量已达到限制。

    ENFILE The system-wide limit on the total number of open files has been reached.

-   **ENFILE**: 系统中总的打开文件数量已达到限制。

    ENOBUFS or ENOMEM Insufficient memory is available. The socket cannot be created until sufficient resources are freed.

-   **ENOBUFS** or **ENOMEM**: 可用内存不足。直到释放足够的资源之前，无法创建 socket 。

    EPROTONOSUPPORT The protocol type or the specified protocol is not supported within this domain.

-   **EPROTONOSUPPORT**: 在此域内不支持指定的协议类型或协议。

    Other errors may be generated by the underlying protocol modules.

-   其他错误可能由底层的协议模块生成。

## STANDARDS

POSIX.1-2008。

SOCK_NONBLOCK and SOCK_CLOEXEC are Linux-specific.

**SOCK_NONBLOCK** 和 **SOCK_CLOEXEC** 是 Linux 特有的。

## HISTORY

POSIX.1-2001, 4.4BSD。

socket() appeared in 4.2BSD.It is generally portable to/from non-BSD systems supporting clones of the BSD socket layer (including System V variants).

**socket()** 在 4.2BSD 中出现。它通常可以移植到/从支持 BSD socket 层克隆的非 BSD 系统（包括 System V 变体）。

The manifest constants used under 4.x BSD for protocol families are PF*UNIX, PF_INET, and so on, while AF_UNIX, AF_INET, and so on are used for address families. However, already the BSD man page promises: "The protocol family generally is the same as the address family", and subsequent standards use AF*\* everywhere.

4.x BSD 下用于协议族的表现常量是 PF*UNIX、PF_INET 等，而 AF_UNIX、AF_INET 等用于地址家族。然而，BSD 手册页已经承诺：“协议族通常与地址家族相同”，后续的标准在所有地方都使用 AF*\*。

> [!NOTE]
>
> -   **BSD (Berkeley Software Distribution)**：这是由加州大学伯克利分校开发的一系列 Unix 变种。BSD 以其网络能力、安全性和开源许可证而闻名。
> -   **System V**：这是由 AT&T 开发的另一个 Unix 变种系列。System V 与 BSD 在许多方面都有所不同，包括内核架构、系统调用、库和工具等。System V 推出了许多重要的特性，如共享内存、信号量等。

## EXAMPLES

An example of the use of socket() is shown in getaddrinfo(3).

有关**socket()** 的用法示例，请参见 `getaddrinfo(3)`。

## SEE ALSO

`accept(2)`, `bind(2)`, `close(2)`, `connect(2)`, `fcntl(2)`, `getpeername(2)`, `getsockname(2)`, `getsockopt(2)`, `ioctl(2)`, `listen(2)`, `read(2)`, `recv(2)`, `select(2)`, `send(2)`, `shutdown(2)`, `socketpair(2)`, `write(2)`, `getprotoent(3)`, `address_families(7)`, `ip(7)`, `socket(7)`, `tcp(7)`, `udp(7)`, `unix(7)`

​ “An Introductory 4.3BSD Interprocess Communication Tutorial” and “BSD Interprocess Communication Tutorial”, reprinted in UNIX Programmer's Supplementary Documents Volume 1.

-   “An Introductory 4.3BSD Interprocess Communication Tutorial” 和 “BSD Interprocess Communication Tutorial”，重印在 UNIX Programmer's Supplementary Documents Volume 1。

---

**Linux man-pages 6.7**  
**2024-01-28**  
**socket(2)**
