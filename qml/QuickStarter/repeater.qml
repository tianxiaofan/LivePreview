import QtQuick 2.0

DarkSquare {
    id:root
    width: 250
    height: 250
    property var colorArray: ["#00bde3", "#67c111", "#ea7025"]

    Grid{
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4
        Repeater{
            model: 16
            Square{
                width: 56;height: 56;
                property int colorIndex: Math.floor(Math.random()*3)
                color: root.colorArray[colorIndex]
                text: "Cell " + index
            }

        }
    }

}
