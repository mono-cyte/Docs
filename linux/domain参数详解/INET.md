# INET（IPv4）

## 概述

**INET**，全称为Internet Protocol version 4（IPv4），是互联网中最早广泛使用的协议版本。IPv4为每个设备提供一个唯一的网络地址，使它们能够通过互联网进行通信。

## 地址格式

IPv4地址由32位二进制数组成，分为四个8位的段，每个段用点分隔，称为点分十进制表示法。例如：192.168.1.1

### 地址类别

IPv4地址被划分为几个类别：

- **A类**：0.0.0.0 到 127.255.255.255
- **B类**：128.0.0.0 到 191.255.255.255
- **C类**：192.0.0.0 到 223.255.255.255
- **D类**：用于多播，地址范围是 224.0.0.0 到 239.255.255.255
- **E类**：保留用于未来或实验性用途，地址范围是 240.0.0.0 到 255.255.255.255

## 地址空间

- **理论地址空间**：IPv4可以提供2^32个地址，即约43亿个。
- **实际可用地址**：由于地址分配的不均匀性、保留地址（如私有地址空间、广播地址等），实际可用的公网地址远少于此。

## 子网划分

为了更有效地利用地址空间，IPv4引入了子网掩码的概念，允许将一个网络划分为多个子网。

## 问题

- **地址短缺**：随着互联网用户和设备的激增，IPv4地址逐渐耗尽。
- **网络地址转换（NAT）**：为了缓解地址短缺，NAT技术被广泛使用，但它引入了复杂性和性能问题。

## 当前状态

尽管IPv6已经开发出来，IPv4仍然是互联网的主要协议，许多网络支持双协议栈，即同时运行IPv4和IPv6。

---

IP(8)							Linux							IP(8)

NAME
       ip - show / manipulate routing, network devices, interfaces and tunnels

SYNOPSIS
       ip [ OPTIONS ] OBJECT { COMMAND | help }

       ip [ -force ] -batch filename

       OBJECT := { link | address | addrlabel | route | rule | neigh | ntable | tunnel | tuntap | maddress | mroute |
	       mrule | monitor | xfrm | netns | l2tp | tcp_metrics | token | macsec | vrf | mptcp | ioam | stats }

       OPTIONS := { -V[ersion] | -h[uman-readable] | -s[tatistics] | -d[etails] | -r[esolve] | -iec | -f[amily] {
	       inet | inet6 | link } | -4 | -6 | -B | -0 | -l[oops] { maximum-addr-flush-attempts } | -o[neline] |
	       -rc[vbuf] [size] | -t[imestamp] | -ts[hort] | -n[etns] name | -N[umeric] | -a[ll] | -c[olor] |
	       -br[ief] | -j[son] | -p[retty] }

OPTIONS
       -V, -Version
	      Print the version of the ip utility and exit.

       -h, -human, -human-readable
	      output statistics with human readable values followed by suffix.

       -b, -batch <FILENAME>
	      Read  commands from provided file or standard input and invoke them.  First failure will cause termina‐
	      tion of ip.

       -force Don't terminate ip on errors in batch mode.  If there were any errors during execution of the commands,
	      the application return code will be non zero.

       -s, -stats, -statistics
	      Output more information. If the option appears twice or more, the amount of information increases.   As
	      a rule, the information is statistics or some time values.

       -d, -details
	      Output more detailed information.

       -l, -loops <COUNT>
	      Specify maximum number of loops the 'ip address flush' logic will attempt before giving up. The default
	      is 10.  Zero (0) means loop until all addresses are removed.

       -f, -family <FAMILY>
	      Specifies the protocol family to use. The protocol family identifier can be one of inet, inet6, bridge,
	      mpls  or	link.  If this option is not present, the protocol family is guessed from other arguments. If
	      the rest of the command line does not give enough information to guess the family, ip falls back to the
	      default one, usually inet or any.	 link is a special family identifier meaning that no networking	 pro‐
	      tocol is involved.

       -4     shortcut for -family inet.

       -6     shortcut for -family inet6.

       -B     shortcut for -family bridge.

       -M     shortcut for -family mpls.

       -0     shortcut for -family link.

       -o, -oneline
	      output  each  record  on a single line, replacing line feeds with the '\' character. This is convenient
	      when you want to count records with wc(1) or to grep(1) the output.

       -r, -resolve
	      use the system's name resolver to print DNS names instead of host addresses.

       -n, -netns <NETNS>
	      switches ip to the specified network namespace NETNS.  Actually it just simplifies executing of:

	      ip netns exec NETNS ip [ OPTIONS ] OBJECT { COMMAND | help }

	      to

	      ip -n[etns] NETNS [ OPTIONS ] OBJECT { COMMAND | help }

       -N, -Numeric
	      Print the number of protocol, scope, dsfield, etc directly instead of converting it to  human  readable
	      name.

       -a, -all
	      executes specified command over all objects, it depends if command supports this option.

       -c[color][={always|auto|never}
	      Configure color output. If parameter is omitted or always, color output is enabled regardless of stdout
	      state.  If parameter is auto, stdout is checked to be a terminal before enabling color output. If para‐
	      meter is never, color output is disabled. If specified multiple times, the last one  takes  precedence.
	      This flag is ignored if -json is also given.

	      Used color palette can be influenced by COLORFGBG environment variable (see ENVIRONMENT).

       -t, -timestamp
	      display current time when using monitor option.

       -ts, -tshort
	      Like -timestamp, but use shorter format.

       -rc, -rcvbuf<SIZE>
	      Set the netlink socket receive buffer size, defaults to 1MB.

       -iec   print human readable rates in IEC units (e.g. 1Ki = 1024).

       -br, -brief
	      Print  only basic information in a tabular format for better readability. This option is currently only
	      supported by ip addr show , ip link show & ip neigh show commands.

       -j, -json
	      Output results in JavaScript Object Notation (JSON).

       -p, -pretty
	      The default JSON format is compact and more efficient to parse but hard for most users to	 read.	 This
	      flag adds indentation for readability.

       -echo  Request the kernel to send the applied configuration back.

IP - COMMAND SYNTAX
   OBJECT
       address
	      - protocol (IP or IPv6) address on a device.

       addrlabel
	      - label configuration for protocol address selection.

       ioam   - manage IOAM namespaces and IOAM schemas.

       l2tp   - tunnel ethernet over IP (L2TPv3).

       link   - network device.

       maddress
	      - multicast address.

       monitor
	      - watch for netlink messages.

       mptcp  - manage MPTCP path manager.

       mroute - multicast routing cache entry.

       mrule  - rule in multicast routing policy database.

       neighbour
	      - manage ARP or NDISC cache entries.

       netns  - manage network namespaces.

       ntable - manage the neighbor cache's operation.

       route  - routing table entry.

       rule   - rule in routing policy database.

       stats  - manage and show interface statistics.

       tcp_metrics/tcpmetrics
	      - manage TCP Metrics

       token  - manage tokenized interface identifiers.

       tunnel - tunnel over IP.

       tuntap - manage TUN/TAP devices.

       vrf    - manage virtual routing and forwarding devices.

       xfrm   - manage IPSec policies.

       The names of all objects may be written in full or abbreviated form, for example address can be abbreviated as
       addr or just a.

   COMMAND
       Specifies  the action to perform on the object.	The set of possible actions depends on the object type.	 As a
       rule, it is possible to add, delete and show (or list ) objects, but some objects do not allow  all  of	these
       operations  or  have  some additional commands. The help command is available for all objects. It prints out a
       list of available commands and argument syntax conventions.

       If no command is given, some default command is assumed.	 Usually it is list or, if the objects of this	class
       cannot be listed, help.

ENVIRONMENT
       COLORFGBG
	      If  set,	it's  value is used for detection whether background is dark or light and use contrast colors
	      for it.

	      COLORFGBG environment variable usually contains either two or three values separated by semicolons;  we
	      want  the	 last  value in either case.  If this value is 0-6 or 8, chose colors suitable for dark back‐
	      ground:

	      COLORFGBG=";0" ip -c a

EXIT STATUS
       Exit status is 0 if command was successful, and 1 if there is a syntax error.  If an error was reported by the
       kernel exit status is 2.

EXAMPLES
       ip addr
	   Shows addresses assigned to all network interfaces.

       ip neigh
	   Shows the current neighbour table in kernel.

       ip link set x up
	   Bring up interface x.

       ip link set x down
	   Bring down interface x.

       ip route
	   Show table routes.

HISTORY
       ip was written by Alexey N. Kuznetsov and added in Linux 2.2.

SEE ALSO
       ip-address(8),  ip-addrlabel(8),	 ip-ioam(8),  ip-l2tp(8),  ip-link(8),	ip-maddress(8),	 ip-monitor(8),	  ip-
       mptcp(8),  ip-mroute(8),	 ip-neighbour(8), ip-netns(8), ip-ntable(8), ip-route(8), ip-rule(8), ip-stats(8) ip-
       tcp_metrics(8), ip-token(8), ip-tunnel(8), ip-vrf(8), ip-xfrm(8)
       IP Command reference ip-cref.ps

REPORTING BUGS
       Report any bugs to the Network Developers mailing list  <netdev@vger.kernel.org>	 where	the  development  and
       maintenance is primarily done.  You do not have to be subscribed to the list to send a message there.

AUTHOR
       Original Manpage by Michail Litvak <mci@owl.openwall.com>

iproute2					     20 Dec 2011						IP(8)
