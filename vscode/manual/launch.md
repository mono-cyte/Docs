# launch.json 配置

## 1. 基本结构

```json
{
    "version": "0.2.0",
    "configurations": [
        { /* configuration1 */ },
        { /* configuration2 */ }
    ],
    "inputs": [
        { /* input1 */ },
        { /* input2 */ }
    ],
    "compounds": [
        { /* compound1 */ },
        { /* compound2 */ }
    ]
}
```

- version
    版本号(必需)
- configurations
    调试配置(必需)
- inputs
    输入列表(可选)
- compounds
    复合调试会话(可选)

| 属性             | 说明                                   |
| ---------------- | -------------------------------------- |
| `version`        | 固定为 `"0.2.0"`（配置格式版本）       |
| `configurations` | 调试配置数组，每个元素代表一种调试场景 |

---

## 2. configurations

### 基础属性

| 属性      | 类型   | 必需 | 默认值 | 示例                                         | 说明                                                         |
| --------- | ------ | ---- | ------ | -------------------------------------------- | ------------------------------------------------------------ |
| `name`    | string | ✔️    | -      | `"C++ Debug"`                                | 配置名称（显示在调试启动列表中）                             |
| `type`    | string | ✔️    | -      | `"cppdbg"`, `"node"`, `"python"`, `"chrome"` | 调试器类型                                                   |
| `request` | string | ✔️    | -      | `"launch"`, `"attach"`                       | 启动方式：<br>`launch`=启动新进程<br>`attach`=附加到已有进程 |

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

## 3. compounds

| 属性           | 类型   | 必需 | 示例                                   | 说明                                                         |
| -------------- | ------ | ---- | -------------------------------------- | ------------------------------------------------------------ |
| name           | string | ✔️    | `"launch 1 and 2"`                     | 复合会话的名称（显示在调试启动列表中）                       |
| configurations | array  | ✔️    | `["configuration1", "configuration2"]` | 包含的调试配置名称数组，每个元素对应 configurations 中的配置 |

### 示例

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Node Backend",
            "type": "node",
            "request": "launch",
            "program": "${workspaceFolder}/server/app.js"
        },
        {
            "name": "React Frontend",
            "type": "chrome",
            "request": "launch",
            "url": "http://localhost:3000",
            "webRoot": "${workspaceFolder}/client"
        }
    ],
    "compounds": [
        {
            "name": "Debug Full Stack",
            "configurations": ["Node Backend", "React Frontend"]
        }
    ]
}
```

---

使用llvm-mingw时, 最优方案是: 安装lldb-dap扩展, 且设置 `type: lldb-dap`
