
# **Clang/Clang++**

## 默认风格
- **AT&T 语法** 是 Clang 的默认内联汇编风格。

## 支持 Intel 语法
- 使用 `-masm=intel` 编译选项可以切换到 Intel 语法。
- 在代码中，可以通过 `.intel_syntax noprefix` 和 `.att_syntax prefix` 显式切换语法。

## 示例代码

### AT&T 语法

```c
asm(
    "movl $1, %eax\n"
    "addl $2, %eax"
);
```

### Intel 语法

```c
asm(
    ".intel_syntax noprefix\n"
    "mov eax, 1\n"
    "add eax, 2\n"
    ".att_syntax prefix"
);
```

### 编译命令（Intel 语法）

```bash
clang -masm=intel -o program program.c
```

---

# **GCC/G++**

## 默认风格

- **AT&T 语法** 是 GCC 的默认内联汇编风格。

## 支持 Intel 语法

- 使用 `-masm=intel` 编译选项可以切换到 Intel 语法。
- 在代码中，可以通过 `.intel_syntax noprefix` 和 `.att_syntax prefix` 显式切换语法。

## 示例代码

### AT&T 语法

```c
asm(
    "movl $1, %eax\n"
    "addl $2, %eax"
);
```

### Intel 语法

```c
asm(
    ".intel_syntax noprefix\n"
    "mov eax, 1\n"
    "add eax, 2\n"
    ".att_syntax prefix"
);
```

### 编译命令（Intel 语法）

```bash
gcc -masm=intel -o program program.c
```

---

# **MSVC**

## 默认风格

- **Intel 语法** 是 MSVC 的唯一支持的内联汇编风格。
- MSVC 不支持 AT&T 语法。

## 示例代码

### Intel 语法

```c
__asm {
    mov eax, 1
    add eax, 2
}
```

### 编译命令

MSVC 使用 `cl` 编译器，无需额外参数：

```bash
cl /Fe:program program.c
```

---

# **总结对比**

| 编译器    | 默认风格 | 支持 Intel 语法 | 支持 AT&T 语法 | 切换方法                     |
| --------- | -------- | --------------- | -------------- | ---------------------------- |
| **Clang** | AT&T     | 是              | 是             | `-masm=intel` 或显式切换语法 |
| **GCC**   | AT&T     | 是              | 是             | `-masm=intel` 或显式切换语法 |
| **MSVC**  | Intel    | 是              | 否             | 无需切换                     |

---

# **补充说明**

1. **Clang 和 GCC 的显式语法切换**
   - 在代码中，可以通过以下方式显式切换语法：

     ```c
     __asm__(".intel_syntax noprefix");  // 切换到 Intel 语法
     __asm__(".att_syntax prefix");      // 切换回 AT&T 语法
     ```

2. **MSVC 的限制**
   - MSVC 的内联汇编器（`__asm`）仅支持 Intel 语法。
   - 如果需要 AT&T 语法，可以使用外部工具（如 GCC 或 Clang）生成汇编代码，然后嵌入到 MSVC 项目中。

3. **破坏寄存器列表**
   - 在 Clang 和 GCC 中，如果内联汇编修改了寄存器，需要在破坏寄存器列表中声明，例如：

     ```c
     __asm__ volatile (
         "movl $1, %%eax"
         :
         :
         : "%eax"
     );
     ```

4. **立即数和内存操作数**
   - AT&T 语法中，立即数需要加 `$`，寄存器需要加 `%`。
   - Intel 语法中，直接使用立即数和寄存器名。
