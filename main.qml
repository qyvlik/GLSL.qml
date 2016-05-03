import QtQuick 2.0

Canvas {
    width: 400
    height: 400
    layer.enabled: true
    layer.effect: ShaderEffect {

        anchors.fill: parent
        smooth: true
        property size uResolution: Qt.size(width, height)
        fragmentShader:"
                uniform vec2 uResolution;
                void main() {
                    vec2 center = vec2(uResolution.x/2., uResolution.y/2.);
                    float radius = uResolution.x/2.;
                    vec2 position = gl_FragCoord.xy - center;
                    float thickness = radius/50.;
                    float z = sqrt(radius*radius - position.x*position.x - position.y*position.y);
                    z /= radius;
                    gl_FragColor = vec4(vec3(z), 1.);
                }"
    }

    onPaint: {
        var ctx = getContext("2d");
        var data = ctx.getImageData(0,0,width, height).data
        console.log(data[height/2 * width])
    }

    Timer {
        repeat: true
        interval: 100
        running: true
        onTriggered: {
            requestPaint();
        }
    }
}




//ShaderEffect {
//    id: root
//    width: 400
//    height: 400
//    smooth: true
//    property size uResolution: Qt.size(root.width, root.height)
//    fragmentShader:"
//            uniform vec2 uResolution;
//            void main() {
//                vec2 center = vec2(uResolution.x/2., uResolution.y/2.);
//                float radius = uResolution.x/2.;
//                vec2 position = gl_FragCoord.xy - center;
//                float thickness = radius/50.;
//                float z = sqrt(radius*radius - position.x*position.x - position.y*position.y);
//                z /= radius;
//                gl_FragColor = vec4(vec3(z), 1.);
//            }"
//}
