# 特殊变量

| 变量格式                     | 说明                              |
| ---------------------------- | --------------------------------- |
| `${workspaceFolder}`         | 项目根目录                        |
| `${file}`                    | 当前打开的文件                    |
| `${fileBasenameNoExtension}` | 当前文件名（无扩展名）            |
| `${env:VAR_NAME}`            | 获取环境变量值                    |
| `${relativeFile}`            | 当前文件相对路径                  |
| `${relativeFileDirname}`     | 当前文件相对路径上级目录          |
| `${fileDirname}`             | 当前文件所在目录                  |
| `${fileExtname}`             | 当前文件扩展名                    |
| `${input:VAR_NAME}`          | 根据本文件设置的input动态输入变量 |

## inputs 配置参数

```json
"inputs": [
        {
            "id": "target",
            "type": "promptString",
            "description": "Enter extra parameters as name",
            "default": ""
        }
    ]
```

### type配置

| 配置项         | 说明                             |
| -------------- | -------------------------------- |
| `promptString` | 提示用户输入一个字符串           |
| `pickString`   | 提供一个字符串选项列表供用户选择 |
| `command`      | 执行一个命令并使用其输出作为输入 |
| `promptObject` | 提示用户输入一个对象             |

### promptString

```json
{
    "id": "target",
    "type": "promptString",
    "description": "Enter extra parameters as name",
    "default": ""
}
```

### pickString

```json
{
    "id": "buildType",
    "type": "pickString",
    "description": "Select the build type",
    "options": ["Debug", "Release"],
    "default": "Debug"
}
```

### command

```json
{
    "id": "gitBranch",
    "type": "command",
    "command": "git rev-parse --abbrev-ref HEAD",
    "description": "Current Git branch"
}
```

### promptObject

```json
{
    "id": "userInfo",
    "type": "promptObject",
    "description": "Enter user information",
    "default": {
        "name": "John Doe",
        "email": "john.doe@example.com"
    }
}
```

通过变量`{intput: <id>}`使用输入变量
