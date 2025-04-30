# CommonLibSSE Guide

## Dependencies

-   binary_io
-   Boost
-   spdlog

## CMake Build Configuration

|              |                          |
| ------------ | ------------------------ |
| PROJECT_NAME | CommonLibSSE             |
| SOURCES      | `cmake/sourcelist.cmake` |

## Build Process

1. 由 `scripts/cmake_generate.py` 生成`cmake/sourcelist.cmake` , 包含所有需要编译的文件
2. cmake 构建
