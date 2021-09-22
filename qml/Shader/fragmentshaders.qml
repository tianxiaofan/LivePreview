import QtQuick 2.12
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    width: 480;
    height: 240
    color: "#1e1e1e"

    Grid{
        anchors.centerIn: parent
        spacing: 20
        rows :2 ; columns: 4 ;
        Image {
            id: sourceImage
            width: 80; height: width
            source: "assets/tulips.jpg"
        }

        ShaderEffect{
            id: effect1
            width: 80; height: width
            fragmentShader: "
                            uniform lowp float qt_Opacity;
                            void main() {
                                gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0) * qt_Opacity;
                            }"
        }

        ShaderEffect{
            id:effect2
            width: 80; height: width
            property variant source: sourceImage
            fragmentShader: "
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D source;
                uniform lowp float qt_Opacity;
                void main() {
                    gl_FragColor = texture2D(source, qt_TexCoord0) * vec4(1.0, 0.0, 0.0, 1.0) * qt_Opacity;
                }"
        }

        ShaderEffect {
             id: effect3
             width: 80; height: width
             property variant source: sourceImage
             property real redChannel: 0.5
             fragmentShader: "
                 varying highp vec2 qt_TexCoord0;
                 uniform sampler2D source;
                 uniform lowp float qt_Opacity;
                 uniform lowp float redChannel;
                 void main() {
                     gl_FragColor = texture2D(source, qt_TexCoord0) * vec4(redChannel, 1.0, 1.0,1.0) * qt_Opacity;
                 }"
         }

        ShaderEffect {
            id: effect4
            width: 80; height: width
            property variant source: sourceImage
            property real redChannel: 0.3
            NumberAnimation on redChannel {
                from: 0.0; to: 1.0; loops: Animation.Infinite; duration: 4000
            }

            fragmentShader: "
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D source;
                uniform lowp float qt_Opacity;
                uniform lowp float redChannel;
                void main() {
                    gl_FragColor = texture2D(source, qt_TexCoord0) * vec4(redChannel, 1.0, 1.0, 1.0) * qt_Opacity;
                }"
        }

        FastBlur {
            width: 80; height: 80
            source: sourceImage
            radius: blurred?32:0 //像素点与像素点的距离
            property bool blurred: false

            Behavior on radius {
                NumberAnimation { duration: 1000 }
            }

            MouseArea {
                id: area
                anchors.fill: parent
                onClicked: parent.blurred = !parent.blurred
            }
        }

    }
}
