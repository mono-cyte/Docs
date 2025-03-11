# `compile_commands.json` 文件说明

`compile_commands.json` 是一个用于描述编译命令的 JSON 文件，通常用于工具如 Clang 的 `libTooling` 或 `clangd` 等  它包含了项目中每个编译单元的编译命令信息  以下是对其顶级属性的说明

## 顶级属性

`compile_commands.json` 文件的顶级属性是一个数组，数组中的每个元素都是一个对象，代表一个编译单元的编译命令  每个对象包含以下属性：

### `directory`

- **类型**: string
- **说明**: 编译命令执行的工作目录
- **示例**: `"/home/user/project/src"`

> [!WARNING]
> `directory` 属性**必须**使用绝对路径

### `file`

- **类型**: **string**
- **说明**: 必要参数, 然而其值疑似无效

> [!NOTE]
> 这是**路径**! 即使填写具体文件, 也会解析为**文件的目录路径**

### `command`

- **类型**: string
- **说明**: 用于编译源文件的完整命令
- **示例**: `"clang++ -std=c++11 -o main.o -c main.cpp"`

### `arguments`

- **类型**: array (可选)
- **说明**: 编译命令的参数列表
- **示例**:

```json
"arguments": ["clang++", "-std=c++11", "-o", "main.o", "-c", "main.cpp"]
```

> [!WARNING]
> `arguments` 与 `command` 属性不能互补, 且某些情况下互斥
>
> `arguments`完全等效于各参数使用space分隔合并的 `command`

## 最小示例

> [!NOTE]
>
> - 命令完整度不影响智能感知, 只需要其中的关键参数, 如: `-I`
> - 编译器作为参数是必要的, 如: `clang` `gcc` `clang++` `g++`
> - 只要参数齐全, 默认会对项目目录及其子目录下生效, 因此 `file` 的具体值疑似没有作用

```json
[
    {
        "directory": "/code",
        "file": "",
        "arguments": [
            "clang",
            "-Iinclude"
        ]
    }
]
```

> [!NOTE]
> 上述格式可对 **项目目录** (**不只是code目录**) 下的所有文件启用关于 `/code/include/` 中的头文件检查
