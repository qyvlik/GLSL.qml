//! work in qml ShaderEffect

attribute vec4 qt_Vertex;
uniform mat4 qt_Matrix;
attribute highp vec2 qt_MultiTexCoord0;


#ifdef GL_ES
varying mediump vec2 v_texCoord;
#else
varying vec2 v_texCoord;
#endif

void main()
{
    v_texCoord = qt_MultiTexCoord0;
    // 位变换
    gl_Position = qt_Matrix * qt_Vertex;
}
