//! work in qml ShaderEffect

attribute vec4 qt_Vertex;
uniform mat4 qt_Matrix;

uniform vec4 a_color;

#ifdef GL_ES
varying lowp vec4 v_color;
#else
varying vec4 v_color;
#endif

void main()
{
    // 位变换
    gl_Position = qt_Matrix * qt_Vertex;

    v_color = a_color;
}
