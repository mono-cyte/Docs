# 基于lldb的远程debug方案

| 平台        | 功能   |
| ----------- | ------ |
| wsl         | 客户端 |
| windows主机 | 服务端 |

## 服务端

netstat -aon | findstr "1234"

taskkill /T /F /PID <pid>

lldb-server platform --server --listen *:1234

显式指定TCP协议端口

## 客户端

### lldb

```shell



lldb
```

> ```shell
> `(lldb) platform list`  
> ```
>
> 查看可用平台
> Available platforms:  
> host: Local Linux user platform plug-in.  
> remote-linux: Remote Linux user platform plug-in.  
> remote-android: Remote Android user platform plug-in.  
> remote-freebsd: Remote FreeBSD user platform plug-in.  
> remote-gdb-server: A platform that uses the GDB remote protocol as the communication transport.  
> darwin: Darwin platform plug-in.  
> remote-ios: Remote iOS platform plug-in.  
> remote-macosx: Remote Mac OS X user platform plug-in.  
> host: Local Mac OS X user platform plug-in.  
> remote-netbsd: Remote NetBSD user platform plug-in.  
> remote-openbsd: Remote OpenBSD user platform plug-in.  
> qemu-user: Platform for debugging binaries under user mode qemu  
> remote-windows: Remote Windows user platform plug-in.

```shell
(lldb) platform select remote-windows

(lldb) platform connect connect://localhost:1234

(lldb) platform settings -w <path/to/executable>
```

> ```shell
> (lldb) platform status
> ```
>
> 检查debug状态

```shell
(lldb) file xxx.exe

(lldb) log enable lldb process

(lldb) run -o output

```

sudo netstat -tuln | grep :1234