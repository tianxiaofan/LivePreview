import QtQuick 2.0

ClickableImageV3 {
    id:rocket1
    x:40;y:200
    source: "qrc:/qml/FluidElements/assets/box_green.png"
    text: "属性操作"
    NumberAnimation on y {
        to :30
        duration: 4000
    }

}
