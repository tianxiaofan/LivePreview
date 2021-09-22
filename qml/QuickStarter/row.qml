import QtQuick 2.12

BrightSquare {
    id:root
    width: 400
    height: 120
    Row{
        id:row
        anchors.centerIn: parent
        spacing: 20
        BlueSquare{}
        GreenSquare{}
        RedSquare{}

    }
}
