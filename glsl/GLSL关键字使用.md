# GLSL 关键字使用

## varying

修饰符只能用在 `float`，`vec2`，`vec3`，`vec4`，`mat2`，`mat3`，`mat4` 和包含这些类型元素的数组上，不能用于修饰结构体。

## uniform

修饰符可以和任意基本数据类型一起使用，或者包含基本数据类型元素的数组和结构体。

## attribute

修饰符只能修饰 `float`，`vec2`，`vec3`，`vec4`，`mat2`，`mat3`，`mat4`。`attribute` 变量不能声明为数组或结构体。

## static use

在 OpenGL ES 中有一个术语叫静态使用（static use），什么叫静态使用呢？

在写代码中，对于一个变量可能具有以下三种情况：

1. 不声明，不引用（No Reference），如一个空语句：

    ```
    ;
    ```

2. 声明，但是不使用（Declared， NO used）

    ```
    attribute vec4 position;
    ```

3. 声明，并使用（static use）

    ```
    attribute vec4 position;
    ...
    gl_Position = position;                            // 静态使用，static use
    ```

因此，在官方文档中，对于静态变量的定义为：在着色器中预处理之后至少有一个语句在使用声明过的变量，哪怕这一句代码从来没有真正执行过。

## 着色器的预处理过程

着色器的预处理过程是指在着色代码真正开始在内存中执行之前的整个过程。那么预处理过程包含哪些工作呢？

1. 创建一个空着色器

2. 链接源代码字符串

3. 将源代码字符串替换空着色器中的源码

4. 编译着色器（顶点、片元着色器）

5. 创建一个空的可执行程序

6. 链接着色器

以上即为OpenGL ES的预处理过程。

---

[OpenGL ES着色语言关键字使用](http://blog.csdn.net/hgl868/article/details/7846316)
