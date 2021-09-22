import QtQuick 2.12

Item {
    id:root
    width: 640
    height: 380
    property int duration: 3000

    Rectangle{
        id:sky
        width: parent.width
        height: 200
        gradient: Gradient{
            GradientStop{position:0.0; color: "#0080FF"}
            GradientStop{position:1.0; color: "#66CCFF"}
        }
    }
    Rectangle{
        id:ground
        anchors.top: sky.bottom
        anchors.bottom: root.bottom
        width: parent.width
        gradient: Gradient{
            GradientStop{position: 0.0; color: "#00FF00"}
            GradientStop{position: 1.0; color: "#00803F"}
        }
    }

    Image {
        id: ball
        x: 0;y:root.height - height
        source: "qrc:/qml/FluidElements/assets/soccer_ball.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                ball.x = 0;
                ball.y = root.height - ball.height
                ball.rotation = 0;
                anim.restart()
            }
        }
    }
    //平行动画
    ParallelAnimation{
        id: anim
        //队列动画
        SequentialAnimation{
            NumberAnimation {
                target: ball
                property: "y"
                to: 20
                duration: root.duration * 0.4
            }
            NumberAnimation {
                target: ball
                property: "y"
                to: root.height - ball.height
                duration: root.duration  * 0.4
                easing.type: Easing.OutBounce
            }
        }

        NumberAnimation {
            target: ball
            property: "x"
            to: root.width - ball.width
            duration: root.duration
        }
        //旋转
        RotationAnimation{
            target: ball
            properties: "rotation"
            to: 720
            duration: root.duration
        }
    }

}
