# PPPOX协议

## 概述

**PPPOX**（Point-to-Point Protocol Over Ethernet Extension）是Linux内核中对PPP（点对点协议）的一种扩展，主要用于在以太网（Ethernet）上运行PPP协议。它允许PPP会话在以太网上封装和传输，从而实现点对点连接的建立和管理。

## 特点

- **封装PPP**：将PPP数据帧封装在以太网帧中传输。
- **多种PPPoX协议**：包括PPPoE（Point-to-Point Protocol over Ethernet）、PPPoATM（Point-to-Point Protocol over ATM）等。
- **用户空间与内核空间交互**：提供了用户空间程序与内核PPP驱动之间的接口。
- **动态接口管理**：可以动态创建和管理PPP接口。
- **认证和加密**：支持PPP的各种认证（如PAP, CHAP）和加密机制。
- **多连接支持**：一个网络接口可以支持多个PPPoX会话。

## PPPOX的结构

### 协议栈

1. **PPPoE**
   - **以太网层**：处理以太网帧的发送和接收。
   - **PPPoE层**：处理PPPoE特定的封装、会话管理和控制协议（如Discovery阶段和Session阶段）。
   - **PPP层**：处理PPP协议的数据封装、LCP（链路控制协议）、NCP（网络控制协议）等。

### 内核接口

- **pppox_proto**：PPPoX协议的注册结构，用于注册新的PPPoX协议。
- **pppox_create**：在内核中创建PPPoX套接字。
- **pppox_ioctl**：处理PPPoX相关的ioctl命令。
- **pppox_sendmsg** / **pppox_recvmsg**：发送和接收PPPoX数据包。

### 用户空间接口

- **socket(AF_PPPOX, ...)**：创建一个PPPoX套接字。
- **connect()**：建立PPPoX会话。
- **ioctl()**：用于配置和管理PPPoX连接。

### 数据结构

- **struct pppox_sock**：PPPoX套接字结构。
- **struct pppoe_hdr**：PPPoE头结构。
- **struct pppoe_tag**：PPPoE标签结构，用于在Discovery阶段传递信息。

## 使用场景

- **DSL宽带连接**：许多DSL服务提供商使用PPPoE来建立用户与ISP之间的连接。
- **VPN和安全连接**：可以使用PPPoX来创建安全的点对点连接。
- **网络隔离**：通过PPPoX在同一物理网络上创建逻辑隔离的网络。
- **移动网络**：在某些移动网络中使用PPPoATM来提供宽带服务。

## 注意事项

- **权限**：通常需要root权限或CAP_NET_ADMIN能力来操作PPPoX套接字。
- **认证**：PPPoE连接通常需要用户名和密码认证。
- **MTU和MSS**：由于PPP和PPPoE的封装，MTU和MSS设置需要特别注意，以避免分片。
- **多会话**：一个以太网接口可以支持多个PPPoE会话，需要小心管理。
- **网络配置**：PPPoX会话建立后，通常会创建一个新的网络接口（如ppp0），需要配置路由和DNS。
- **安全性**：由于PPPoX可以直接访问网络层，确保使用安全的认证机制和加密。

---
