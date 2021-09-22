import QtQuick 2.12

Rectangle {
    width: 480
    height: 300
    gradient: Gradient{
        GradientStop{position: 0.0; color: "#414141"}
        GradientStop{position: 1.0; color: "#5fc9f8"}
    }
    ListModel{
        id:theModel
        ListElement{number:0}
        ListElement{number:1}
        ListElement{number:2}
        ListElement{number:3}
        ListElement{number:4}
        ListElement{number:5}
        ListElement{number:6}
        ListElement{number:7}
        ListElement{number:8}
        ListElement{number:9}
    }
    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        height: 40
        color: "#53d769"
        border.color: Qt.lighter(color, 1.5)
        Text {
            text: qsTr("Add Item")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: theModel.append({"number": ++parent.count})
        }

        property int count: 9
    }

    GridView{
        anchors.fill: parent
        anchors.margins: 20
        anchors.bottomMargin: 80
        clip: true
        cellHeight: 45
        cellWidth: 45
        model: theModel
        delegate: numberComponent
    }

    Component{
        id: numberComponent
        Rectangle{
            id: wrapper
            width: 40
            height: 40
            gradient: Gradient{
                GradientStop{position: 0.0; color: "#f8306a"}
                GradientStop{position: 1.0; color: "#fb5b40"}
            }

            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: number
            }
            MouseArea{
                anchors.fill: parent
                onClicked: theModel.remove(index)
            }
            GridView.onRemove:SequentialAnimation{
                PropertyAction { target: wrapper; property: "GridView.delayRemove"; value: true }
                NumberAnimation { target: wrapper; property: "scale"; to: 0; duration: 250; easing.type: Easing.InOutQuad}
                PropertyAction { target: wrapper; property: "GridView.delayRemove"; value: false }
            }
            GridView.onAdd: SequentialAnimation{
                NumberAnimation{target: wrapper; property: "scale";from:0; to:1;duration: 250; easing.type: Easing.InOutQuad}
            }
        }
    }

}
