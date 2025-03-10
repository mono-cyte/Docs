# xmake Guidance

## Basic

### installation

#### windows

##### powershell

```powershell
Invoke-Expression (Invoke-Webrequest 'https://xmake.io/psget.text' -UseBasicParsing).Content
```

如果要安装特定版本和分支，可以稍后附加版本号和 branch 参数

```powershell
Invoke-Expression (Invoke-Webrequest 'https://xmake.io/psget.text' -UseBasicParsing).Content dev
Invoke-Expression (Invoke-Webrequest 'https://xmake.io/psget.text' -UseBasicParsing).Content v2.7.7
```

命令行安装默认目录在C:user\\<userName>\xmake
初次安装相关信息：

| xmake环境变量        | 概述                                                    | 值                                                            |
| -------------------- | ------------------------------------------------------- | ------------------------------------------------------------- |
| XMAKE_TMPDIR         | Set the temporary directory.                            | `C:\Users\<userName>\AppData\Local\Temp\.xmake\<installTime>` |
| XMAKE_PROGRAM_DIR    | Set the program scripts directory of xmake.             | `C:user\<userName>\xmake`                                     |
| XMAKE_GLOBALDIR      | Set the global config directory of xmake.               | `C:\Users\<userName>\AppData\Local\.xmake`                    |
| XMAKE_RCFILES        | Set the runtime configuration files.                    |                                                               |
| XMAKE_RAMDIR         | Set the ramdisk directory.                              | <empty>                                                       |
| XMAKE_PROFILE        | Start profiler, e.g. perf:call, perf:tag, trace, stuck. | <empty>                                                       |
| XMAKE_PKG_INSTALLDIR | Set the install directory of packages.                  | <empty>                                                       |
| XMAKE_PKG_CACHEDIR   | Set the cache directory of packages.                    | <empty>                                                       |
| XMAKE_ROOT           | Allow xmake to run under root.                          | <empty>                                                       |
| XMAKE_LOGFILE        | Set the log output file path.                           | <empty>                                                       |
| XMAKE_COLORTERM      | Set the color terminal environment.                     | color256                                                      |
| XMAKE_CONFIGDIR      | Set the local config directory of project.              | `C:\Users\<userName>\.xmake\windows\x64`                      |

> [!NOTE]
>
> ``````powershell
> export <env>=<value>
> ``````
>
> 这里指设置一个环境变量env，值为value
>
> `~`在windows的路径通常是`C:\Users\<userName>\AppData\Local`

##### environments

###### XMAKE_RAMDIR

- 设置 ramdisk 目录路径
  ramdisk 目录是内存文件系统的目录位置。通常 `os.tmpdir（）` 接口将使用 xmake 使用的临时文件。如果用户设置了 ramdisk 路径，则会先存储在此位置，以提高整体编译速度。

###### XMAKE_TMPDIR

- 设置用户的临时目录

  默认情况下，xmake 将使用 `/tmp/.xmake` 和 `%TEMP%/.xmake`。当然，用户可以通过这个变量来修改默认路径。

###### XMAKE_CONFIGDIR

- 设置本地项目配置目录
  每个工程的本地编译配置会默认存储在当前工程根目录下的 .xmake 路径下，然后根据不同的平台和架构进行区分，例如：
  `.xmake/macosx/x86_64`

如果我们不想存储在项目的根目录下，也可以自己设置到其他路径，比如 build 目录等。

###### XMAKE_GLOBALDIR

- 设置全局配置文件的根目录

  即 `xmake g/global` 全局配置的存储目录，以及其他全局文件如安装包、缓存等，都会默认存储在该目录下。

默认路径为：`~/.xmake` 或 `C:\Users\<userName>\AppData\Local\.xmake`。

###### XMAKE_ROOT

- 允许用户在 root 模式下运行

通常 xmake 默认禁止在 root 下运行，非常不安全。但是，如果用户必须在 root 下运行，他也可以设置此变量以强制打开它。

```powershell
export XMAKE_ROOT=y
```

###### XMAKE_COLORTERM

- 设置终端的颜色输出
  目前，可以设置以下值：

| Value     | Description  |
| --------- | ------------ |
| nocolor   | 禁用颜色输出 |
| color8    | 8 色输出     |
| color256  | 256 色输出   |
| truecolor | 真彩色输出   |

一般用户不需要设置，Xmake 会自动检测用户终端支持的颜色范围。如果用户不想输出颜色，他们可以设置 nocolor 以全局禁用它们。

或者使用

```powershell
xmake g --theme=plain
```

以在全局禁用它。

###### XMAKE_PKG_INSTALLDIR

- 设置依赖包的安装根目录
  xmake 远程包安装的默认全局目录是 `~/.xmake/packages`，但用户也可以设置此变量来单独修改它。

我们也可以使用 `$ xmake g --pkg_installdir=/xxx` 来设置，效果是一样的。

###### XMAKE_PKG_CACHEDIR

- 设置依赖包的缓存目录

默认路径在 `~/.xmake/cache` 目录下，该目录在包安装过程中存储了各种缓存文件，占用的存储空间比较多，用户也可以单独设置。

当然，Xmake 每个月都会自动清理上个月的所有缓存文件。

###### XMAKE_PROGRAM_DIR

- 设置 Xmake 的脚本目录
  Xmake 的所有 lua 脚本都随安装程序一起安装。默认情况下，它们位于安装目录中。但是，如果希望切换到下载的脚本目录，方便本地修改和调试，可以设置 this 变量。

如果想查看 Xmake 当前使用的脚本目录，可以执行：

```powershell
xmake l os.programdir
```

应当输出xmake的安装目录

###### XMAKE_PROFILE

- 开启性能分析
这只对 Xmake 的开发者开放，用于分析 Xmake 运行的耗时情况，并跟踪调用进程。

它有两种模式，一种是性能分析模式，它显示每个函数的耗时顺序。

```powershell
$ XMAKE_PROFILE=perf xmake
[25%]: cache compiling.release src/main.cpp
[50%]: linking.release test
[100%]: build ok!
 0.238, 97.93%, 1, runloop: @programdir/core/base/scheduler.lua: 805
 0.180, 74.04%, 25, _resume: [C]: -1
 0.015, 6.34%, 50, _co_groups_resume: @programdir/core/base/scheduler.lua: 299
 0.011, 4.37%, 48, wait: @programdir/core/base/poller.lua: 111
 0.004, 1.70%, 62, status: @programdir/core/base/scheduler.lua: 71
 0.004, 1.53%, 38, is_dead: @programdir/core/base/scheduler.lua: 76
 0.003, 1.44%, 50, next: @programdir/core/base/timer.lua: 74
 0.003, 1.33%, 48, delay: @programdir/core/base/timer.lua: 60
 0.002, 1.02%, 24, is_suspended: @programdir/core/base/scheduler.lua: 86
Copy to clipboardErrorCopied
The other is to track the running process of Xmake:
另一种是跟踪 Xmake 的运行过程：

$ XMAKE_PROFILE=trace xmake
func: @programdir/core/base/scheduler.lua: 457
is_suspended: @programdir/core/base/scheduler.lua: 86
status: @programdir/core/base/scheduler.lua: 71
thread: @programdir/core/base/scheduler.lua: 66
thread: @programdir/core/base/scheduler.lua: 66
length: @programdir/core/base/heap.lua: 120
```

###### XMAKE_RCFILES

- 设置全局配置文件

我们可以设置一些 xmakerc.lua 全局配置文件，在用户编译工程时全局引入，比如全局引入一些用户定义的帮助脚本、工具链等。

```powershell
export XMAKE_RCFILES=xmakerc.lua
xmake
```

如果未设置，则默认路径为：`~/.xmake/xmakerc.lua`。

###### XMAKE_LOGFILE

- 设置日志文件路径

默认情况下，Xmake 会将输出回显到终端。我们可以通过设置这个路径来开启对指定文件的自动日志存储，但不会影响终端正常的 echo 输出。

XMAKE_MAIN_REPO
设置官方包主仓库地址
Xmake 默认内置了三个主要仓库地址，它们完全相同，Xmake 会根据当前的网络状态选择最佳地址使用。

<https://github.com/xmake-io/xmake-repo.git>
<https://gitlab.com/tboox/xmake-repo.git>
<https://gitee.com/tboox/xmake-repo.git>

但是，如果 Xmake 选错了，可能会导致仓库下载失败。通过这个环境变量，我们可以自己设置和使用指定的仓库地址，而不是自动选择。

```powershell
export XMAKE_MAIN_REPO=https://github.com/xmake-io/xmake-repo.git
```

XMAKE_BINARY_REPO

- 设置官方二进制程序包仓库地址
  与 XMAKE_MAIN_REPO 类似，唯一的区别是这个是二进制程序的仓库地址。

```powershell
export XMAKE_BINARY_REPO=https://github.com/xmake-mirror/build-artifacts.git
```

###### XMAKE_THEME

- 设置主题
  通常我们可以通过

```powershell
xmake g --theme=plain
```

来设置终端颜色主题，但是它是全局的。

如果我们只想单独设置当前的终端，我们可以使用这个环境变量来设置它。

```powershell
export XMAKE_THEME=plain
```

###### XMAKE_STATS

- 启用或禁用用户统计信息
由于 Xmake 仍处于开发初期，我们需要了解大致的用户增长情况，才能为我们提供持续更新 Xmake 的动力。因此，Xmake 默认每天第一次构建项目，并在后台进程中自动 git clone 一个空仓库：<https://github.com/xmake-io/xmake-stats>

然后借用 github 自己提供的 Traffic 统计图表，得到大概的用户数。

对于每个项目，我们每天只统计一次，并且不会泄露任何用户隐私，因为只有一个额外的 git clone 操作。此外，我们克隆了一个空仓库，不会消耗太多用户流量。当然，并不是每个用户都想这样做，用户有权利禁用这种行为，我们只需要设置：

```powershell
export XMAKE_STATS=false
```

它可以被完全禁用，我们也会自动在 ci 上禁用此行为。

### first project

#### create

##### windows

在<Workspace>目录下创建项目

例：

创建<base>项目(含项目目录), 默认为console程序:

```powershell
PS A:\Workspace> xmake create base
```

应当输出:

```powershell
create base ...
  [+]: src\main.cpp
  [+]: xmake.lua
  [+]: .gitignore
create ok!
```

项目目录内容应为:

```powershell
PS A:\Workspace> cd base
PS A:\Workspace\base> ls

    目录: A:\Workspace\base


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        2024/12/24     12:08                src
-a----        2024/12/19     16:49             64 .gitignore
-a----        2024/12/24     12:08           1962 xmake.lua
```

#### build

在项目目录下执行命令，格式为:

```powershell
xmake [task] [options] [target]
```

`[task]` 默认为: `build`

如果 `[task]` 为`build`, 则 `[options]` 默认为: `--build`

`[target]` 默认为项目目录下`xmake.lua`设置的所有目标

对于单目标项目，可实现相同效果的命令如下:

```powershell
xmake build --build base
xmake b -b base
xmake b -b
xmake b base
xmake b
xmake
```

对于`build`有如下选项：

 --version

-b, --build

-r, --rebuild

 -a, --all

 --shallow

 -g GROUP, --group=GROUP  

--dry-run

 -j JOBS, --jobs=JOBS

--linkjobs=LINKJOBS

-w, --warning  

--linkonly

--files=FILES

#### config

自定义项目配置

```powershell
xmake f|config [option]
```

`-v | --verbose`
用于展示当前项目的全部配置信息，例如：在项目目录下执行`xmake f -v`

`-p [platName] | --plat=[platName]`
设置当前项目构建的目标平台

`--toolchain=[toolchainName]`
设置当前项目构建的工具链，可以在多个环境中使用，包括交叉编译

`--toolchain_host=[toolchain_host]`
设置项目构建所使用的当前主机工具链，只适用于当前主机环境

## Advanced

