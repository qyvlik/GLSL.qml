//! work in qml ShaderEffect

#ifdef GL_ES
varying lowp vec4 v_color;
#else
varying vec4 v_color;
#endif

void main()
{
    gl_FragColor = v_color;
}
