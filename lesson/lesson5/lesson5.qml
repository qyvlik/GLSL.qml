/*
  使用纹理
*/
import QtQuick 2.0

ShaderEffect {

    width: 360
    height: 640

    // 一般是会把图片中的白色替换成 绿色
    // 其他颜色为黑色。。。
    // 纹理与色值混合

    property color a_color: "green"
    // 纹理
    property var src: ShaderEffectSource {
        sourceItem: Image {
            source: "./image.jpg"
        }
    }


    fragmentShader: "
        uniform sampler2D src;      // 默认的

        #ifdef GL_ES
        varying mediump vec2 v_texCoord;
        varying lowp vec4 v_color;
        #else
        varying vec2 v_texCoord;
        varying vec4 v_color;
        #endif


        void main()
        {
            // 纹理采样器
            gl_FragColor = texture2D(src, v_texCoord) * v_color;
        }
    "

    vertexShader: "
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
    "

}
