import QtQuick 2.0
import "../common"

Background {
    width: 220
    height: 300
    GridView{
        id:grid
        anchors.fill: parent
        anchors.margins: 20
        model: 100
        cellHeight: 45
        cellWidth: 45
        delegate: numberComponent

    }
    Component{
        id:numberComponent
        GreenBox{
            width: 40
            height: 40
            text: index
        }

    }

}
