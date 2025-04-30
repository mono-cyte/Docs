# help

## principle

非 insert 模式下的可打印字符的按键，如 a0+ 等。这些输入字符会被 vscode-neovim 直接送给 neovim

insert 模式下的可打印字符的按键。在 insert 模式下 vscode 的文件缓冲不会同步到 neovim，直到退出 insert 模式，所以这种情景下也不会将输入字符送给 neovim 解析，设置这类快捷键需要在 vscode 中设置

## 通过 neovim 后端命令操作 vsc 前端

使用 vscode-neovim api

## 新增可传递至 neovim 的快捷键

vscode 输入映射至 neovim 命令

- 仅 vscode 中设置

```json
"vscode-neovim.compositeKeys": {
        "jj": {
            "command": "vscode-neovim.escape",
        },
    }
```

```json
{
    "vscode-neovim.compositeKeys": {
        "jk": {
            // Use lua to execute any logic
            "command": "vscode-neovim.lua",
            "args": [
                [
                    "local code = require('vscode')",
                    "code.action('vscode-neovim.escape')",
                    "code.action('workbench.action.files.save')",
                ],
            ],
        },
    },
}
```

需要 neovim 处理的按键设置 vscode-neovim.send 类型
