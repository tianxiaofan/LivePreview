import QtQuick 2.5
import "../common"

Column {
    spacing: 2
    Repeater{
        model: ["Enterprise", "Columbia", "Challenger", "Discovery", "Endeavour", "Atlantis"]

        BlueBox{
            width: 100
            height: 32
            radius: 3
            text: modelData + "(" + index  + ")";
        }
    }

}
