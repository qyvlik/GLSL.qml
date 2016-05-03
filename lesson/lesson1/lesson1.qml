import QtQuick 2.0

ShaderEffect {

    width: 360
    height: 640

    // 颜色设置

    property color u_color: "green"

    fragmentShader: "
        uniform vec4 u_color;

        void main()
        {
            gl_FragColor = u_color;
        }
    "

    vertexShader: "
        attribute highp vec4 qt_Vertex;
        uniform highp mat4 qt_Matrix;

        void main()
        {
            // 投影变换，获取到屏幕上真实的影像
            gl_Position = qt_Matrix * qt_Vertex;
        }
    "

}
