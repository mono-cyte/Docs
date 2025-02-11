# C#调用C++的方式

## P/Invoke

> [!IMPORTANT]
>
> 导出函数的方法



### 1. 导出方法: "__declspec(dllexport)"

 **`__declspec`** 关键字用于指定存储类信息的扩展特性，该关键字指定 class 的实例将与 Microsoft 专用存储类特性一起存储。 其他存储类修饰符的示例包括 **`static`** 和 **`extern`** 关键字。 但是，这些关键字是 C 和 C++ 语言的 ANSI 规范的一部分，并且本身不包含在扩展特性语法中。 扩展特性语法简化并标准化了 Microsoft 专用的 C 和 C ++ 语言扩展。

C++动态库内容：

```
extern "C" __declspec(dllexport) int sum(int a, int b) {
    return a + b;
}
```

> [!NOTE]
>
> extern: 声明一个变量，使得该变量可以链接调用**来自其他文件**的变量，在编译的链接阶段产生作用。
>
> C++ 支持函数重载，但在输出时，C++ 编译器会为每个重载的函数生成一个唯一的名称（称为 "name mangling"），且无从得知。
>
> extern "C": 按照C语言的方式去编译, 即用extern“C”修饰过后，函数名不变，函数不可重载，从而为外部调用提供名称信息。



### 2. 导入方法: "[DllImport("xxx.dll")]"

C#语法：**特性（Attribute）**是用于在运行时传递程序中各种元素（比如类、方法、结构、枚举、组件等）的行为信息的声明性标签。您可以通过使用特性向程序添加声明性信息。一个声明性标签是通过放置在它所应用的元素前面的方括号（[ ]）来描述的。

特性（Attribute）用于添加元数据，如编译器指令和注释、描述、方法、类等其他信息。.Net 框架提供了两种类型的特性：*预定义*特性和*自定义*特性。

C#调用处：

```
[DllImport("xxx.dll")]
static extern int sum(int a, int b);
```

**C#项目的依赖项需要设置，引用**对应xxx.dll的动态库

## C++/CLI

> [!IMPORTANT]
>
> 导出class的方法



### 1. 导出方法:  定义一个导出的 C++ 类

在 C++/CLI 中，`ref class` 用于定义托管类，而不是普通的 C++ 类。托管类是在 .NET 框架中运行的类，它们通过垃圾回收（Garbage Collection）进行内存管理。这些类允许你在 C++ 中使用 .NET 的功能，并与 C# 和其他托管语言互操作。

C++动态库内容：

```
public ref class Class1
{
public:
    void callClass() {
       std::cout << "Class1 Actived";
    }
};
```

> [!NOTE]
>
> public：保证文件外能访问类的定义，否则报错

### 2. 导入方法: 

C#调用处：

```
Class1 c1 = new Class1();
c1.callClass();
```

**C#项目的依赖项需要设置，引用**对应xxx.dll的动态库