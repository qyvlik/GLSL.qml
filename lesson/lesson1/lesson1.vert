//! work in qml ShaderEffect

attribute highp vec4 qt_Vertex;
uniform highp mat4 qt_Matrix;

void main()
{
    // 投影变换，获取到屏幕上真实的影像
    gl_Position = qt_Matrix * qt_Vertex;
}
