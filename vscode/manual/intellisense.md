# 智能感知

## 利用compile_commands.json规则文件

### Makefile

1. Makefile生成compile_commands.json需要特定程序bear

```bash
sudo apt install bear
````

1. 利用bear生成

```bash
# 使用bear生成compile_commands.json的命令
# 用法: bear <命令> [--output <参数>] [--verbose] -- ...

# 命令
#   intercept   拦截编译命令并生成 compile_commands.json 文件
#   citnames

#   --output <参数>        结果文件的路径 (默认: compile_commands.json)
#   --verbose            以详细模式运行
#   -- ...               要执行的命令

# 高级选项
#   --append             将结果追加到现有的输出文件
#   --config <参数>       配置文件的路径
#   --force-preload      强制使用库预加载
#   --force-wrapper      强制使用编译器包装器

# 开发者选项
#   --bear-path <参数>    bear可执行文件的路径 (默认: /usr/bin/bear)
#   --library <参数>      预加载库的路径 (默认: /usr/$LIB/bear/libexec.so)
#   --wrapper <参数>      包装器可执行文件的路径 (默认: /usr/lib/x86_64-linux-gnu/bear/wrapper)
#   --wrapper-dir <参数>  包装器目录的路径 (默认: /usr/lib/x86_64-linux-gnu/bear/wrapper.d)

# 查询选项
#   --help               打印帮助信息并退出
#   --version            打印版本信息并退出
```

```bash
bear -- <your-build-command>
```

例如：

```bash
bear -- make
```

注意: 如果对应命令未从头执行, 则生成的compile_commands.json文件可能不完整, 例如`make: “...”已是最新。`的情况

推荐命令:

```bash
bear  --output .vscode/compile_commands.json -- make
```

### CMake

```cmake
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```

```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ${DIR}
```

DIR为生成compile_commands.json文件的目录

#### XMake

```bash
xmake project -k compile_commands
```
