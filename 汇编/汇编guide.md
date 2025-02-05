# 汇编

> DEBUG
>
> - R: 查看更改cpu寄存器内容
>
> > ```assembly debug
> > R ax
> > FF
> > ```
> >
> > 意思等于ax = 00FF
>
> - D: 查看内存中内容
> - E: 改写内存中内容
> - U: 将内存中机器指令翻译成汇编指令
> - T: 执行一条机器指令
> >
> > ```assembly debug
> > R cs
> > 1000
> > R ip
> > 0000
> > T
> > ```
> >
> > 使用R将CS:IP指向指令起始, 按T开始执行
> >
> - A: 以汇编格式在内存中写入一条指令
>
> > ```assembly debug
> > A 1000:0000
> > ```
> >
> > 从1000:0000开始写入指令, 例如:
> >
> > ```cmd
> > 1000:0000 mov ax, 1000
> > 1000:0003 mov ds, ax
> > 1000:0005 mov ax, [0]
> > 1000:0008 mov bx, [1]
> > ```

## x8086

### 寄存器

- AX (eg: 00FF)

> - AL (00**FF**)
> - AH (**00**FF)
>
> > L (Low), H (High)

- BX

- CX

> loop 指令会将 CX 减 1，如果结果不为 0，则跳转到指定的标签处继续执行

- DX

SI, DI, BP, SP

### 段寄存器 segment

不能直接赋值

- CS (Code Segment)

> CS:IP (CS指向代码段，IP指向指令指针), 指向指令的起始地址, 以便写入或执行
>
> ```assembly debug
> mov cs, ax
> ```

- DS (Data Segment)

> DS:[X] 指向数据起始地址, 以便写入或读取
>
> ```assembly debug
> mov ds, ax
> mov ax, [0]
> ```
>
> 然而编译器会把 [0] 理解为值 0 而不是地址 ds:[0], 因此需要间接指定或显式指定
>
> ```assembly
> mov ds, ax
> mov ax, ds:[0]
>
> 或
>
> mov ds, ax
> mov bx, 0
> mov ax, [bx]
> ```

- ES (Extra Segment)

- SS (Stack Segment)

> SS:SP, SP指向栈顶地址, 以便写入(push)或读取(pop)

### 指令

- MOV 赋值
- ADD
- SUB

- PUSH
- POP

- JMP
- LOOP

- INC
- INT

- DW (define word)

- AND
- OR
- XOR


### 标志位

- CF (Carry Flag)
- PF (Parity Flag)
- AF (Auxiliary Carry Flag)
- ZF (Zero Flag)
