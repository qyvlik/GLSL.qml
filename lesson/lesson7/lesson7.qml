/*
  使用纹理
*/
import QtQuick 2.0

import QtQuick.Controls 1.4

ShaderEffect {

    width: 360
    height: 640

    // 一般是会把图片中的白色替换成 绿色
    // 其他颜色为黑色。。。
    // 纹理与色值混合

    property real billValue: 0.1

    property bool divider: true
    property real targetWidth: 360
    property real targetHeight: 640

    // Transform slider values, and bind result to shader uniforms
    property real grid: billValue * 10

    property real step_x: 0.0015625
    property real step_y: targetHeight ? (step_x * targetWidth / targetHeight) : 0.0

    Slider {
        anchors {
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }
        value: billValue
        onValueChanged: billValue = value
    }
    // 纹理
    property var source: ShaderEffectSource {
        sourceItem: Image {
            width: 100
            height: 100
            source: "./image.png"
        }
    }

    fragmentShader: "
        #ifdef GL_ES
            precision mediump float;
        #else
        #   define lowp
        #   define mediump
        #   define highp
        #endif // GL_ES

        uniform float grid;
        uniform float step_x;
        uniform float step_y;

        uniform sampler2D source;
        uniform lowp float qt_Opacity;
        varying vec2 qt_TexCoord0;

        void main()
        {
            vec2 uv = qt_TexCoord0.xy;
            float offx = floor(uv.x  / (grid * step_x));
            float offy = floor(uv.y  / (grid * step_y));
            vec3 res = texture2D(source, vec2(offx * grid * step_x , offy * grid * step_y)).rgb;
            vec2 prc = fract(uv / vec2(grid * step_x, grid * step_y));
            vec2 pw = pow(abs(prc - 0.5), vec2(2.0));
            float  rs = pow(0.45, 2.0);
            float gr = smoothstep(rs - 0.1, rs + 0.1, pw.x + pw.y);
            float y = (res.r + res.g + res.b) / 3.0;
            vec3 ra = res / y;
            float ls = 0.3;
            float lb = ceil(y / ls);
            float lf = ls * lb + 0.3;
            res = lf * res;
            vec3 col = mix(res, vec3(0.1, 0.1, 0.1), gr);
            gl_FragColor = qt_Opacity * texture2D(source, uv);
        }
    "

}
