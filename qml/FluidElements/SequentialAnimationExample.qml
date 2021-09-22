import QtQuick 2.0

//连续动画
BrightSquare {
    id: root
    width: 600
    height: 400
    property int duration: 3000

    property Item ufo: ufo

    Image {
        anchors.fill: parent
        source: "qrc:/qml/FluidElements/assets/ufo_background.png"
    }

    ClickableImageV3{
        id: ufo
        x:20;y:root.height - height
        text: "rocket"
        source: "qrc:/qml/FluidElements/assets/ufo.png"
        onClicked: {anim.restart()}
    }

    SequentialAnimation{
        id:anim
        //先运行
        NumberAnimation {
            target: ufo
            property: "y"
            to: 20
            duration: root.duration * 0.6
        }
        //后运行
        NumberAnimation {
            target: ufo
            property: "x"
            to: 400
            duration: root.duration * 0.4
        }
    }

}
