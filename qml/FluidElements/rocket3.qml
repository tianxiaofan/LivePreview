import QtQuick 2.0

ClickableImageV3 {
    id:rocket3
    x:200;y:200
    source: "qrc:/qml/FluidElements/assets/box_red.png"

    text: "独立动画"

    NumberAnimation{
        id:anim
        target: rocket3
        properties: "y"
        from:205
        to:40
        duration: 4000
    }

//    onClicked: anim.start()
    onClicked: {
        anim.running = !anim.running
    }

}
