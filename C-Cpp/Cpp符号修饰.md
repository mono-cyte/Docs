# C++ 符号修饰

## g++/clang++ 符号修饰

`_Z` 作为任意函数的前缀

`void foo()`: `_Z3foov`

| 函数前缀 | 函数名称长度 | 函数名称 | 参数    |
| -------- | ------------ | -------- | ------- |
| _Z       | 3            | foo      | v(void) |

### 模块

`N` 表示命名空间或类名, 后跟随的名称长度和名称

`void MyClass::foo()`: `_ZN7MyClass3fooEv`

| 函数前缀 | 模块名起点 | 模块名长度 | 模块名  | 函数名称长度 | 函数名称 | 模块名终点 | 参数    |
| -------- | ---------- | ---------- | ------- | ------------ | -------- | ---------- | ------- |
| _Z       | N          | 7          | MyClass | 3            | foo      | E          | v(void) |

模块可存在多层:

`int outter::inner::foo();`: `_ZN6outter5inner3fooEv`

| 函数前缀 | 模块名起点 | 模块名长度 | 模块名 | 模块名长度 | 模块名 | 函数名称长度 | 函数名称 | 模块名终点 | 参数    |
| -------- | ---------- | ---------- | ------ | ---------- | ------ | ------------ | -------- | ---------- | ------- |
| _Z       | N          | 6          | outter | 5          | inner  | 4            | foo      | E          | v(void) |

### 参数

| 参数类型 | symbol | pointer | unsigned |
| -------- | ------ | ------- | -------- |
| void     | v      | Pv      | ~        |
| int      | i      | Pi      | j        |
| char     | c      | Pc      | h        |
| short    | s      | Ps      | t        |
| long     | l      | Pl      | m        |
| float    | f      | Pf      | ~        |
| double   | d      | Pd      | ~        |
| wchar_t  | w      | Pw      | ~        |

#### 类参数

##### 单种类

- 类唯一

`void foo(abc s)`: `_Z3foo3abc`

| 参数     |             |
| -------- | ----------- |
| 类名长度 | 类名/param1 |
| 3        | abc         |

- 类重复

`void foo(abc param1, abc param2, abc param3)`: `_Z3foo3abcS_S_`

| 参数     |             |               |               |
| -------- | ----------- | ------------- | ------------- |
| 类名长度 | 类名/param1 | 占位符/param2 | 占位符/param3 |
| 3        | abc         | S_ (abc)      | S_ (abc)      |

`void foo(abc param1, int param2, abc param3)`: `_Z3foo3abciS_`

| 参数     |             |        |               |
| -------- | ----------- | ------ | ------------- |
| 类名长度 | 类名/param1 | param2 | 占位符/param3 |
| 3        | abc         | i      | S_ (abc)      |

> `S<n>_` 为后续重复类的占位符

##### 多种类

- 类唯一

`void foo(c1_ param1, c2_ param2, c3_ param3)` `_Z3foo3c1_3c2_3c3_`

| 参数     |             |          |             |          |             |
| -------- | ----------- | -------- | ----------- | -------- | ----------- |
| 类名长度 | 类名/param1 | 类名长度 | 类名/param2 | 类名长度 | 类名/param3 |
| 3        | c1_         | 3        | c2_         | 3        | c3_         |

- 类重复

`void foo(c1_ param1, c2_ param2, c3_ param3, c1_ param4, c2_ param5, c3_ param6)`: `_Z3foo3c1_3c2_3c3_S_S0_S1_`

- 部分类唯一

`void foo(c1_ param1, c2_ param2, c3_ param3, c1_ param4, c3_ param6)` `_Z3foo3c1_3c2_3c3_S_S1_`

`void foo(c2_ param2, c1_ param1, c3_ param3, c1_ param4, c3_ param6)`: `_Z3foo3c2_3c1_3c3_S0_S1_`

> `S<n>_` 为后续重复类的占位符, 规律为 `S_`, `S0_`, `S1_` ...

##### 模块名修饰

`void foo(outter::inner::abc param)`: `_Z3fooN6outter5inner3abcE`

| 参数       |            |        |            |        |          |            |            |
| ---------- | ---------- | ------ | ---------- | ------ | -------- | ---------- | ---------- |
| 模块名起点 | 模块名长度 | 模块名 | 模块名长度 | 模块名 | 类名长度 | 类名/param | 模块名终点 |
| N          | 6          | outter | 5          | inner  | 3        | abc        | E          |

- 模块名交错

`void foo(outter::inner::abc i, outter::efg j)`: `_Z3fooN6outter5inner3abcENS_3efgE`

| 参数       |            |        |            |        |          |        |            |            |                          |          |        |            |
| ---------- | ---------- | ------ | ---------- | ------ | -------- | ------ | ---------- | ---------- | ------------------------ | -------- | ------ | ---------- |
| 模块名起点 | 模块名长度 | 模块名 | 模块名长度 | 模块名 | 类名长度 | 类名/i | 模块名终点 | 模块名起点 | 模块名长度+模块名/占位符 | 类名长度 | 类名/j | 模块名终点 |
| N          | 6          | outter | 5          | inner  | 3        | abc    | E          | N          | S_ (outer)               | 3        | efg    | E          |

`void foo(outter::efg j, outter::inner::abc i)`: `_Z3fooN6outter3efgENS_5inner3abcE`

| 参数       |            |        |          |        |            |            |                          |            |        |          |        |            |
| ---------- | ---------- | ------ | -------- | ------ | ---------- | ---------- | ------------------------ | ---------- | ------ | -------- | ------ | ---------- |
| 模块名起点 | 模块名长度 | 模块名 | 类名长度 | 类名/j | 模块名终点 | 模块名起点 | 模块名长度+模块名/占位符 | 模块名长度 | 模块名 | 类名长度 | 类名/i | 模块名终点 |
| N          | 6          | outter | 3        | efg    | E          | N          | S_                       | 5          | inner  | 3        | abc    | E          |

> `S<n>_` 为后续重复模块名的占位符

##### 模板类参数

`void foo(Class<int> param)`: `_Z3foo5ClassIiE`

| 参数     |       |              |          |              |
| -------- | ----- | ------------ | -------- | ------------ |
| 类名长度 | 类名  | 模板参数起点 | 模板参数 | 模板参数终点 |
| 5        | Class | I            | i        | E            |

`void foo(Class<int> param, int i)`: `_Z3foo5ClassIiEi`

`void foo(int i, Class<int> param)`: `_Z3fooi5ClassIiE`

`void foo(Class<int, char, long> param)`: `_Z3foo5ClassIiclE`

`void foo(outter::inner::Class<int, char> param)`: `_Z3fooN6outter5inner5ClassIicEE`

| 参数     |            |            |        |            |        |          |       |              |          |              |            |
| -------- | ---------- | ---------- | ------ | ---------- | ------ | -------- | ----- | ------------ | -------- | ------------ | ---------- |
| 类名长度 | 模块名起点 | 模块名长度 | 模块名 | 模块名长度 | 模块名 | 类名长度 | 类名  | 模板参数起点 | 模板参数 | 模板参数终点 | 模块名终点 |
| 5        | N          | 6          | outter | 5          | inner  | 5        | Class | I            | ic       | E            | E          |

`void foo(Class<int> param1, Class<char> param2)`: `_Z3foo5ClassIiES_IcE`

`S_`: 同类型模板类

### 总结

首尾相应

- `N` - `E` (模块名)
- `I` - `E` (模板参数)

占位符

- `S<n>_` 可代表 类名长度+类名 / 模块名长度+模块名
- 规律: `S_`, `S0_`, `S1_` ...

`void foo(std::string str)`: `_Z3fooNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE`

```analysis
_Z:
	(3) foo
	N{
		St3__1
		(12) basic_string
		I{
			c (char)
			N{
				S_ (St3__1)
				(11) char_traits
					I{
						c (char)
					}E
				}E
			N{
				S_ (St3__1)
				(9) allocator
					I{
						c (char)
				}E
			}E
		}E
	}E
```

`std::string` = `St3__1::basic_string<char, st3__1::char_traits<char>, st3__1::allocator<char>>`
