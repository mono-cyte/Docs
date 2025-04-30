# 构建工具集

## 通用

- wrapper
通常指封装脚本/工具，简化复杂命令或集成多工具流程。

示例：clang-cl是Clang对MSVC命令行接口的封装，兼容Visual Studio项目。

- widl
Windows IDL 编译器（Wine 项目工具），生成 COM/DCOM 接口代理存根代码

## gnu工具

- addr2line
将程序地址转换为对应y源代码文件名和行号

程序异常中断时查看系统dmesg信息，系统日志的错误信息如: `trap divide error ip: <address>`

然后根据中断地址查看程序源代码的出错位置

```shell
addr2line -e <executable> <address>
```

- cov(gcov)
生成和分析代码覆盖率报告

- cxxfilt
C++修饰符号工具

`_Z3foov` → `foo()`，便于阅读编译器生成的符号名

- readelf
解析ELF文件（Linux可执行文件/库）的头部、段、符号表等信息

用途：查看节区、重定位条目、动态库依赖等详细信息

- ar
创建、修改和提取静态库（.a 文件）

常用命令：ar rcs libxxx.a *.o 打包目标文件为静态库

关键：处理符号解析、重定位和最终二进制生成。

- nm
列出目标文件或可执行文件中的符号（函数、变量等）

用途：查看符号是否存在、类型（全局/局部）或未定义符号

- objcopy
复制和转换目标文件格式（如 ELF 转二进制），可删除/添加段

- ranlib
为静态库生成索引（符号表），加速链接器查找

> 现代 ar 工具自带 -s 选项可替代 ranlib

- size
统计目标文件或可执行文件各段（代码、数据、BSS）的大小

- strings
提取文件中的可打印字符串（默认长度 ≥4）

- strip
删除目标文件中的调试符号和冗余信息，减小文件体积

- windres
.rc -> .res -> .o/.obj

```shell
windres -v -I include -D DEBUG -F pe-x86-64 -i resource.rc -o resource.res

windres -i resource.res -o resource.o
windres -i resource.rc -o resource.o
windres -i resource.rc -o resource.obj
```

gcc/clang支持Windows resourse 编译特性, 可直接链接对应.o文件

## llvm工具

- lld
llvm项目的链接器(对应gnu的ld)，将多个目标文件（.o）和库链接成可执行文件或共享库

- readobj (llvm-readobj)
通用目标文件分析工具，支持ELF、Mach-O、COFF等格式, 作为readelf的上位替换

- symbolizer (llvm-symbolizer)
将内存地址转换为源代码位置（文件、行号、函数）

场景：分析崩溃日志（如ASAN报告）时定位问题代码

- cov(llvm-cov)
生成和分析代码覆盖率报告

- profdata (llvm-profdata)
处理性能分析数据（如.profraw）

操作：合并、转换或验证数据，供PGO（Profile-Guided Optimization）使用

## windows工具

- rc (Resource Compiler)
.rc -> .res

编译Windows资源脚本为二进制资源文件

```shell
rc [options] *.rc
rc /fo output.res *.rc
```

Windows资源脚本内引用指定路径的资源文件:

```shell
rc /I "\path\to\resource" *.rc
```

.rc文件用于为Windows应用程序添加图标、对话框等资源

示例:

```cpp
// resource.h

#define IDI_ICON1 1
#define IDI_BITMAP1 2
```

```rc
#include "resource.h"

IDI_ICON1 ICON "icon.ico"
```

```cpp
// main.cpp

#include <windows.h>
#include "resource.h"

HICON hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(MYICON));
```

- cvtres
.res -> .obj

将资源文件转换为COFF格式目标文件

```shell
cvtres /verbose /machine:x64 /out:resource.obj resource.res
```

场景：在跨平台开发中，将资源文件整合到LLVM/Clang编译的Windows程序中。

- ml (Microsoft Macro Assembler)
汇编x86/x64汇编代码（.asm）为目标文件

注意：非LLVM工具，但在Windows开发中常与Clang协同使用。

- dlltool
辅助创建 Windows DLL 的导入库（.lib）和导出定义文件（.def）。

场景：跨平台开发时生成 DLL 相关文件

- pdbutil (llvm-pdbutil)
查看和操作PDB（程序数据库）文件。

用途：提取调试信息、分析二进制结构或转换PDB格式
