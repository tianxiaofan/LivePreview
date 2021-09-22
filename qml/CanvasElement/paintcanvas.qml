import QtQuick 2.12
import "../ModelView/common"

Background {
    id:root
    width: 500
    height: 400
    Row{
        id:colorTools
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 8

        property var activeSquare: red
        property color paintColor: "#33b5e5"
        spacing: 4
        Repeater{
            model: ["#33B5E5", "#99CC00", "#FFBB33", "#FF4444"]
            ColorSquare{
                color: modelData
                active: parent.paintColor === color
                onClicked:{
                    parent.paintColor = color;
                }
            }
        }
    }

    Canvas{
        id:cvs
        anchors.top: colorTools.bottom
        anchors.left: root.left
        anchors.right: root.right
        anchors.bottom: root.bottom
        anchors.margins: 4
        property real lastX
        property real lastY
        property color color: colorTools.paintColor
        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 1.5;
            ctx.strokeStyle = color;
            ctx.beginPath();
            ctx.moveTo(lastX,lastY);
            lastX = area.mouseX;
            lastY = area.mouseY;
            ctx.lineTo(lastX,lastY)
            ctx.stroke();
        }
        MouseArea{
            id:area
            anchors.fill: parent
            onPressed: {
                cvs.lastX = mouseX;
                cvs.lastY = mouseY;
            }
            onPositionChanged: {
                cvs.requestPaint();
            }
        }

    }

}
