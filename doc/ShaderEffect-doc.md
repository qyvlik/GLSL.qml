# ShaderEffect 

对矩形区域应用自定义着色器。

## 详细描述

`ShaderEffect` 可以对一个矩形区域应用自定义 OpenGL 的顶点和片段着色器。允许你在 QML 中实现阴影，模糊，彩色斑块。

The `ShaderEffect` type applies a custom OpenGL vertex and fragment shader to a rectangle. It allows you to write effects such as drop shadow, blur, colorize and page curl directly in QML.

顶点着色器可以接受两种类似的输入：uniform variables 和 attributes。有如下预定义属性：

There are two types of input to the vertexShader: uniform variables and attributes. Some are predefined:

- `uniform mat4 qt_Matrix` 提供了一个从根项目到 `ShaderEffect` 的变换矩阵。

- `uniform float qt_Opacity` 提供项目的透明度。

- `attribute vec4 qt_Vertex` 提供顶点坐标，左上角为 (0,0)，后下角为 (width,height)。

- `attribute vec2 qt_MultiTexCoord0` 纹理坐标，左上角是 (0,0)，右下角为 (1,1) 等等。

- `uniform mat4 qt_Matrix` - combined transformation matrix, the product of the matrices from the root item to this ShaderEffect, and an orthogonal projection.

- `uniform float qt_Opacity` - combined opacity, the product of the opacities from the root item to this ShaderEffect.

- `attribute vec4 qt_Vertex` - vertex position, the top-left vertex has position (0, 0), the bottom-right (width, height).

- `attribute vec2 qt_MultiTexCoord0` - texture coordinate, the top-left coordinate is (0, 0), the bottom-right (1, 1). If supportsAtlasTextures is true, coordinates will be based on position in the atlas instead.


 此外，任何 QML 属性都可以通过 GLSL 的 uniform 变量进行映射到 GLSL。如下是 QML（Qt C++） 属性类型到 GLSL 映射表：

In addition, any property that can be mapped to an OpenGL Shading Language (GLSL) type is available as a uniform variable. The following list shows how properties are mapped to GLSL uniform variables:



- bool, int, qreal -> bool, int, float - If the type in the shader is not the same as in QML, the value is converted automatically.

- QColor -> vec4 - When colors are passed to the shader, they are first premultiplied. Thus Qt.rgba(0.2, 0.6, 1.0, 0.5) becomes vec4(0.1, 0.3, 0.5, 0.5) in the shader, for example.

- QRect, QRectF -> vec4 - Qt.rect(x, y, w, h) becomes vec4(x, y, w, h) in the shader.

- QPoint, QPointF, QSize, QSizeF -> vec2

- QVector3D -> vec3

- QVector4D -> vec4

- QTransform -> mat3

- QMatrix4x4 -> mat4

- QQuaternion -> vec4, scalar value is w.

- Image, ShaderEffectSource -> sampler2D - Origin is in the top-left corner, and the color values are premultiplied.

---

[Qt5官方demo解析集12——Qt Quick Particles Examples - CustomParticles](http://blog.csdn.net/cloud_castle/article/details/34950673)