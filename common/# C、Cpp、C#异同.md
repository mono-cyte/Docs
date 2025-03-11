# C、Cpp、C#异同

## C & Cpp

## Cpp & C#

### 命名规范

#### Cpp

除main函数外，无特殊要求：`int main(int argc, char* argv[]){}`

> [!NOTE]
>
> **Cpp的main函数一定不是static**，因为它并不属于某个类，而是一个独立于类的全局函数

#### C#

函数|变量名**首字母大写**或为**非小写字母**：`static void Main(string[] args){}`

> [!NOTE]
>
> **C#的 Main 函数一定是 static**，因为其属于某个类

### 数据类型

#### 数组

各论

##### Array in Cpp

`int array [];` & `int array [9];`

> [!WARNING]
>
> ~~int[] array;~~	"**[]**"在名称**前**会导致报错



##### Array in C#

`int[] array;`

> [!WARNING]
>
> ~~int array []; & int array [9];~~ "**[]**"在名称**后**会导致报错



### 内存管理

#### 指针

##### pointer in Cpp

有指针，需要手动清理（如果使用非智能指针）

##### no pointer in C#

无指针，有Garbage Collection（GC）

#### 引用

### 命名空间

#### namespace in Cpp

全局使用：`using namespace namespaceName;`

局部使用：`namespaceName::foo`

#### namespace in C#

全局使用：`using namespaceName;`

局部使用：`namespaceName.foo`



### 多文件联动

##### Cpp：

预处理链接指令 ` #include "..." `

##### C#：

同一项目下基于命名空间管理，内部只需用相同命名空间

同一解决方案下在项目 ”依赖项|引用“ 处，右键添加引用

### Class

#### 权限修饰符

##### access modifiers in Cpp

继承方式必须被权限修饰符修饰：

```cpp
class C{};
class Cpp : public C{};
```

类本身不能被权限修饰符修饰:

```cpp
class Cpp{
private:
 int value_1;
protected:
 int value_2;
public:
 int value_3;
};
```

类成员可以被权限修饰符修饰：**权限修饰符以标签的形式存在，标记此修饰符以下的区域，直到出现另一个修饰符**

#### access modifiers in C#

继承方式不被权限修饰符修饰:

```c#
class C{};
class Cpp : C{};
```

类本身可以被权限修饰符修饰(默认为internal)

```c#
public class CS{

private int Value_1;

protected int Value_2;

public int Value_3;
};
```

类成员可以被权限修饰符修饰：**一个权限修饰符只能标记一个成员**

> [!IMPORTANT]
>
> **C#特有权限修饰符——internal：表示只能在本项目中访问**

#### 属性

##### Properties of class in Cpp

没有该特性

可通过私有成员与公有getter、setter方法实现类似效果：

```cpp
class Cpp{
private:
	int value;
public:
	int getter(){
		return value;
	}
	void setter(int num){
		value = num;
	}
};
```



##### Properties of class in C#

C#独有特性

get用于返回值

set用于设置值，其有**隐含参数value**

```c#
class CS{
private int _value;
public int Value{
	get{
		return _value;
	}
	set{
		if(value > 0){
			_value = value;
		}
	}
	}
};
```

#### 继承

##### Inheritance in Cpp

支持**类的多继承**

##### Inheritance in C#

不支持类的多继承，只能**单继承**

支持使用**接口**的多继承

#### overwrite & override

Cpp和C#：仅当父类为虚函数时，才能在子类使用override关键字。
> [!NOTE]
>
> Cpp中的override更多为了检查基类虚函数和派生类中重写函数的签名不匹配问题，不影响实际效果（Cpp默认覆写基类的虚函数）
>
> C#中的override会直接决定派生类中重写函数对基类虚函数的覆写关系（C#默认不覆写基类的虚函数）



##### Virtual Function in Cpp

###### 1. 父类非虚函数

   **父类类型可调用父类函数**

   **子类类型可调用子类函数**

```
   class C{
   public:
       void say(){
           cout << "This is C\n";
       }
   };
   
   class Cpp : public C{
   public:
       void say (){
           cout << "This is Cpp\n";
       }
   };
   
   int main() {
       C* p = new Cpp();
       ((C*)p)->say(); //This is C
       ((Cpp*)p)->say(); //This is Cpp
       return 0;
   }
```

###### 2. 父类虚函数

   **加override与否效果一样**

   **父类函数被覆写**

   **父、子类类型均只能调用子类函数**

   - 无override修饰：

   ```
   class C{
   public:
       virtual void say(){
           cout << "This is C\n";
       }
   };
   
   class Cpp : public C{
   public:
       void say (){
           cout << "This is Cpp\n";
       }
   };
   
   int main() {
       C* p = new Cpp();
       ((C*)p)->say(); //This is Cpp
       ((Cpp*)p)->say(); //This is Cpp
       return 0;
   }
   ```
   -  有override修饰：

   ```
   class C{
   public:
       virtual void say(){
           cout << "This is C\n";
       }
   };
   
   class Cpp : public C{
   public:
       void say () override {
           cout << "This is Cpp\n";
       }
   };
   
   int main() {
       C* p = new Cpp();
       ((C*)p)->say(); //This is Cpp
       ((Cpp*)p)->say(); //This is Cpp
       return 0;
   }
   ```

###### 3. 父类纯虚函数

   **加override与否效果一样**，参考上文Cpp中override的写法，此处不再重复

   **有纯虚函数则为抽象类，不可实例化。**

   **纯虚函数父类不可实现，子类必须实现。**

   **父、子类类型均只能调用子类函数**

   ```
   class C{
   public:
       virtual void say() = 0;
   };
   
   class Cpp : public C{
   public:
       void say (){
           cout << "This is Cpp\n";
       }
   };
   
   int main() {
       C* p = new Cpp();
       ((C*)p)->say(); //This is Cpp
       ((Cpp*)p)->say(); //This is Cpp
       return 0;
   }
   ```

##### Abstract Method (Equivalent to Pure Virtual Function) in C#

###### 1. 父类非虚函数

   **父类类型可调用父类函数**

   **子类类型可调用子类函数**

   ```
   public class C{
       public void say(){
           Console.WriteLine("This is C");
       }
   };
   
   public class Cpp : C{
       public void say (){
           Console.WriteLine("This is Cpp");
       }
   };
   
   class Program{ 
       static void Main(string[] args){
           C p = new Cpp(); 
           ((C)p).say(); //This is C
           ((Cpp)p).say(); //This is Cpp
       }
   }
   ```

###### 2. 父类虚函数

   **加override结果改变**

   

- 无override修饰：

   **父类函数未被覆写**

   **父类类型可调用父类函数**

   **子类类型可调用子类函数**

   ```
   public class C{
       public virtual void say(){
           Console.WriteLine("This is C");
       }
   };
   
   public class Cpp : C{
       public void say (){
           Console.WriteLine("This is Cpp");
       }
   };
   
   class Program{ 
       static void Main(string[] args){
           C p = new Cpp(); 
           ((C)p).say(); //This is C
           ((Cpp)p).say(); //This is Cpp
       }
   }
   ```
- 有override修饰：

   **父类函数被覆写**

   **父、子类类型均只能调用子类函数**

   ```
   public class C{
       public virtual void say(){
           Console.WriteLine("This is C");
       }
   };
   
   public class Cpp : C{
       public override void say (){
           Console.WriteLine("This is Cpp");
       }
   };
   
   class Program{ 
       static void Main(string[] args){
           C p = new Cpp(); 
           ((C)p).say(); //This is Cpp
           ((Cpp)p).say(); //This is Cpp
       }
   }
   ```

###### 3. 父类抽象（纯虚）函数

   **有抽象函数则为抽象类，不可实例化**

   **抽象函数父类不可实现，子类必须覆写，因此必须有override修饰，否则报错**

   **父、子类类型均只能调用子类函数**

``````
abstract class C{
    public abstract void say();
};

class Cpp : C{
    public override void say(){
        Console.WriteLine("This is Cpp");
    }
};
public class Program{ 
    static void Main(string[] args){
        C p = new Cpp(); 
        ((C)p).say(); //This is Cpp
        ((Cpp)p).say(); //This is Cpp
    }
}
``````

#### C#独有特性

##### 部分类：partial

partial：局部类型。

允许我们将一个类、结构或接口分成多个部分，甚至在多个的*.cs*文件中实现。*C#*编译器在编译的时候仍会将各个部分的局部类型合并成一个完整的类。

```
partial class CS{
    private string word = "I am CS";
}

partial class CS{
    public void say(){
        Console.WriteLine(word);
    }
}

public class Program{ 
    static void Main(string[] args){
        CS cs = new CS();
        cs.say(); // I am CS
    }
}
```

##### 密封类：sealed

此类不可被继承

##### 接口：interface

可以认为是特殊的抽象类

内部成员强制为public，不可修饰，不允许实现

类继承接口对应的方法必须为public

``````
public interface Python{ 
    public void say();
}

public class Cpp : Python{
    public void say(){
		Console.WriteLine("I am Python");
	}
}
``````
