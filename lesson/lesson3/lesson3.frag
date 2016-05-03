//! work in qml ShaderEffect
uniform sampler2D src;      // 默认的

#ifdef GL_ES
varying mediump vec2 v_texCoord;
#else
varying vec2 v_texCoord;
#endif


void main()
{
    // 纹理采样器
    gl_FragColor = texture2D(src, v_texCoord);
}
