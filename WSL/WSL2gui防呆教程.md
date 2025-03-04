# WSL2傻瓜式教程

## 0. 启用WSL2功能

## 1. 安装OS

### 1-1. 在Microsoft Store获取Ubuntu-24.04 LTS(或更新版)

### 1-2. 打开应用程序Ubuntu，进行自动安装

> [!WARNING]
>
> 程序的位置在`C:\Program Files\WindowsApps\CanonicalGroupLimited.Ubuntu24.04LTS_2404.1.24.0_neutral_split.scale-150_79rhkp1fndgsc`或类似的位置。
>
> 访问此处需要更改目录的所有者



### 1-3. 注册Ubuntu用户、密码



### 1-4.更新apt

`sudo apt update && sudo apt upgrade`

### 1-5.(可选)安装apt-fast

`sudo add-apt-repository ppa:apt-fast/stable -y`

``sudo apt update`

`sudo apt install apt-fast`

### 1-6.(可选)更改默认登陆用户:

```powershell
<wsl> config --default-user <username>
```

例:

```powershell
ubuntu2404.exe config --default-user root
```

无论什么用户，在wsl启动时，无需密码即可登录。

建议默认用户设置root，如此在Windows访问wsl的网络位置的文件系统时(使用资源管理器)，有权限修改文件。

## 2. 设置中文

### 2-1. 安装中文字体

`sudo apt-get install language-pack-zh-hans`
`sudo apt install fonts-wqy-zenhei`

### 2-2. 切换中文环境

#### 2-2-1. 区域设置

   `sudo dpkg-reconfigure locales`

#### 2-2-2 选择语言、编码

   > space为选中，Tab为循环切换光标位置，Enter为确认，方向键移动光标

#### 2-2-3. 重启生效

## 3. GUI + 远程桌面配置

> [!NOTE]
> 非必要可无视此部分

### 3-1. 安装xrdp

`sudo apt install xrdp`

### 3-2. 配置远程连接默认桌面

`~`一般指`/home/<username>`

`sudo vim ~/.xsession`

内部需要添加一个默认桌面环境的**名称**。

<a id="setDesktop"></a>

如果需要添加桌面环境，请参考[[4. 安装桌面环境](#DesktopOption)]对应内容

### 3-3. 查看ip端口，远程连接

一般为`127.0.0.1:3389`，或`localhost:3389`（xrdp默认端口）

<a id="DesktopOption"></a>

## 4. 安装桌面环境(建议单选)

### GNOME

`sudo apt-fast install -y gnome-shell`

[若要设置此为默认桌面，需要在~/.xsession添加内容：](#setDesktop) `gnome-session`

### MATE

  `sudo apt-fast install -y ubuntu-mate-desktop`

[添加内容：](#setDesktop)`mate-session`

### KDE Plasma

`sudo apt-fast install -y kde-plasma-desktop`

> [!NOTE]
>
> `sudo apt-fast install -y kubuntu-desktop`
>
> 此为KDE 的完整版本（包括所有附加组件和应用程序）

[添加内容：](#setDesktop)`startplasma-x11`

### XFCE4

 `sudo apt-fast install -y xfce4`

[添加内容：](#setDesktop)`startxfce4`

### LXDE

`sudo apt-fast install -y lxde`

[添加内容：](#setDesktop)`startlxde`

### LXQT

`sudo apt-fast install -y lxde`

[添加内容：](#setDesktop)`lxqt-session`

### Cinnamon

`sudo apt-fast install -y cinnamon-desktop-environment`

[添加内容：](#setDesktop)`cinnamon-session`

### DEEPIN

`sudo apt-fast install -y deepin-desktop-environment`

[添加内容：](#setDesktop)`deepin-session`

## 环境变量

在/etc/profile.d中设置环境PATH时，严禁使用变量，必须使用绝对路径，否则会莫名其妙地无法识别路径
