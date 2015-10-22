# GLSL 语句

大体上和 `C` 语言差不多。

## 选择

着色语言的条件控制流使用 ``if`` 或 `if-else`：

```
if (bool-expression)
    true-statement
```

或者

```
if (bool-expression)
    true-statement
else
    false-statement
```

## 迭代

while和do循环规范如下：

```
for (for-init-statement; condition(opt); expression)
    statement-no-new-scope
```

```
while (condition)
    statement-no-new-scope
```

```
do
    statement
while (expression)
```

`for` 循环的 `condition` 语句是可选的，没有该语句的话默认为 `true`。

## 跳跃语句

```
continue;
break;
return;
return expression;
discard; // in the fragment shader language only
```

没有 `goto` 语句。

`continue` 只能用在循环中，程序执行到 `continue` 的时候会自动舍弃后面的操作而进入下一次循环。

`break` 也只能用在循环中，作用是直接跳出其所在的那层循环。

`discard` 关键字只能使用在片元着色器中。它用在片元着色器中来放弃对当前片元的操作。这个关键字导致片元直接被忽略并且不会更新任何缓冲区。最典型的用法是在一个条件语句中，如：

```
if(indensity < 0.0)
    discard;
```

片元着色器可能会测试一个片元的 `alpha` 值，并根据测试忽视片元。

需要注意的是着色器执行后会出现覆盖测试（coverage test），覆盖测试可以改变 `alpha` 的值。

`return` 语句直接导致退出当前函数。

---

[GLSE 语句和结构体](http://blog.csdn.net/hgl868/article/details/7876225)