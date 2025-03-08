# `__attribute__`

__attribute 语法的来源
GNU C 的一大特色就是__attribute__ 机制。attribute 可以设置函数属性(Function Attribute)、变量属性(Variable Attribute)和类型属性(Type Attribute)

## Position

放于声明的尾部 `;` 之前

## Format

`__attribute__ ((attribute-list))`

> [!NOTE]
> `attribute-list` __可选__ 使用`__`在属性名前后包裹, 避免与宏定义发生冲突
>

- `__attribute__` 用于修饰对象时，它就如同C 语言语法体系结构的类型限定符，跟`const`, - `volatile`, `restrict` 等属一类
- `__attribute__` 用于修饰函数时，它就相当于一个函数说明符，跟inline，Noreturn 属同一类
- `__attribute__` 用于修饰一个结构体，联合体或者枚举类型，该限定符只能放在类型标识符之前

__attribute 所支持的类型
当我们需要识别当前编译器能否支持GNU 语法拓展，我们可以使用 `__GNUC__` 宏作为区分

```cpp
#ifdef __GNUC__
    // 编译器支持 GNU 扩展
    #if __GNUC__ >= 4
        // GCC 4.0 或更高版本
    #endif
#else
    // 编译器不支持 GNU 扩展
#endif
```

## Funciton Attribute

| Common Attribute               | Microsoft Windows Attributes |
| ------------------------------ | ---------------------------- |
| access                         | dllexport                    |
| aligned                        | dllimport                    |
| always_inline                  |                              |
| alloc_align                    |                              |
| alloc_size                     |                              |
| always_inline                  |                              |
| artificial                     |                              |
| assume_aligned                 |                              |
| cold                           |                              |
| const                          |                              |
| constructor                    |                              |
| destructor                     |                              |
| copy                           |                              |
| deprecated                     |                              |
| error                          |                              |
| warning                        |                              |
| expected_throw                 |                              |
| externally_visible             |                              |
| fd_arg                         |                              |
| fd_arg_read                    |                              |
| fd_arg_write                   |                              |
| flatten                        |                              |
| format                         |                              |
| format_arg                     |                              |
| gnu_inline                     |                              |
| hot                            |                              |
| ifunc                          |                              |
| interrupt                      |                              |
| interrupt_handler              |                              |
| leaf                           |                              |
| malloc                         |                              |
| no_icf                         |                              |
| no_instrument_function         |                              |
| no_profile_instrument_function |                              |
| no_reorder                     |                              |
| no_sanitize                    |                              |
| no_sanitize_address            |                              |
| no_address_safety_analysis     |                              |
| no_sanitize_thread             |                              |
| no_sanitize_undefined          |                              |
| no_sanitize_coverage           |                              |
| no_split_stack                 |                              |
| no_stack_limit                 |                              |
| no_stack_protector             |                              |
| noclone                        |                              |
| noinline                       |                              |
| noipa                          |                              |
| nonnull                        |                              |
| noplt                          |                              |
| noreturn                       |                              |
| nothrow                        |                              |
| null_terminated_string_arg     |                              |
| optimize                       |                              |
| patchable_function_entry       |                              |
| pure                           |                              |
| retain                         |                              |
| returns_nonnull                |                              |
| returns_twice                  |                              |
| section                        |                              |
| sentinel                       |                              |
| simd                           |                              |
| stack_protect                  |                              |
| symver                         |                              |
| tainted_args                   |                              |
| target                         |                              |
| target_clones                  |                              |
| unavailable                    |                              |
| unused                         |                              |
| used                           |                              |
| visibility                     |                              |
| warn_unused_result             |                              |
| weak                           |                              |
| weakref                        |                              |
| zero_call_used_regs            |                              |
| leafy-gpr-arg                  |                              |

---

[Common Function Attributes](https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Common-Function-Attributes.html)

---
`access (access-mode, ref-index)`

`access (access-mode, ref-index, size-index)`

> __access-mode__
>
> `read_only` `read_write` `write_only` `none`
>
> 使函数及其调用者能够检测无效或不安全的访问, 以及从未被读取的对象的> write-only访问
>
> 此类访问可能会通过 `-Wstringop-overflow`  `-Wuninitialized`  > `-Wunused` 等警告来诊断
>
> 对于应用了access的函数的 __引用传递__ 的 __参数__ , 访问模式由> access-mode规定

> __ref-index__
>
> 函数 __引用传递__ 的 __参数位置__

可选的size-index位置参数表示一个整数类型的函数参数，用于指定访问的最大大小。该大小是由ref-index引用的类型的元素数量，或者当指针类型为void*时，表示字节数。如果未指定size-index参数，则指针参数必须为null，或者指向一个空间，该空间必须适当对齐且至少能容纳一个被引用类型的对象（这意味着指向末尾之后的指针是无效的参数）。实际访问的大小可以小于指定大小，但绝不能超过

> __size-index__
>
> 这是一个可选整型参数，用于指定参数访问的最大范围
>
> 指针类型非void*，表示对应引用类型的元素个数的大小
> 指针类型是void*，表示字节数
>
> 未指定size-index，则指针参数必须满足以下条件之一
>
> 指针为null
>
> 指针指向的空间必须适当对齐，并且至少能容纳一个被引用类型的对象
>
> 这意味着指向末尾之后的指针(past-the-end pointer)是无效的。
>

```c
__attribute__((access(read_only, 1, 1), access(write_only, 2, 1))) void example(
    int*  ptr1, // ptr1受只读限制, 大小为1 sizeof(int)
    void* __attribute__(()) ptr2 // ptr2受只写限制, 大小为1byte
);
```

---
`alias ("target")`

使此声明作为另一个符号("target")的别名被生成

```c
void __f () { /* Do something. */; }
void f () __attribute__ ((alias ("__f")));
```

---
`aligned`

`aligned (alignment)`

如果函数的定义未在同一翻译单元(源文件)中提供，则该属性无效

`aligned` 属性指定了函数的第一条指令的最小对齐方式

以byte为单位

`alignment` 必须是一个 2 的整数次幂的常量

只能提高对齐的范围

不指定对齐参数，将使用目标平台的理想对齐方式

可以使用 `__alignof__` 运算符来确定理想对齐方式(用法同 `sizeof`)

---

alloc_align (position)

---

alloc_size (position)

alloc_size (position-1, position-2)

---
always_inline

---
artificial

---

assume_aligned (alignment)

assume_aligned (alignment, offset)

---

cold

---
`const`

纯函数不依赖于外部状态, 也不会改变外部状态, 只依赖于其输入参数

表明该函数是纯函数(pure function), 编译器可以利用这一信息进行优化

> - 消除重复调用
>
> 当一个函数被多次调用，且每次调用的参数相同，同时该函数的返回值仅依赖于输入参数（即没有副作用），编译器可以优化掉多余的调用，只保留一次调用，并复用其结果
>
> - 公共子表达式消除
>
> 当一个表达式在程序中被多次计算，且每次计算的值相同（表达式中的变量值未发生变化），编译器可以识别并消除重复计算，只计算一次，然后复用结果

```c
int square (int) __attribute__ ((const));
```

> [!NOTE]
> 参数名称在函数定义中是必需的，但在声明中可以省略

---
constructor
destructor
constructor (priority)
destructor (priority)

---
copy
copy (function)

---
`deprecated`

`deprecated (msg)`

deprecated 属性会在函数在源文件中的任何位置被使用时产生警告

用于识别未来版本中预期要删除的函数

警告还包括已弃用函数声明的位置, 以便用户可以轻松找到有关为什么弃用该函数或他们应该做什么的更多信息

> ```c
> int old_fn () __attribute__ ((deprecated));
> int old_fn ();
> int (*fn_ptr)() = old_fn;
> ```
>
> 第 3 行 (函数指针赋值) 产生警告  
> 第 2 行 (声明) 没有

将在警告中打印字符串参数 msg

`deprecated` 属性也可以用于变量和类型

属性 `msg` 受 `-fmessage-length` 选项影响。

---
`error ("message")`

`warning ("message")`

如果在函数声明中使用了 `error` 或 `warning` 属性，并且对该函数的调用没有通过死代码消除或其他优化被消除，那么将诊断出一个包含消息的错误或警告（分别对应）。这对于编译时检查非常有用，特别是与 `__builtin_constant_p` 和内联函数结合使用时，在这些情况下无法通过 `extern char [(condition) ? 1 : -1];` 的技巧来检查内联函数的参数。

虽然可以保留函数未定义，从而引发链接失败(通过在 .gnu.warning* 部分定义函数并附带消息)，但在使用这些属性时，问题会更早被诊断出来，并且能够精确定位调用位置，即使存在内联函数或不生成调试信息的情况下也是如此。

> [!NOTE]
> 死代码消除（Dead Code Elimination，DCE）是一种编译器优化技术，旨在删除程序中不会被执行的代码，从而提高程序的执行效率和资源利用率
> 死代码是指在程序的当前执行路径下不会被访问或执行的代码片段

---
expected_throw

---
externally_visible

---
fd_arg
fd_arg (N)
fd_arg_read
fd_arg_read (N)
fd_arg_write
fd_arg_write (N)

---
flatten

---
format (archetype, string-index, first-to-check)
format_arg (string-index)

---
gnu_inline

---
hot

---
ifunc ("resolver")

---
interrupt
interrupt_handler

---
leaf

---
malloc
malloc (deallocator)
malloc (deallocator, ptr-index)

---
no_icf

---
no_instrument_function

---
no_profile_instrument_function

---
no_reorder

---
no_sanitize ("sanitize_option")
no_sanitize_address(no_address_safety_analysis)

---
no_sanitize_thread

---
no_sanitize_undefined

---
no_sanitize_coverage

---
no_split_stack

---
no_stack_limit

---
no_stack_protector

---
noclone

---
noinline

---
noipa

---
nonnull
nonnull (arg-index, …)

---
noplt

---
noreturn

部分标准库函数, 如 `abort` 和 `exit` , 无法返回, GCC 会自动识别这一点

自定义的无返回函数, 需要声明它们为 `noreturn`

> [!NOTE]
> __程序终止函数__  
> `exit` `abort` 等标准库函数, 用于终止程序运行  
> 自定义的无返回函数可以封装特定的终止逻辑，例如记录日志、释放资源等
>
> __无限循环__  
> 如: 事件循环
>
> __跳转函数__  
> 使用 `setjmp`/`longjmp` 或类似机制实现非局部跳转的函数，可能不会返回到调用点

---
nothrow

---
null_terminated_string_arg
null_terminated_string_arg (N)

---
optimize (level, …)
optimize (string, …)

---
patchable_function_entry

---
`pure`

表明该函数是纯函数(pure function), 编译器可以利用这一信息进行优化

---
retain

---
returns_nonnull

---
returns_twice

---
section ("section-name")

---
sentinel
sentinel (position)

---
simd
simd("mask")

---
stack_protect

---
symver ("name2@nodename")

---
tainted_args

---
target (string, …)
target_clones (options)

---
unavailable
unavailable (msg)

---
unused

---
used

---
`visibility ("visibility_type")`

影响其所修饰的 __声明__ 的 __链接__ (符号可见性)

可用于变量和类型

`default`
`hidden`
`internal`
`protected`

---
warn_unused_result

---
weak

---
weakref
weakref ("target")

---
zero_call_used_regs ("choice") - skip used used-gpr used-arg used-gpr-arg all all-gpr all-arg all-gpr-arg leafy leafy-gpr leafy-arg leafy-gpr-arg

---

[Microsoft Windows Function Attributes](https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Microsoft-Windows-Function-Attributes.html)

dllexport

dllimport

## Detailed Explanation

- `packed`

让编译器在编译时取消结构体的byte优化对齐，按照实际占用的byte进行对齐

在某些场景用户不希望编译器对byte对齐进行调整，否则处理起来会比较麻烦，那么可以使用该属性

- `aligned(size)`

规定变量或结构体成员最小对齐格式, 以byte为单位

让用户自行决定变量的对齐byte, 比如一些处理器架构要求向量表需要按照规定的对齐地址放置

此设置可覆盖类型定义的默认对齐方式

定义一个32位变量

```cpp
uint32_t var_in_8bytes __attribute__((aligned(8)));
```

- section

section控制变量或函数在编译时的段名。在嵌入式软件开发时用的非常多，比如有外扩Flash或RAM时，需要将变量或函数放置到外扩存储空间，可以在链接脚本中指定段名来操作。在使用MPU(存储保护)的MCU编程时，需要对存储器划分区域，将变量或代码放置到对应的区域，通常也是通过段操作来实现

- `unused`

意味着函数或变量很可能未被使用，编译器不会针对这个函数产生警告，可以将其声明在在函数实现中没有使用过的参数上，例如：

int main(int argc __attribute__((unused)), char **argv)

{ ...}

- `used`

此属性附加到具有静态存储的变量，意味着即使该变量看起来没有被引用，也必须保留该变量。否则在链接的时候链接器发现某个变量未被引用，会将此变量优化掉。

- `weak`

若两个或两个以上全局符号名字一样，而其中之一声明为weak symbol（弱符号），则这些全局符号不会引发重定义错误。当普通符号存在时，链接器会忽略掉弱符号，如果不存在普通符号，则使用弱符号。

- `visibility`

> `default`
>
> 符号具有默认的可见性
> 在共享库中，符号通常是外部可见的（即其他模块可以访问）
> 默认行为(例外如: `static` `inline` `weak` `section("name")`)
>
> `hidden`
>
> 符号对其他模块不可见
> 其他模块无法链接到这些符号
> 适用于内部实现细节，不需要暴露给外部用户
>
> `protected`
>
> 符号对其他模块可见，但优先使用本地定义的符号
> 如果其他模块定义了同名符号，本地定义的符号会被优先使用
> 这种可见性较少使用，通常用于特定的链接需求
>
> `internal`
>
> 符号仅在当前模块内可见
> 其他模块无法访问这些符号
> 类似于 static 关键字的作用，但适用于共享库中的符号

- `dllexport`

外部通过`GetProcAddress`主动调用dll内函数时, 对应函数的 __必要__ 属性
> [!NOTE]
> `__stdcall` / `__attribute__((__stdcall__))` 是 __充分__ 条件
>