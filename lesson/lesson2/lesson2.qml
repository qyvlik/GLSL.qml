import QtQuick 2.0

ShaderEffect {

    width: 360
    height: 640

    property color a_color: "green"


    fragmentShader: "
        #ifdef GL_ES
        varying lowp vec4 v_color;
        #else
        varying vec4 v_color;
        #endif

        void main()
        {
            gl_FragColor = v_color;
        }
    "

    // 顶点色
    vertexShader: "
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
    "

}
