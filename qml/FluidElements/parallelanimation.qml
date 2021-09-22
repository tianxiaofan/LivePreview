import QtQuick 2.0

// 并行动画
BrightSquare {
    id:root
    width: 600
    height: 400
    property int duration: 3000
    property Item ufo: ufo

    Image {
        anchors.fill: parent
        source: "qrc:/assets/ufo_background.png"
    }

    ClickableImageV3{
        id: ufo
        x: 20; y:root.height - height
        text: "ufo"
        source: "qrc:/assets/ufo.png"
        onClicked: anim.restart()
    }

    ParallelAnimation{
        id:anim
        NumberAnimation {
            target: ufo
            properties: 'y'
            to: 20
            duration: root.duration
        }

        NumberAnimation {
            target: ufo
            property: "x"
            to: 160
            duration: root.duration
        }
    }

}
