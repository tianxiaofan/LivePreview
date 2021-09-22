import QtQuick 2.0

DarkSquare {
    id: root
    width: 200
    height: 440
    visible: true

    Column{
        id: column
        anchors.centerIn: parent
        spacing: 8
        RedSquare{}
        GreenSquare{width: 96}
        BlueSquare{}
    }

}
