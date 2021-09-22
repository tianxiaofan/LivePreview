import QtQuick 2.0

ClickableImageV3 {
    id:rocket2
    x:0;y:0
    source: "qrc:/qml/FluidElements/assets/box_green.png"
    text: "行为属性"
    Behavior on y{
        NumberAnimation {
            duration: 4000
        }
//        enabled: false //可禁用
    }
    onClicked: y = 40
//    onClicked: y = 40+Math.random()*(205-40)

}
