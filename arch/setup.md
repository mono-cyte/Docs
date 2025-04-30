# arch + kde 简明安装教程(双系统)

## 前置

### 基本分区知识

#### 固件 (Firmware)

##### BIOS (Basic Input/Output System)

-   传统的固件，主要用于早期计算机
-   主要功能是初始化硬件并加载操作系统
-   使用 MBR (Master Boot Record) 分区表格式
-   功能较为简单，不支持大容量硬盘和高级安全特性

##### UEFI (Unified Extensible Firmware Interface)

-   BIOS 的继任者，提供更现代的功能
-   支持 GPT (GUID Partition Table) 分区表格式，适合大容量硬盘
-   提供更高的安全性（如 Secure Boot）和灵活性
-   支持更多功能，例如网络启动、图形化界面等

#### 分区表

分区表是硬盘上的一段关键数据，它详细记录了硬盘的物理结构和逻辑划分，用于指导操作系统如何识别和管理硬盘分区

##### MBR (Master Boot Record)

与 BIOS 共用使用

<table>
    <tr>
        <th>结构</th>
        <th>位置</th>
        <th>内容</th>
    </tr>
    <tr>
        <th>Boot Code</th>
        <th>前446 Byte</th>
        <th>包含了操作系统用来启动计算机的指令。当计算机启动时，BIOS会将MBR加载到内存并执行这部分代码</th>
    </tr>
    <tr>
        <th>Partition Table</th>
        <th>447~510 Byte (64 Byte)</th>
        <th>描述硬盘上的四个主分区或扩展分区的信息。每个分区占用16字节，因此MBR最多支持4个主分区或3个主分区加1个扩展分区</th>
    </tr>
    <tr>
        <th>End signature</th>
        <th>511~512 Byte (2 Byte)，固定为 0x55AA</th>
        <th>用于标识这是一个有效的MBR扇区</th>
    </tr>
</table>

##### GPT (GUID Partition Table)

与 UEFI 共同使用

<table>
    <tr>
        <th>结构</th>
        <th>位置</th>
        <th>内容</th>
    </tr>
    <tr>
        <td>Protective MBR</td>
        <td>磁盘第一个扇区</td>
        <td>标记整个磁盘为单个“保护分区”（类型 0xEE）</td>
    </tr>
    <tr>
        <td>Primary GPT Header</td>
        <td>磁盘第二个扇区</td>
        <td>记录分区表位置、CRC 校验值、备份 GPT 位置等元数据</td>
    </tr>
    <tr>
        <td>Partition Entries</td>
        <td>GPT 表头后 32 个扇区</td>
        <td>
            <ul>
                <li>Partition GUID: 分区的全局唯一标识符</li>
                <li>起始/结束 LBA: 分区的逻辑块地址范围</li>
                <li>Partition Type GUID: 分区类型标识 (如 C12A7328-F81F-11D2-BA4B-00A0C93EC93B 表示 EFI 系统分区)</li>
                <li>Partition Name: 分区名称 UTF-16 编码，如 <code>Recovery</code></li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Backup GPT</td>
        <td>磁盘末尾</td>
        <td>完整备份主 GPT 表头和分区条目，用于灾难恢复</td>
    </tr>
</table>

#### 分区格式

| 特性             | FAT32 (File Allocation Table)     | NTFS (New Technology File System)      | EXT4 (Extended File System)      | exFAT (Extended File Allocation Table)     |
| ---------------- | --------------------------------- | -------------------------------------- | -------------------------------- | ------------------------------------------ |
| **适用操作系统** | Windows、macOS、Linux（有限支持） | Windows（默认）                        | Linux（默认）                    | Windows、macOS、Linux                      |
| **文件大小限制** | 4GB                               | 16EB                                   | 16TB                             | 6EB                                        |
| **分区大小限制** | 最大 2TB                          | 非常高（具体取决于硬件）               | 非常高（具体取决于硬件）         | 最大 128PB                                 |
| **跨平台兼容性** | 较好                              | 在非 Windows 系统上需要第三方驱动      | 在非 Linux 系统上兼容性较差      | 优秀，原生支持多种操作系统                 |
| **安全性与功能** | 不支持加密和权限管理              | 支持加密、权限管理、日志记录、压缩等   | 不支持加密和压缩，但具有日志功能 | 不支持加密、权限管理和压缩                 |
| **性能**         | 适用于小型存储设备，性能一般      | 性能优越，适用于大容量存储和大文件传输 | 性能优秀，适用于普通和高性能系统 | 在移动设备上性能较好，支持大文件和长文件名 |
| **日志功能**     | 不支持                            | 支持                                   | 支持                             | 不支持                                     |
| **压缩功能**     | 不支持                            | 支持                                   | 不支持                           | 不支持                                     |
| **加密功能**     | 不支持                            | 支持（EFS）                            | 不支持                           | 不支持                                     |
| **磁盘配额**     | 不支持                            | 支持                                   | 不支持                           | 不支持                                     |
| **设计目标**     | 小型存储设备                      | Windows 操作系统默认文件系统           | Linux 操作系统默认文件系统       | 跨平台移动存储设备                         |

---

补充说明

##### fat32

可见于引导分区, U 盘

1. 兼容性好
2. 无权限设置
3. 单文件大小限制 (< 4 GB)
4. 文件名长度限制 (< 255 char)

##### swap

swap 分区是 Linux 系统中的交换分区

内存不足时，操作系统会将部分不常用的内存数据写入到 swap 分区中，从而释放内存供其他进程使用

swap 分区本身没有文件系统，但它有自己的专有格式，通常由 mkswap 工具创建和初始化

#### 分区用途

##### EFI / ESP

EFI 是 GPT 硬盘分区模式中的系统启动分区

##### MSR (Microsoft Reserved)

1. 主要用于为操作系统或其他软件提供未分配的空间, 这些空间可能用于创建其他类型的分区
2. 防止在磁盘管理过程中出现意外的分区重叠或冲突问题
3. 磁盘转换为动态磁盘时, MSR 可以为存储动态磁盘元数据提供空间. 这些元数据包括卷信息、条带化配置等

大小通常是 16 MB

##### WSR (Windows Reserved)

1. Windows 系统在安装过程中自动创建的一种分区
2. 主要用于存储系统更新、恢复环境或其他关键数据
3. 可能包含 Windows 恢复环境（WinRE，Windows Recovery Environment）所需的文件

### 规划磁盘空间

| 空间     | 实际位置 | 推荐容量(下限)      |
| -------- | -------- | ------------------- | --- |
| 用户数据 | `/home`  | >= 30 GB            |
| 根目录   | `/`      | >= 35 GB            |
| 交换区   | swap     | 根据 RAM 和需求确定 |     |

### 烧录 U 盘

## 安装

1. 根据主板进入 BIOS/UEFI 的方式, 进入 BIOS/UEFI 设置 (如: 启动时连续按 F2)

2. 将 引导 U 盘设置为启动设备

3. 选择安装对象

4. 网络连接(无线)
    1. `iwctl` 进入配置程序
    2. `device list` 列出所有网卡
    3. `station <device(如 wlan0)> scan` 扫描可用网络`
    4. `station <device(如 wlan0)> connect <SSID>` 连接网络
    5. `fdisk -l` 列出所有分区, 寻找目标硬盘(如: nvme0n1)
    6. `cfdisk <disk(如 nvme0n1)>` 进入配置程序
    7. 创建分区 (先 New, 选择 Type, 后 Write)
        1. 创建 EFI 分区(EFI System): 可直接与 Winnows 共用同一 EFI 分区, 无需额外 New
        2. 创建 SWAP 分区(Linux swap)
        3. 创建 ROOT 分区(Linux filesystem)
        4. 创建 HOME 分区(Linux home)
    8. 挂载分区
        1. `mkfs.<fat> -f /dev/<分区(如: nvme0n1p3)>` 格式化分区为 fat 格式, ext4 可省略 `-f` (严禁格式化双系统共用的 EFI 分区)
        2. `mkswap /dev/<分区(如: nvme0n1p4)>` 交换区初始化
        3. `mount /dev/<分区(如: nvme0n1p3)> /mnt` **一定**先挂载 ROOT 分区
        4. `mount --mkdir /dev/<分区(如: nvme0n1p5)> /mnt/home` 挂载 HOME 分区, 等效于先 `mkdir` 后挂载
        5. `mount --mkdir /dev/<分区(如: nvme0n1p1)> /mnt/efi (或 /mnt/boot/efi)` 挂载 EFI 分区
        6. `swapon /dev/<交换区编号(如: nvme0n1p4)>` 挂载交换区
    9. 安装基本内容
        1. `nano /etc/pacman.d/mirrorlist` 配置镜像源, 按照其中格式添加内容
        2. `pacman -Syu` 更新
        3. `pacman -S archlinux-keyring` 安装管理 Arch Linux 的软件包签名密钥, 确保后续的软件包管理能够正常工作
        4. `pacstrap /mnt base base-devel linux-zen linux-zen-headers linux-firmware networkmanager grub os-prober efibootmgr amd-ucode bluez bluez-utils nano vim nvim`
            1. `base`: 基础软件包
            2. `base-devel`: 开发者软件包
            3. `linux-zen`: zen 内核(此版适合桌面)
            4. `linux-zen-headers`: 内核头文件
            5. `linux-firmware`: 固件
            6. `networkmanager`: 网络管理器
            7. `grub`: 引导管理器
            8. `os-prober`: 语言包
            9. `efibootmgr`: EFI 引导管理器
            10. `amd-ucode`: cpu 编码(根据实际硬件确定)
            11. `nano vim nvim`: 文本编辑器(自行决定)
        5. `genfstab -U /mnt >> /mnt/etc/fstab`
    10. `arch-chroot /mnt` 进入安装后的系统
    11. 设置语言
        1. 对 `/etc/locale.gen` 中`en_US.UTF-8 UTF-8`, `zh_CN.UTF-8 UTF-8` 解除注释
        2. `locale-gen` 生成本地化文件 `/etc/locale`
        3. 在 `/etc/locale.conf` 中添加 `LANG=en_US.UTF-8`
    12. 设置主机名
        1. 编辑 `/etc/hostname`, 内容即为主机名
    13. 创建用户
        1. `useradd -m -G wheel <username>` wheel 为具有 sudo 权限的用户组
        2. `/etc/sudoers` 中 `%wheel ALL=(ALL：ALL) ALL` 解除注释
    14. `passwd` 设置密码
    15. `systemctl enable NetworkManager bluetooth` 开启网络, 蓝牙服务
    16. grub 配置
        1. `/etc/default/grub` 中 `GRUB_DISABLE_OS_PROBER=false` 解除注释
        2. `grub-install --target=x86_64-efi --efi-directory=<efi挂载目录(如 /efi)> --bootloader-id=grub`
        3. `grub-mkconfig -o /boot/grub/grub.cfg` 生成更新 grub 引导
    17. `pacman -S plasma` 安装桌面环境 plasma(自带 wayland 和 xorg)
    18. `systemctl enable sddm` 开启 sddm 显示管理, 锁屏
    19. 重启到 linux(如果启动仍然是 Windows, 进入 BIOS/UEFI 确定 efi 配置 从 `Windows Boot Manager` 改为 `grub`), 更新 grub (如果 grub 没有 Windows 选项)
    20. 安装中文字体

## 配置

1. pacman 添加 archlinuxcn 源
2. 安装输入法支持 `fcitx5`
    - 相关组件
        1. fcitx5-im
        2. fcitx5-chinese-addons
        3. fcitx5-rime
    - 添加环境变量
        1. `GTK_IM_MODULES=fcitx`
        2. ,`QT_IM_MODULES=fcitx`
        3. `XMODIFIERS=@im=fcitx`
        4. `SDL_IM_MODULES=fcitx`
3. 安装 discover 后端 `apackagekit-qt6`
4. 安装 paru 或 yay
5. 安装 firefox
6. 双系统时间同步(Windows 默认使用主板时间而非 UTC 时间, 在 Linux 也需要主动设置使用主板时间)`sudo timedatectl set-local-rtc 1`
