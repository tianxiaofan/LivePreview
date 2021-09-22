import QtQuick 2.0
import "../common"
import "../../FluidElements"

Column {
    spacing: 2
    Repeater{
        model: ListModel{
            ListElement{name:"Mercuy"; surfaceColor:"red";aa:"ss"}
            ListElement { name: "Venus"; surfaceColor: "yellow";aa:"ss" }
            ListElement { name: "Earth"; surfaceColor: "blue";aa:"ss" }
            ListElement { name: "Mars"; surfaceColor: "orange";aa:"ss" }
            ListElement { name: "Jupiter"; surfaceColor: "orange";aa:"ss" }
            ListElement { name: "Saturn"; surfaceColor: "yellow";aa:"ss" }
            ListElement { name: "Uranus"; surfaceColor: "lightBlue";aa:"ss" }
            ListElement { name: "Neptune"; surfaceColor: "lightBlue";aa:"ss" } // 测试得知:内部可自由定义
        }

        BlueBox{
            width: 120
            height: 32
            radius: 3
            text: name

            Box{
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 4
                width: 16
                height: width
                radius: width /2
                color: surfaceColor
                text: aa

            }
        }
    }

}
