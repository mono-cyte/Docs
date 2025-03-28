# 学习环境搭建

## Linux（以Ubuntu为例）

```shell
sudo apt install gcc g++ make
```

## Windows

学习与演示过程以Windows为主，Windows上装MinGW环境，[MinGW官网](https://www.mingw-w64.org/)

之前我们提过两个版本的环境，**MingW-W64-builds**和**w64devkit**
推荐使用**w64devkit**套件，里面工具比较齐全，还提供模拟了许多Linux命令，用这个套件环境来学习可以保持在Linux与Windows上Makefile书写方式一致。
以下是w64devkit与其他包一些命令的区别

| w64devkit（模拟Linux） | MingW-W64-builds或其他套件（Windows cmd命令） |
| :--------------------: | :-------------------------------------------: |
|          make          |                 mingw32-make                  |
|           cc           |                      gcc                      |
|           rm           |                      del                      |
|         touch          |                                               |
|           ls           |                      dir                      |
|           sh           |                                               |
|           mv           |                                               |
|           cp           |                  copy/xcopy                   |
|          sed           |                                               |

## 学习材料

make官方文档： https://www.gnu.org/software/make/manual/make.html

2048: https://github.com/plibither8/2048.cpp

sudoku:  https://github.com/mayerui/sudoku
