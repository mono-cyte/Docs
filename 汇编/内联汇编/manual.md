# 内联汇编

## **Clang/Clang++**

### 默认风格

- **AT&T 语法** 是 Clang 的默认内联汇编风格

### 支持 Intel 语法

- 使用 `-masm=intel` 编译选项可以切换到 Intel 语法
- 在代码中, 可以通过 `.intel_syntax noprefix` 和 `.att_syntax prefix` 显式切换语法

### 示例代码

#### AT&T 语法

```c
asm(
    "movl $1, %eax\n"
    "addl $2, %eax"
);
```

#### Intel 语法

```c
asm(
    ".intel_syntax noprefix\n"
    "mov eax, 1\n"
    "add eax, 2\n"
    ".att_syntax prefix"
);
```

#### 编译命令(Intel 语法)

```bash
clang -masm=intel -o program program.c
```

---

## **GCC/G++**

### 默认风格

- **AT&T 语法** 是 GCC 的默认内联汇编风格

### 支持 Intel 语法

- 使用 `-masm=intel` 编译选项可以切换到 Intel 语法
- 在代码中, 可以通过 `.intel_syntax noprefix` 和 `.att_syntax prefix` 显式切换语法

### 示例代码

#### AT&T 语法

```c
asm(
    "movl $1, %eax\n"
    "addl $2, %eax"
);
```

#### Intel 语法

```c
asm(
    ".intel_syntax noprefix\n"
    "mov eax, 1\n"
    "add eax, 2\n"
    ".att_syntax prefix"
);
```

#### 编译命令(Intel 语法)

```bash
gcc -masm=intel -o program program.c
```

---

## **MSVC**

### 默认风格

- **Intel 语法** 是 MSVC 的唯一支持的内联汇编风格
- MSVC 不支持 AT&T 语法

### 示例代码

#### Intel 语法

```c
__asm {
    mov eax, 1
    add eax, 2
}
```

#### 编译命令

MSVC 使用 `cl` 编译器, 无需额外参数：

```bash
cl /Fe:program program.c
```

---

## **总结对比**

| 编译器    | 默认风格 | 支持 Intel 语法 | 支持 AT&T 语法 | 切换方法                     |
| --------- | -------- | --------------- | -------------- | ---------------------------- |
| **Clang** | AT&T     | 是              | 是             | `-masm=intel` 或显式切换语法 |
| **GCC**   | AT&T     | 是              | 是             | `-masm=intel` 或显式切换语法 |
| **MSVC**  | Intel    | 是              | 否             | 无需切换                     |

---

## 约束修饰符

在内联汇编中, 约束修饰符(如 =r 或 r)直接决定了操作数是输入还是输出, 同时约束中的符号(如 =、+)和操作数的位置(在输出列表或输入列表中)必须严格匹配

1. 输出操作数必须使用 = 或 + 修饰符
2. 输入操作数不能使用 = 或 + 修饰符
3. 操作数编号顺序

<table border="1">
<tr><th>约束符</th><th>含义</th><th>示例</th></tr>
<tr><td>r</td><td>寄存器(编译器自动分配)</td><td>"r" (var)</td></tr>
<tr><td>m</td><td>内存(直接操作变量地址)</td><td>"m" (var)</td></tr>
<tr><td>a</td><td>ax 寄存器(32 bits)</td><td>"=a" (result)</td></tr>
<tr><td>b</td><td>bx 寄存器</td><td>"b" (value)</td></tr>
<tr><td>c</td><td>cx 寄存器</td><td>"c" (count)</td></tr>
<tr><td>d</td><td>dx 寄存器</td><td>"d" (high)</td></tr>
<tr><td>S</td><td>si 寄存器</td><td>"S" (src)</td></tr>
<tr><td>D</td><td>di 寄存器</td><td>"D" (dest)</td></tr>
<tr><td>i</td><td>立即数(常量)</td><td>"i" (10)</td></tr>
<tr><td>g</td><td>通用(寄存器、内存或立即数)</td><td>"g" (var)</td></tr>
<tr><td>0-9</td><td>匹配指定编号的操作数(用于复用输入/输出)</td><td>"0" (input)</td></tr>
</table>

```c
    int a = 10, b = 20, c = 30;
    int result1, result2;
    asm volatile (
        "addl %2, %0 \n"   // %0 += %2(操作数从 0 开始编号)
        "imull %3, %1 \n"   // %1 *= %3
        : "=r" (result1), "=r" (result2)  // 输出：%0=result1, %1=result2
        : "r" (a), "r" (b), "r" (c)       // 输入：%2=a, %3=b, %4=c
        : /* 无显式寄存器破坏(通过约束隐式声明) */
    );
    // 结果：result1 = a + c = 40, result2 = b * c = 600
```

- 格式和顺序固定, 包含 `"output:intput:破坏寄存器列表"`
- %占位符从0开始

## **破坏寄存器列表**

在 Clang 和 GCC 中, 如果内联汇编修改了寄存器, 需要在破坏寄存器列表中声明

### 必须声明破坏寄存器的场景

1. **显式修改未绑定寄存器**  
   如果汇编代码操作了未通过约束绑定的寄存器(如 `%%eax`、`%%ebx`), **必须**在破坏列表中声明

    ```c
        int x = 10;
        asm volatile (
            "movl %1, %%eax \n"
            "addl $5, %%eax \n"
            "movl %%eax, %0 \n"
            : "=r"(x)     // 输出操作数未绑定到 eax
            : "r"(x)      // 输入操作数
            : "%eax"      // 必须声明 eax 被破坏
       );
    ```

1. **隐式修改条件码(EFLAGS)**  
如果汇编指令修改了标志寄存器(条件码寄存器), **必须**声明 `"cc"`

    ```c
        asm volatile (
            "addl $5, %0"
            : "+r"(value)
            :
            : "cc"  // 必须声明条件码被修改
        );
    ```

1. **隐式修改内存**  
如果通过非直接操作数修改了内存, **必须**声明 `"memory"`, 以确保编译器重新加载内存数据

    ```c
        int arr[10];
        asm volatile (
            "movl $100, (%0)"
            :
            : "r"(arr)
            : "memory"  // 必须声明内存被修改
         );
    ```

#### 可以省略破坏寄存器声明的场景

- **寄存器已通过约束绑定**  
    如果寄存器通过输入/输出操作数的约束绑定, 编译器会自动识别其被修改, 无需在破坏列表中重复声明

```c
    int result;
    asm volatile (
        "movl $10, %%eax \n"
        : "=a"(result)  // 约束 "=a" 绑定了 eax, 无需声明破坏
        :
        :
    );
```

- **未修改任何寄存器或状态**  
    如果汇编代码仅操作绑定的寄存器且不修改其他状态, 则可以省略破坏列表

```c
    int a = 5, b = 3;
    asm volatile (
        "addl %1, %0"
        : "+r"(a)      // 操作数 %0 是输入+输出
        : "r"(b)      // 操作数 %1 是输入
        // 无破坏列表(未修改其他寄存器/状态)
    );
```

#### 未声明破坏寄存器的后果

<table border="1">
<tr><th>场景</th><th>后果</th></tr>
<tr><td>未声明显式修改的寄存器</td><td>寄存器值被意外覆盖, 可能导致程序崩溃或数据损坏</td></tr>
<tr><td>未声明 <code>cc</code></td><td>条件判断逻辑错误, 后续指令(如 <code>jz</code>、<code>jg</code>)可能依赖于错误的标志位</td></tr>
<tr><td>未声明 <code>memory</code></td><td>编译器缓存的内存数据未刷新, 导致读取到旧值</td></tr>
</table>

## **补充说明**

### **Clang 和 GCC 的显式语法切换**

在代码中, 可以通过以下方式显式切换语法：

```c
    asm(".intel_syntax noprefix");  // 切换到 Intel 语法
    asm(".att_syntax prefix");      // 切换回 AT&T 语法
```

### **立即数和内存操作数**

- AT&T 语法中, 立即数需要加 `$`, 寄存器需要加 `%`
- %有特殊含义(用于表示操作数占位符，如%0、%1等)。如果直接在汇编代码中书写寄存器(如%rax)，需要用%%对%进行转义。这样编译器最终生成的汇编代码中，%%rax会被转换为标准的%rax。
- Intel 语法中, 直接使用立即数和寄存器名
