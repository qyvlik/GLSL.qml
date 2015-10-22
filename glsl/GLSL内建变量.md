# GLSL 内建变量

有些 OpenGL ES 操作在顶点处理器和片元处理器之间有特定的功能，有些在片元处理器之后又特定的功能，着色器通过内建变量同这些固定功能进行通信。

在 OpenGL ES 中，内建特殊变量部分来自顶点着色器的输出变量，部分来自于片元着色器的输入变量和输出变量。不同于用户定义的 `varying` 变量，内建特殊变量不用在顶点语言和片元语言之间保持严格的一对一对应。相反，两个语言各有自己的一套变量集合。

## 顶点着色器特定变量

变量 `gl_Position` 仅可用在顶点语言中，并且用来写入奇次顶点位置。所有符合语法规则的顶点着色器都应该给该变量写入一个值。可以在着色器运行期间的任何时候给它写入新值，也可以随时读取它的值。这个值可以用在顶点处理开始之后的图元装配，剪裁，剔除和其他操作图元的固定功能上。如果检测到 `gl_Position` 没有被写入，或者在写入前被读取，编译器会产生一个诊断信息，但是并不是所有的情况都能检测的到。如果顶点着色器已经执行，但是并没有写入 `gl_Position`，那么 `gl_Position` 的值是未定义的。

`gl_PointSize` 也是只能用在顶点语言中，顶点着色器用它来写入将要光栅化的点的尺寸，单位是像素。

用来与特定功能通信的内建顶点着色器变量本质上是按照如下方式声明的：

```
highp vec4 gl_Position; // should be written to
mediump float gl_PointSize; // may be written to
```

如果这些值没有被写入过，那么它们的值是未定义的。着色器在给它们写入值之后也可以将它们的值读取出来以重新获取写入的值。如果被多次写入过值，最近写入的值有效。

这些内建变量具有全局作用域。

## 片元着色器特定变量

片元着色器的输出值由 OpenGL ES 管线的后端固定函数进行处理。片元着色器使用 `gl_FragColor` 和 `gl_FragData` 内建变量向 OpenGL ES 管线输出值，除非关键字 `discard` 被执行。

对于片元着色器来说，向 `gl_FragColor` 和 `gl_FragData` 写入值不是必要的。许多算法，如阴影体，包含未被写入颜色值的渲染通道。

在片元着色器中这些变量可能会被写入多次。如果这样的话，在后续的固定功能管线中使用的就是最后一次被赋的值。这些变量可以在写入值之后随时将值读取出来。如果在读取之前没有被写入值的话，那么将得到一个未定义的值。

写入 `gl_FragColor` 是为了指明随后固定功能管线要用到的片元颜色值。如果后续固定功能管线要使用这个片元颜色值，但是着色器又没有给它写入值，那么片元颜色值将是一个未定义的值。

`gl_FragData` 变量值是一个数组。向 `gl_FragData[n]` 写入数据时为了指明后续固定功能管线要使用的片元数据 n。如果后续固定功能管线要使用这个片元数据，但是着色器又没有给它写入值，那么片元数据将是一个未定义的值。

如果着色器静态地给 `gl_FragColor` 赋值，那么它就不会给 `gl_FragData` 的任何元素赋值。如果着色器静态地给 `gl_FragData` 的任何元素赋值，那么它就不会给 `gl_FragColor` 赋值。也就是说，着色器不会同时给 `gl_FragColor` 和 `gl_FragData` 变量都赋值。

如果着色器包含对变量 x 的静态赋值，在预处理之后，着色器包含一个向 x 写入值的语句，不论如何，运行时控制流都会执行该语句。

如果着色器执行了 `discard` 关键字，片元将被直接扔掉，`gl_FragColor` 和 `gl_FragData` 的值也会变得毫不相干。

`gl_FragCoord` 是片元着色器中的只读变量，它保存了片元相对窗口的坐标位置：`x`，`y`，`z`，`1/w`。这个值是顶点处理产生片元后固定功能内插图元的结果。组件 `z` 是用于表示片元深度的深度值。

`gl_FrontFacing` 是片元着色器的内建只读变量，如果片元属于一个当前图元，那么这个值就为 `true`。这个变量的一个用法就是来模拟两面光，通过选择由顶点着色器计算的两个颜色中的一个。

`gl_PointCoord` 是片元着色器的内建只读变量，它的值是当前片元所在点图元的二维坐标。点的范围是 0.0 到 1.0。如果当前的图元不是一个点，那么从 `gl_PointCoord` 读出的值是未定义的。

片元着色器的内建变量本质上的声明形式如下：

```
mediump vec4 gl_FragCoord;
bool gl_FrontFacing;
mediump vec4 gl_FragColor;
mediump vec4 gl_FragData[gl_MaxDrawBuffers];
mediump vec2 gl_PointCoord;
```

它们的行为并不像没有存储修饰符的变量；这些内建变量拥有全局作用域。

## 顶点着色器内建属性

OpenGL ES 中没有内建属性值。

## 内建常量

顶点和片元着色器提供了如下内建常量：

```
//
// 相关常量实现。下面的示例值是这些最大值所允许的最小值。
//
const mediump int gl_MaxVertexAttribs = 8;
const mediump int gl_MaxVertexUniformVectors = 128;
const mediump int gl_MaxVaryingVectors = 8;
const mediump int gl_MaxVertexTextureImageUnits = 0;
const mediump int gl_MaxCombinedTextureImageUnits = 8;
const mediump int gl_MaxTextureImageUnits = 8;
const mediump int gl_MaxFragmentUniformVectors = 16;
const mediump int gl_MaxDrawBuffers = 1;
```

## 内建 uniform 状态

为了方便访问 OpenGL ES 处理状态，OpenGL ES 定义了以下 `uniform` 变量。如果片言语言的某个实现不支持 `highp`，并且罗列的状态又是 `highp`，那么片元语言将其作为 `mediump` 处理。

```
//
// 窗口坐标的深度范围
//
struct gl_DepthRangeParameters {
    highp float near;             // n
    highp float far;              // f
    highp float diff;             // f - n
};
uniform gl_DepthRangeParameters gl_DepthRange;
```

---

[GLSL 内建变量](http://blog.csdn.net/hgl868/article/details/7876246)