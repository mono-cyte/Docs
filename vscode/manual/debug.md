# 在 VS Code 中debug

本文档详细说明 `.vscode/launch.json` 和 `.vscode/tasks.json` 的配置方法

## 1. tasks.json 配置详解

### 1.1 完整示例

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "compile cpp",
            "dependsOn": [],
            "type": "shell",
            "command": "clang++",
            "args": [
                "-masm=intel",
                "${file}",
                "-g",
                "-o",
                "${workspaceFolder}/test"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "reveal": "always",
                "panel": "new"
            },
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "Disassemble binary",
            "dependsOn": ["Test binary"],
            "type": "shell",
            "command": "objdump",
            "args": [
                "-S",
                "-M",
                "intel",
                "-d",
                "test",
                ">",
                "${workspaceFolder}/test.s"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            }
        }
    ]
}
```

### 1.2 核心配置参数

#### 1.2.1 基础配置

| 参数        | 说明                            |
| ----------- | ------------------------------- |
| `version`   | 配置文件版本号 (固定为 "2.0.0") |
| `label`     | 任务唯一标识符（自定义命名）    |
| `dependsOn` | 前置任务列表（数组格式）        |

#### 1.2.2 执行配置

```json
"type": "shell",
"command": "clang++",
"args": [
    "-masm=intel",
    "${file}",
    "-g",
    "-o",
    "${workspaceFolder}/test"
]
```

| 参数      | 说明                                                        |
| --------- | ----------------------------------------------------------- |
| `type`    | 任务类型：`shell`（命令行执行） / `process`（直接启动进程） |
| `command` | 主执行命令                                                  |
| `args`    | 命令参数（自动空格分隔）                                    |

#### 1.2.3 环境配置

```json
"options": {
    "cwd": "${workspaceFolder}",
    "env": {
        "NODE_ENV": "development"
    },
    "shell": {
        "executable": "bash",
        "args": ["-l"]
    }
}
```

| 配置项  | 说明                                |
| ------- | ----------------------------------- |
| `cwd`   | 工作目录(Current Working Directory) |
| `env`   | 环境变量键值对                      |
| `shell` | 指定 Shell 类型和参数               |

#### 1.2.4 任务管理

```json
"group": {
    "kind": "build",
    "isDefault": true
},
"presentation": {
    "reveal": "always",
    "panel": "new",
    "focus": true,
    "clear": false
}
```

| 配置项                | 可选值/说明                                          |
| --------------------- | ---------------------------------------------------- |
| `group.kind`          | `build` / `test` / `none`                            |
| `group.isDefault`     | `true` 时可通过 Ctrl+Shift+B 触发                    |
| `presentation.reveal` | `always`（总是显示）/ `never`（隐藏）                |
| `presentation.panel`  | `shared`（共享）/ `dedicated`（专用）/ `new`（新建） |
| `presentation.focus`  | `true`（任务运行时聚焦终端）/ `false`（不聚焦）      |
| `presentation.clear`  | `true`（每次运行任务前清空终端）/ `false`（不清空）  |

### 1.3 预定义 Problem Matchers

VS Code 内置常见工具的报错模式解析器：

- **`$gcc`**

- **用途**：用于解析 GCC 编译器的错误输出。
- **适用工具**：GCC、Clang（因为 Clang 的错误格式与 GCC 相似）。
- **示例输出**：

```shell
main.cpp:5:10: error: expected ';' after return statement
    return 0
         ^
         ;
```

---

- **`$msCompile`**

- **用途**：用于解析 Microsoft C++ 编译器（MSVC）的错误输出。
- **适用工具**：MSVC（Microsoft Visual C++ 编译器）。
- **示例输出**：

```shell
main.cpp(5,10): error C2143: syntax error: missing ';' before '}'
```

---

- **`$tsc`**

- **用途**：用于解析 TypeScript 编译器（`tsc`）的错误输出。
- **适用工具**：TypeScript 编译器。
- **示例输出**：

```shell
main.ts(5,10): error TS1005: ';' expected.
```

---

- **`$eslint-compact`**

- **用途**：用于解析 ESLint 的紧凑格式（compact format）错误输出。
- **适用工具**：ESLint。
- **示例输出**：

```shell
main.js:5:10: error: Missing semicolon (semi)
```

---

- **`$eslint-stylish`**

- **用途**：用于解析 ESLint 的 Stylish 格式错误输出。
- **适用工具**：ESLint。
- **示例输出**：

```shell
main.js
  5:10  error  Missing semicolon  semi
```

---

- **`$jshint`**

- **用途**：用于解析 JSHint 的错误输出。
- **适用工具**：JSHint。
- **示例输出**：

```shell
main.js: line 5, col 10, Missing semicolon.
```

---

- **`$jslint`**

- **用途**：用于解析 JSLint 的错误输出。
- **适用工具**：JSLint。
- **示例输出**：

```shell
main.js:5:10: Expected ';' and instead saw '}'.
```

---

- **`$go`**

- **用途**：用于解析 Go 编译器的错误输出。
- **适用工具**：Go 编译器（`go build`、`go test` 等）。
- **示例输出**：

```shell
main.go:5:10: undefined: x
```

---

- **`$python`**

- **用途**：用于解析 Python 解释器的错误输出。
- **适用工具**：Python 解释器。
- **示例输出**：

```shell
File "main.py", line 5, in <module>
    print(x)
NameError: name 'x' is not defined
```

---

- **`$rustc`**

- **用途**：用于解析 Rust 编译器（`rustc`）的错误输出。
- **适用工具**：Rust 编译器。
- **示例输出**：

```shell
error[E0425]: cannot find value `x` in this scope
  --> main.rs:5:10
   |
5  |     println!("{}", x);
   |                    ^ not found in this scope
```

---

- **`$php`**

- **用途**：用于解析 PHP 解释器的错误输出。
- **适用工具**：PHP 解释器。
- **示例输出**：

```shell
Parse error: syntax error, unexpected '}' in main.php on line 5
```

---

- **`$ruby`**

- **用途**：用于解析 Ruby 解释器的错误输出。
- **适用工具**：Ruby 解释器。
- **示例输出**：

```shell
main.rb:5: syntax error, unexpected '}'
```

---

- **`$lessc`**

- **用途**：用于解析 Less 编译器（`lessc`）的错误输出。
- **适用工具**：Less 编译器。
- **示例输出**：

```shell
main.less:5:10: SyntaxError: Missing closing '}'
```

---

- **`$sass`**

- **用途**：用于解析 Sass 编译器的错误输出。
- **适用工具**：Sass 编译器。
- **示例输出**：

```shell
Error: Invalid CSS after "}": expected "{", was ""
      on line 5 of main.scss
```

---

- **`$tslint`**

- **用途**：用于解析 TSLint 的错误输出。
- **适用工具**：TSLint。
- **示例输出**：

```shell
ERROR: main.ts[5, 10]: Missing semicolon
```

---

- **`$stylelint`**

- **用途**：用于解析 Stylelint 的错误输出。
- **适用工具**：Stylelint。
- **示例输出**：

```shell
main.css:5:10: Unexpected missing semicolon (semi)
```

---

- **`$pylint`**

- **用途**：用于解析 Pylint 的错误输出。
- **适用工具**：Pylint。
- **示例输出**：

```shell
main.py:5:10: E0307: Invalid syntax
```

---

- **`$cppcheck`**

- **用途**：用于解析 Cppcheck 的错误输出。
- **适用工具**：Cppcheck。
- **示例输出**：

```shell
main.cpp:5:10: error: Syntax error
```

---

- **`$swiftc`**

- **用途**：用于解析 Swift 编译器（`swiftc`）的错误输出。
- **适用工具**：Swift 编译器。
- **示例输出**：

```shell
main.swift:5:10: error: use of unresolved identifier 'x'
```

---

- **`$kotlinc`**

- **用途**：用于解析 Kotlin 编译器（`kotlinc`）的错误输出。
- **适用工具**：Kotlin 编译器。
- **示例输出**：

```shell
main.kt:5:10: error: unresolved reference: x
```

完整自定义示例：

```json
"problemMatcher": {
    "owner": "cpp",
    "fileLocation": ["relative", "${workspaceFolder}"],
    "pattern": [
        {
            "regexp": "^([^:]+):(\\d+):(\\d+):\\s+(warning|error):\\s+(.*)$",
            "file": 1,
            "line": 2,
            "column": 3,
            "severity": 4,
            "message": 5
        }
    ]
}
```

## 2. launch.json 配置

### 1. 基本结构

```json
{
    "version": "0.2.0",
    "configurations": [
        { /* 调试配置1 */ },
        { /* 调试配置2 */ }
    ]
}
```

| 属性             | 说明                                   |
| ---------------- | -------------------------------------- |
| `version`        | 固定为 `"0.2.0"`（配置格式版本）       |
| `configurations` | 调试配置数组，每个元素代表一种调试场景 |

---

## 2. 调试配置核心属性

### 基础属性

| 属性      | 类型   | 必需 | 默认值 | 示例                             | 说明                                                         |
| --------- | ------ | ---- | ------ | -------------------------------- | ------------------------------------------------------------ |
| `name`    | string | ✔️    | -      | `"C++ Debug"`                    | 配置名称（显示在调试启动列表中）                             |
| `type`    | string | ✔️    | -      | `"cppdbg"`, `"node"`, `"python"` | 调试器类型                                                   |
| `request` | string | ✔️    | -      | `"launch"`, `"attach"`           | 启动方式：<br>`launch`=启动新进程<br>`attach`=附加到已有进程 |

---

#### 调试目标相关

| 属性      | 类型   | 必需 | 示例                            | 说明                      |
| --------- | ------ | ---- | ------------------------------- | ------------------------- |
| `program` | string | ✔️*   | `"${workspaceFolder}/bin/app"`  | 可执行文件路径（C++必需） |
| `args`    | array  |      | `["--port", "8080"]`            | 命令行参数                |
| `cwd`     | string |      | `"${workspaceFolder}"`          | 工作目录                  |
| `env`     | object |      | `{ "NODE_ENV": "development" }` | 环境变量键值对            |

> *注：部分语言（如 Node.js）可不指定 program

---

#### 调试器设置

| 属性                | 类型    | 适用调试器 | 示例                  | 说明                 |
| ------------------- | ------- | ---------- | --------------------- | -------------------- |
| `stopAtEntry`       | boolean | C++        | `true`                | 是否在程序入口点暂停 |
| `MIMode`            | string  | C++        | `"gdb"`, `"lldb"`     | 指定调试器类型       |
| `miDebuggerPath`    | string  | C++        | `"/usr/bin/gdb"`      | 调试器绝对路径       |
| `runtimeExecutable` | string  | Node.js    | `"node"`, `"ts-node"` | 运行时可执行文件     |

---

#### 路径映射

| 属性            | 类型   | 适用场景        | 示例                                  | 说明                   |
| --------------- | ------ | --------------- | ------------------------------------- | ---------------------- |
| `sourceFileMap` | object | 远程调试/Docker | `{ "/container/path": "/host/path" }` | 映射容器路径到本地路径 |
| `debugServer`   | string | 远程调试        | `"127.0.0.1:1234"`                    | 连接远程调试服务器     |

---

#### 控制台设置

| 属性                     | 类型   | 可选值                                                                       | 说明               |
| ------------------------ | ------ | ---------------------------------------------------------------------------- | ------------------ |
| `console`                | string | `"internalConsole"` (默认)<br>`"integratedTerminal"`<br>`"externalTerminal"` | 控制台类型         |
| `internalConsoleOptions` | string | `"neverOpen"`, `"openOnSessionStart"`                                        | 内部控制台打开策略 |

---

#### 前置/后置任务

```json
{
    "configurations": [
        {
            "preLaunchTask": "compile cpp"
        }
    ]
}
```

| 属性            | 类型   | 关联文件   | 示例              | 说明                 |
| --------------- | ------ | ---------- | ----------------- | -------------------- |
| `preLaunchTask` | string | tasks.json | `"build-project"` | 调试前自动执行的任务 |
| `postDebugTask` | string | tasks.json | `"cleanup"`       | 调试后自动执行的任务 |

##### 任务流程控制

1. 通过 `preLaunchTask` 指定前置任务
2. 前置任务通过 `dependsOn` 实现任务链
3. `postDebugTask` 在调试会话结束后自动执行后置任务
4. 后置任务通过 `dependsOn` 实现任务链
5. 任务执行顺序：前置任务依赖 → 前置任务 → 调试启动 → 调试结束 → 后置任务依赖 → 后置任务

> 调试快捷键：F5 启动调试 / Ctrl+Shift+D 打开调试面板

---

#### 平台特定配置

```json
"windows": {
    "program": "${workspaceFolder}/bin/app.exe"
},
"linux": {
    "program": "${workspaceFolder}/bin/app"
}
```

| 属性      | 类型   | 说明                 |
| --------- | ------ | -------------------- |
| `windows` | object | Windows 系统专用配置 |
| `linux`   | object | Linux 系统专用配置   |
| `osx`     | object | macOS 系统专用配置   |

---

#### 高级选项

| 属性                | 类型    | 说明                                |
| ------------------- | ------- | ----------------------------------- |
| `symbolSearchPath`  | string  | 符号文件搜索路径（C++调试）         |
| `visualizerFile`    | string  | Natvis 可视化文件路径（C++调试）    |
| `showDisplayString` | boolean | 是否显示自定义类型可视化（C++调试） |
| `serverReadyAction` | object  | 服务启动后自动打开浏览器等操作      |

---

### 3. 完整配置示例

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "C++ Debug",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/build/app",
            "args": ["--verbose"],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [{"name": "LD_LIBRARY_PATH", "value": "/usr/local/lib"}],
            "externalConsole": false,
            "MIMode": "gdb",
            "preLaunchTask": "build",
            "linux": {
                "miDebuggerPath": "/usr/bin/gdb"
            },
            "windows": {
                "miDebuggerPath": "C:/mingw/bin/gdb.exe"
            }
        }
    ]
}
```

---

#### `setupCommands`

`setupCommands` 是 `launch.json` 中用于配置调试器初始化命令的高级属性，通常用于 C/C++ 调试（如 GDB 或 LLDB）。它允许你在调试会话启动时执行一系列调试器命令，以设置调试环境或配置调试器的行为。

基本结构

```json
"setupCommands": [
    {
        "description": "Enable pretty-printing for gdb",
        "text": "-enable-pretty-printing",
        "ignoreFailures": true
    }
]
```

| 属性             | 类型    | 必需 | 默认值  | 说明                                                        |
| ---------------- | ------- | ---- | ------- | ----------------------------------------------------------- |
| `description`    | string  |      | -       | 命令的描述信息（可选）                                      |
| `text`           | string  | ✔️    | -       | 调试器命令（如 GDB 或 LLDB 命令）                           |
| `ignoreFailures` | boolean |      | `false` | 是否忽略命令执行失败（`true`=忽略，`false`=失败时中断调试） |

用途

- 启用 GDB 的 pretty-printing

```json
"setupCommands": [
    {
        "description": "Enable pretty-printing for gdb",
        "text": "-enable-pretty-printing",
        "ignoreFailures": true
    }
]
```

- 加载调试符号

```json
"setupCommands": [
    {
        "description": "Load symbols",
        "text": "file ${workspaceFolder}/bin/app",
        "ignoreFailures": false
    }
]
```

- 设置断点

```json
"setupCommands": [
    {
        "description": "Set breakpoint at main",
        "text": "break main",
        "ignoreFailures": false
    }
]
```

- 配置 LLDB 的格式化选项

```json
"setupCommands": [
    {
        "description": "Enable LLDB data formatters",
        "text": "type format add --format hex int",
        "ignoreFailures": true
    }
]
```

- 设置调试器变量

```json
"setupCommands": [
    {
        "description": "Set debugger variable",
        "text": "set print object on",
        "ignoreFailures": true
    }
]
```

---

注意事项

1. **调试器支持**：`setupCommands` 仅适用于支持 MI（Machine Interface）模式的调试器（如 GDB 和 LLDB）。
2. **命令格式**：
   - GDB 命令以 `-` 开头（如 `-enable-pretty-printing`）。
   - LLDB 命令直接使用（如 `type format add --format hex int`）。
3. **调试器路径**：确保 `miDebuggerPath` 正确指向调试器可执行文件。
4. **错误处理**：如果命令可能失败且不影响调试，建议设置 `ignoreFailures: true`。

---

### 4. 特殊变量

| 变量格式                     | 说明                   |
| ---------------------------- | ---------------------- |
| `${workspaceFolder}`         | 项目根目录             |
| `${file}`                    | 当前打开的文件         |
| `${fileBasenameNoExtension}` | 当前文件名（无扩展名） |
| `${env:VAR_NAME}`            | 获取环境变量值         |

---
