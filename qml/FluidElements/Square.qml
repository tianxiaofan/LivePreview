import QtQuick 2.0

Rectangle {
    width: 96
    height: width
    border.color: Qt.lighter(color)
    property alias text: label.text
    property alias dragMinX: mouse.drag.minimumX
    property alias dragMaxX: mouse.drag.maximumX
    property alias dragMinY: mouse.drag.minimumY
    property alias dragMaxY: mouse.drag.maximumY

    Text {
        id: label
        anchors.centerIn: parent
        color: "#f0f0f0"
    }

    MouseArea{
        id:mouse
        anchors.fill: parent
        drag.target: parent
    }
}
