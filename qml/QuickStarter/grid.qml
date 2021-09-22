import QtQuick 2.0

BrightSquare {
    id:root
    width: 200
    height: width
    Grid{
        id:grid
        rows: 2
        columns: 2
        anchors.centerIn: parent
        spacing: 8
        RedSquare{}
        RedSquare{}
        RedSquare{}
        RedSquare{}
    }

}
