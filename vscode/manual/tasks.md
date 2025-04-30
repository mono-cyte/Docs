# tasks.json 配置详解

## 1. 基本结构

```json
{
    "version": "2.0.0",
    "tasks": [
        {/* task1 */},
        {/* task2 */}
    ],
    "inputs": [
        { /* input1 */ },
        { /* input2 */ }
    ],
    "windows": {
        "tasks": []
    },
    "osx": {
        "tasks": []
    }
    "linux": {
        "tasks": []
    }
}
```

- version
    版本号(必需)
- tasks
    任务列表(必需)
- inputs
    输入列表(可选)
- windows
    windows 系统下任务列表(可选)
- osx
    macOS 系统下任务列表(可选)
- linux
    linux 系统下任务列表(可选)

### 1.1 完整示例

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Init build",
            "type": "shell",
            "command": "mkdir",
            "args": [
                "-p",
                "${workspaceFolder}/build/preprocess",
                "${workspaceFolder}/build/compile"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            }
        },
        {
            "label": "x86_64-w64-mingw32-clang++ preprocess",
            "type": "shell",
            "dependsOn": ["Init build"],
            "command": "x86_64-w64-mingw32-clang++",
            "args": [
                "-E",
                "${fileBasenameNoExtension}.cpp",
                "-o",
                "${workspaceFolder}/build/preprocess/${fileBasenameNoExtension}.i"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "group": "build",
            "presentation": {
                "reveal": "always",
                "panel": "shared"
            },
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "x86_64-w64-mingw32-clang++ compile",
            "type": "shell",
            "dependsOn": ["x86_64-w64-mingw32-clang++ preprocess"],
            "command": "x86_64-w64-mingw32-clang++",
            "args": [
                "-S",
                "${workspaceFolder}/build/preprocess/${fileBasenameNoExtension}.i",
                "-o",
                "${workspaceFolder}/build/compile/${fileBasenameNoExtension}.s"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "group": "build",
            "presentation": {
                "reveal": "always",
                "panel": "shared"
            },
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "x86_64-w64-mingw32-clang++ assemble",
            "type": "shell",
            "dependsOn": ["x86_64-w64-mingw32-clang++ compile"],
            "command": "x86_64-w64-mingw32-clang++",
            "args": [
                "-c",
                "${workspaceFolder}/build/compile/${fileBasenameNoExtension}.s",
                "-o",
                "${workspaceFolder}/build/${fileBasenameNoExtension}.o"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "group": "build",
            "presentation": {
                "reveal": "always",
                "panel": "shared"
            },
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "x86_64-w64-mingw32-clang++ link",
            "type": "shell",
            "command": "x86_64-w64-mingw32-clang++",
            "args": [
                "${workspaceFolder}/build/${fileBasenameNoExtension}.o",
                "-o",
                "${workspaceFolder}/build/${input:target}.exe"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "group": "build",
            "presentation": {
                "reveal": "always",
                "panel": "new"
            },
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "Init debug",
            "type": "shell",
            "command": "mkdir",
            "args": ["-p", "${workspaceFolder}/debug"]
        },
        {
            "label": "x86_64-w64-mingw32-clang++ debug-build",
            "type": "shell",
            "dependsOn": ["Init debug"],
            "command": "x86_64-w64-mingw32-clang++",
            "args": [
                "${file}",
                "-g",
                "-o",
                "${workspaceFolder}/debug/${input:target}.exe"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "group": "build",
            "presentation": {
                "reveal": "never",
                "panel": "new"
            },
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "Disassemble binary",
            "type": "shell",
            "command": "x86_64-w64-mingw32-objdump",
            "args": [
                "-S",
                "-M",
                "intel",
                "-d",
                "${file}",
                ">",
                "${fileBasenameNoExtension}.asm"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            }
        }
    ],
    "inputs": [
        {
            "id": "target",
            "type": "promptString",
            "description": "Enter extra parameters as name",
            "default": ""
        }
    ]
}


```

### 1.2 tasks配置参数

```json
"tasks":[
    {
            "label": "x86_64-w64-mingw32-clang++ link",
            "type": "shell",
            "command": "x86_64-w64-mingw32-clang++",
            "args": [
                "${workspaceFolder}/build/${fileBasenameNoExtension}.o",
                "-o",
                "${workspaceFolder}/build/${input:target}.exe"
            ],
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "group": "build",
            "presentation": {
                "reveal": "always",
                "panel": "new"
            },
            "problemMatcher": ["$gcc"]
    }
]
```

#### 1.2.1 基础配置

| 参数        | 说明                         |
| ----------- | ---------------------------- |
| `label`     | 任务唯一标识符（自定义命名） |
| `dependsOn` | 前置任务列表（数组格式）     |

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

#### 1.2.5 预定义 Problem Matchers

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
