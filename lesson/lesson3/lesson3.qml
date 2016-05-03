/*
  使用纹理
*/
import QtQuick 2.0

ShaderEffect {

    width: 360
    height: 640

    // 纹理
    property var src: ShaderEffectSource {
        sourceItem: Item {
            width: 100
            height: 100
            Row {
                anchors.fill: parent
                Rectangle {
                    width: 50
                    height: 100
                    color: "green"
                }
                Rectangle {
                    width: 50
                    height: 100
                    color: "blue"
                }
            }
        }
    }


    fragmentShader: "
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
    "

    vertexShader: "
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
    "

}
