import QtQuick 2.5
import "../common"

Background{
    width: 80
    height: 300
    ListView{
        anchors.fill: parent
        anchors.margins: 20

        clip: true
        model: 100
        delegate: numberDelegate
    }
    Component{
        id:numberDelegate
        GreenBox{
            width: 40
            height: 40
            text: index
        }
    }

}
