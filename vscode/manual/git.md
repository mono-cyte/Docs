# 在vscode的Git使用注意事项

vscode同步代码时会出现网络问题, 可能因为其url默认使用https

需要手动修改.git目录的config文件, 将url从https改为ssh

vscode设置`"github.gitProtocol": "ssh"`可以在创建时使用ssh
