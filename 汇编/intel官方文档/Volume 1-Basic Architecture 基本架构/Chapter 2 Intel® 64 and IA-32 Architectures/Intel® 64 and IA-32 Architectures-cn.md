# Intel® 64 和 IA-32 架构

## Intel® 64 和 IA-32 架构的简要历史

以下部分总结了从 IA-32 到 Intel 64 架构的主要技术演进：从 Intel 8086 处理器到最新的 Intel® Core® 2 Duo、Core 2 Quad 以及 Intel Xeon 5300 和 7300 系列处理器。早在 1978 年发布的处理器所创建的目标代码仍然可以在 Intel 64 和 IA-32 架构家族的最新处理器上执行。

### 16 位处理器和分段（1978 年）

IA-32 架构家族之前是 16 位处理器，8086 和 8088。8086 具有 16 位寄存器和 16 位外部数据总线，20 位寻址提供了 1 MB 的地址空间。8088 与 8086 类似，但其外部数据总线为 8 位。  
8086/8088 引入了分段机制到 IA-32 架构中。通过分段，16 位段寄存器包含指向最多 64 KB 内存段的指针。使用四个段寄存器，8086/8088 处理器能够在不切换段的情况下寻址最多 256 KB。通过段寄存器和额外的 16 位指针形成的 20 位地址提供了总共 1 MB 的地址范围。

### Intel® 286 处理器（1982 年）

Intel 286 处理器将保护模式操作引入 IA-32 架构。保护模式使用段寄存器内容作为选择器或指向描述符表的指针。描述符提供 24 位基地址，支持最多 16 MB 的物理内存，支持基于段交换的虚拟内存管理，并提供多种保护机制。这些机制包括：

- 段限制检查。
- 只读和仅执行段选项。
- 四个特权级别。

### Intel386™ 处理器（1985 年）

Intel386 处理器是 IA-32 架构家族中的第一款 32 位处理器。它引入了 32 位寄存器，用于操作数和寻址。每个 32 位 Intel386 寄存器的下半部分保留了早期 16 位寄存器的特性，确保了向后兼容性。该处理器还提供了虚拟 8086 模式，可以更高效地执行为 8086/8088 处理器创建的程序。  
此外，Intel386 处理器还支持：

- 32 位地址总线，支持最多 4 GB 的物理内存。
- 分段内存模型和平坦内存模型。
- 分页机制，固定 4 KB 页面大小，提供虚拟内存管理方法。
- 支持并行阶段。

### Intel486™ 处理器（1989 年）

Intel486™ 处理器通过将 Intel386 处理器的指令解码和执行单元扩展为五个流水线阶段，增加了更多的并行执行能力。每个阶段与其他阶段并行操作，最多可以同时处理五条处于不同执行阶段的指令。  
此外，该处理器还增加了：

- 8 KB 的片上第一级缓存，提高了可以以每时钟周期一条指令的标量速率执行的指令百分比。
- 集成的 x87 浮点单元（FPU）。
- 节能和系统管理功能。

### Intel® Pentium® 处理器（1993 年）

Intel Pentium 处理器的引入增加了第二个执行流水线，以实现超标量性能（两个流水线，称为 u 和 v，可以每时钟周期执行两条指令）。片上第一级缓存翻倍，8 KB 用于代码，另外 8 KB 用于数据。数据缓存使用 MESI 协议，支持更高效的写回缓存，而不仅仅是 Intel486 处理器之前使用的写透缓存。增加了带有片上分支表的分支预测，以提高循环结构的性能。  
此外，该处理器还增加了：

- 扩展了虚拟 8086 模式，使其更高效，并支持 4 MB 和 4 KB 页面。
- 128 位和 256 位的内部数据路径，加快了内部数据传输速度。
- 外部数据总线增加到 64 位。
- 高级可编程中断控制器（APIC），支持多处理器系统。
- 双处理器模式，支持无胶合的双处理器系统。

Pentium 家族的后续步进引入了 Intel MMX 技术（带有 MMX 技术的 Pentium 处理器）。Intel MMX 技术使用单指令多数据（SIMD）执行模型，对包含在 64 位寄存器中的打包整数数据执行并行计算。  
参见第 2.2.7 节“SIMD 指令”。

### P6 处理器家族（1995—1999 年）

P6 处理器家族基于超标量微架构，设定了新的性能标准；参见第 2.2.1 节“P6 家族微架构”。P6 家族微架构的设计目标之一是在使用相同的 0.6 微米、四层金属 BICMOS 制造工艺的情况下，显著超越 Pentium 处理器的性能。该家族的成员包括：

- Intel Pentium Pro 处理器是三路超标量的。通过并行处理技术，该处理器平均每时钟周期可以解码、分派并完成执行（退休）三条指令。Pentium Pro 引入了动态执行（微数据流分析、乱序执行、高级分支预测和推测执行）的超标量实现。该处理器通过其缓存进一步增强。它具有与 Pentium 处理器相同的两个 8 KB 片上第一级缓存，并且在同一个封装中还有一个 256 KB 的第二级缓存。
- Intel Pentium II 处理器将 Intel MMX 技术引入 P6 家族处理器，并采用了新的封装和多项硬件增强。处理器核心封装在单边接触盒（SECC）中。第一级数据和指令缓存分别扩大到 16 KB，支持 256 KB、512 KB 和 1 MB 的第二级缓存。半频后端总线将第二级缓存连接到处理器。支持多种低功耗状态，如 AutoHALT、Stop-Grant、Sleep 和 Deep Sleep，以在空闲时节省功耗。
- Pentium II Xeon 处理器结合了前几代 Intel 处理器的优质特性。包括：4 路、8 路（及以上）可扩展性，以及在全频后端总线上运行的 2 MB 第二级缓存。
- Intel Celeron 处理器家族专注于价值 PC 市场。其推出提供了集成的 128 KB 第二级缓存和塑料引脚网格阵列（P.P.G.A.）封装，以降低系统设计成本。
- Intel Pentium III 处理器将流式 SIMD 扩展（SSE）引入 IA-32 架构。SSE 扩展通过提供一组新的 128 位寄存器和在打包单精度浮点值上执行 SIMD 操作的能力，扩展了 Intel MMX 技术引入的 SIMD 执行模型。参见第 2.2.7 节“SIMD 指令”。
- Pentium III Xeon 处理器通过增强全速、片上高级传输缓存，扩展了 IA-32 处理器的性能水平。

### Intel® Pentium® 4 处理器家族（2000—2006 年）

Intel Pentium 4 处理器家族基于 Intel NetBurst 微架构；参见第 2.2.2 节“Intel NetBurst® 微架构”。  
Intel Pentium 4 处理器引入了流式 SIMD 扩展 2（SSE2）；参见第 2.2.7 节“SIMD 指令”。支持超线程技术的 Intel Pentium 4 处理器 3.40 GHz 引入了流式 SIMD 扩展 3（SSE3）；参见第 2.2.7 节“SIMD 指令”。  
Intel 64 架构在支持超线程技术的 Intel Pentium 4 处理器至尊版以及 Intel Pentium 4 处理器 6xx 和 5xx 系列中引入。  
Intel® 虚拟化技术（Intel® VT）在 Intel Pentium 4 处理器 672 和 662 中引入。

### Intel® Xeon® 处理器（2001—2007 年）

Intel Xeon 处理器（双核 Intel Xeon 处理器 LV、Intel Xeon 处理器 5100 系列除外）基于 Intel NetBurst 微架构；参见第 2.2.2 节“Intel NetBurst® 微架构”。作为家族，这组 IA-32 处理器（最近是 Intel 64 处理器）专为多处理器服务器系统和高性能工作站设计。  
Intel Xeon 处理器 MP 引入了对 Intel® 超线程技术的支持；参见第 2.2.8 节“Intel® 超线程技术”。  
64 位 Intel Xeon 处理器 3.60 GHz（带有 800 MHz 系统总线）用于引入 Intel 64 架构。双核 Intel Xeon 处理器包括双核技术。Intel Xeon 处理器 70xx 系列包括 Intel 虚拟化技术。  
Intel Xeon 处理器 5100 系列引入了高能效、高性能的 Intel Core 微架构。该处理器基于 Intel 64 架构；它包括 Intel 虚拟化技术和双核技术。Intel Xeon 处理器 3000 系列也基于 Intel Core 微架构。Intel Xeon 处理器 5300 系列在一个物理封装中引入了四个处理器核心，它们也基于 Intel Core 微架构。

### Intel® Pentium® M 处理器（2003—2006 年）

Intel Pentium M 处理器家族是一款高性能、低功耗的移动处理器家族，具有比前几代 IA-32 Intel 移动处理器更多的微架构增强。该家族旨在延长电池寿命，并与平台创新无缝集成，以实现新的使用模式（如扩展移动性、超薄外形和集成无线网络）。  
其增强的微架构包括：

- 支持具有动态执行的 Intel 架构。
- 采用 Intel 先进工艺技术制造的高性能、低功耗核心，带有铜互连。
- 片上 32 KB 主指令缓存和 32 KB 写回数据缓存。
- 片上第二级缓存（最多 2 MB），具有高级传输缓存架构。
- 高级分支预测和数据预取逻辑。
- 支持 MMX 技术、流式 SIMD 指令和 SSE2 指令集。
- 400 或 533 MHz 源同步处理器系统总线。
- 使用增强型 Intel SpeedStep® 技术的高级电源管理。

### Intel® Pentium® 处理器至尊版（2005 年）

Intel Pentium 处理器至尊版引入了双核技术。该技术提供了先进的硬件多线程支持。该处理器基于 Intel NetBurst 微架构，支持 Intel SSE、SSE2、SSE3、Intel 超线程技术和 Intel 64 架构。  
参见：

- 第 2.2.2 节“Intel NetBurst® 微架构”。
- 第 2.2.3 节“Intel® Core™ 微架构”。
- 第 2.2.7 节“SIMD 指令”。
- 第 2.2.8 节“Intel® 超线程技术”。
- 第 2.2.9 节“多核技术”。
- 第 2.2.10 节“Intel® 64 架构”。

### Intel® Core™ Duo 和 Intel® Core™ Solo 处理器（2006—2007 年）

Intel Core Duo 处理器提供了高能效的双核性能，其低功耗设计延长了电池寿命。该家族和单核 Intel Core Solo 处理器提供了比 Pentium M 处理器家族更多的微架构增强。  
其增强的微架构包括：

- Intel® 智能缓存，允许两个处理器核心之间高效共享数据。
- 改进的解码和 SIMD 执行。
- Intel® 动态电源协调和增强型 Intel® 深度睡眠，以降低功耗。
- Intel® 高级热管理器，具有数字热传感器接口。
- 支持功率优化的 667 MHz 总线。

双核 Intel Xeon 处理器 LV 基于与 Intel Core Duo 处理器相同的微架构，并支持 IA-32 架构。

### Intel® Xeon® 处理器 5100、5300 系列和 Intel® Core™ 2 处理器家族（2006 年）

Intel Xeon 处理器 3000、3200、5100、5300 和 7300 系列，Intel Pentium Dual-Core、Intel Core 2 Extreme、Intel Core 2 Quad 处理器以及 Intel Core 2 Duo 处理器家族支持 Intel 64 架构；它们基于采用 65 纳米工艺技术的高性能、高能效 Intel® Core 微架构。  
Intel Core 微架构包括以下创新特性：

- Intel® 宽动态执行，以提高性能和执行吞吐量。
- Intel® 智能电源功能，以降低功耗。
- Intel® 高级智能缓存，允许两个处理器核心之间高效共享数据。
- Intel® 智能内存访问，以增加数据带宽并隐藏内存访问延迟。
- Intel® 高级数字媒体增强，通过多代流式 SIMD 扩展提高应用程序性能。

Intel Xeon 处理器 5300 系列、Intel Core 2 Extreme 处理器 QX6800 系列和 Intel Core 2 Quad 处理器支持 Intel 四核技术。

### Intel® Xeon® 处理器 5200、5400、7400 系列和 Intel® Core™ 2 处理器家族（2007 年）

Intel Xeon 处理器 5200、5400 和 7400 系列，Intel Core 2 Quad 处理器 Q9000 系列，Intel Core 2 Duo 处理器 E8000 系列支持 Intel 64 架构；它们基于采用 45 纳米工艺技术的增强型 Intel® Core 微架构。增强型 Intel Core 微架构提供了以下改进特性：

- 基数 16 除法器，更快的操作系统原语进一步提高了 Intel® 宽动态执行的性能。
- 改进的 Intel® 高级智能缓存，第二级缓存最多增加 50%，路组关联性最多增加 50%。
- 128 位混洗引擎显著提高了 Intel® 高级数字媒体增强和 SSE4 的性能。

Intel Xeon 处理器 5400 系列和 Intel Core 2 Quad 处理器 Q9000 系列支持 Intel 四核技术。Intel Xeon 处理器 7400 系列提供最多六个处理器核心和最多 16 MB 的 L3 缓存。

### Intel Atom® 处理器家族（2008 年）

第一代 Intel Atom® 处理器采用 45 纳米工艺技术制造。  
它们基于新的微架构，Intel Atom® 微架构，专为超低功耗设备优化。Intel Atom® 微架构具有两个按序执行流水线，最大限度地降低了功耗，延长了电池寿命，并支持超小外形。最初的 Intel Atom 处理器家族及后续世代，包括 Intel Atom 处理器 D2000、N2000、E2000、Z2000、C1000 系列，提供了以下特性：

- 增强型 Intel® SpeedStep® 技术。
- Intel® 超线程技术。
- 深度节能技术，具有动态缓存大小调整。
- 支持指令集扩展，包括补充流式 SIMD 扩展 3（SSSE3）。
- 支持 Intel® 虚拟化技术。
- 支持 Intel® 64 架构（不包括 Intel Atom 处理器 Z5xx 系列）。

### 基于 Silvermont 微架构的 Intel Atom® 处理器家族（2013 年）

Intel Atom 处理器 C2xxx、E3xxx、S1xxx 系列基于 Silvermont 微架构。  
基于 Silvermont 微架构的处理器支持指令集扩展，包括 SSE4.2、AESNI 和 PCLMULQDQ。

### Intel® Core™ i7 处理器家族（2008 年）

Intel Core i7 处理器 900 系列支持 Intel 64 架构，并基于采用 45 纳米工艺技术的 Nehalem 微架构。  
Intel Core i7 处理器和 Intel Xeon 处理器 5500 系列包括以下特性：

- Intel® 涡轮加速技术将热余量转化为更高的性能。
- Intel® 超线程技术与四核结合，提供四个核心和八个线程。
- 专用电源控制单元，降低活动和空闲功耗。
- 处理器上集成的内存控制器，支持三通道 DDR3 内存。
- 8 MB 包含式 Intel® 智能缓存。
- Intel® QuickPath 互连（QPI），提供与芯片组的点对点链接。
- 支持 SSE4.2 和 SSE4.1 指令集。
- 第二代 Intel 虚拟化技术。

### Intel® Xeon® 处理器 7500 系列（2010 年）

Intel Xeon 处理器 7500 和 6500 系列基于采用 45 纳米工艺技术的 Nehalem 微架构。  
这些处理器支持第 2.1.16 节中描述的相同特性，以及以下特性：

- 每个物理处理器封装最多八个核心。
- 最多 24 MB 包含式 Intel® 智能缓存。
- 提供 Intel® 可扩展内存互连（Intel® SMI）通道，带有 Intel® 7500 可扩展内存缓冲区，连接到系统内存。
- 高级 RAS 支持软件可恢复的机器检查架构。

### 2010 年 Intel® Core™ 处理器家族（2010 年）

2010 年 Intel Core 处理器家族涵盖 Intel Core i7、i5 和 i3 处理器。  
这些处理器基于采用 32 纳米工艺技术的 Westmere 微架构。  
特性包括：

- 使用 Intel 超线程技术和 Intel 涡轮加速技术提供智能性能。
- 增强型 Intel 智能缓存和集成内存控制器。
- 智能电源门控。
- 重新分区的平台，集成了 45 纳米集成显卡。
- 支持指令集范围，包括 AESNI、PCLMULQDQ、SSE4.2 和 SSE4.1。

### Intel® Xeon® 处理器 5600 系列（2010 年）

Intel Xeon 处理器 5600 系列基于采用 32 纳米工艺技术的 Westmere 微架构。  
它们支持第 2.1.16 节中描述的相同特性，以及以下特性：

- 每个物理处理器封装最多六个核心。
- 最多 12 MB 增强型 Intel® 智能缓存。
- 支持 AESNI、PCLMULQDQ、SSE4.2 和 SSE4.1 指令集。
- 跨处理器和 I/O 的灵活 Intel 虚拟化技术。

### 第二代 Intel® Core™ 处理器系列（2011年）

第二代 Intel Core 处理器系列包括基于 Sandy Bridge 微架构的 Intel Core i7、i5 和 i3 处理器。这些处理器采用 32 纳米工艺技术，并具备以下特点：

- Intel Turbo Boost 技术，适用于 Intel Core i5 和 i7 处理器。
- Intel 超线程技术。
- 增强版 Intel 智能缓存和集成内存控制器。
- 处理器图形和内置视觉功能，如 Intel® Quick Sync Video、Intel® Insider™ 等。
- 支持的指令集范围，涵盖 AVX、AESNI、PCLMULQDQ、SSE4.2 和 SSE4.1 等。

Intel Xeon E3-1200 产品系列也基于 Sandy Bridge 微架构。  
Intel Xeon E5-2400/1400 产品系列基于 Sandy Bridge-EP 微架构。  
Intel Xeon E5-4600/2600/1600 产品系列基于 Sandy Bridge-EP 微架构，并支持多个插槽。

### 第三代 Intel® Core™ 处理器系列（2012年）

第三代 Intel Core 处理器系列包括基于 Ivy Bridge 微架构的 Intel Core i7、i5 和 i3 处理器。  
Intel Xeon E7-8800/4800/2800 v2 产品系列和 Intel Xeon E3-1200 v2 产品系列也基于 Ivy Bridge 微架构。  
Intel Xeon E5-2400/1400 v2 产品系列基于 Ivy Bridge-EP 微架构。  
Intel Xeon E5-4600/2600/1600 v2 产品系列基于 Ivy Bridge-EP 微架构，并支持多个插槽。

### 第四代 Intel® Core™ 处理器系列（2013年）

第四代 Intel Core 处理器系列包括基于 Haswell 微架构的 Intel Core i7、i5 和 i3 处理器。  
Intel Xeon E3-1200 v3 产品系列也基于 Haswell 微架构。