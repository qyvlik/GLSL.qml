//! work in qml ShaderEffect

attribute vec4 qt_Vertex;
uniform mat4 qt_Matrix;
attribute highp vec2 qt_MultiTexCoord0;

uniform vec4 a_color;

#ifdef GL_ES
varying mediump vec2 v_texCoord;
varying lowp vec4 v_color;
#else
varying vec2 v_texCoord;
varying vec4 v_color;
#endif

void main()
{
    v_texCoord = qt_MultiTexCoord0;
    v_color = a_color;
    // 位变换
    gl_Position = qt_Matrix * qt_Vertex;
}
