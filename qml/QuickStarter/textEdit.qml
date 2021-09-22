import QtQuick 2.0

Rectangle {
    width: 136
    height: 136

    color: "linen"

    TTextEdit{
        id:input
        x:8;y:8
        width: 120
        height: 120
        focus: true
        text: "Text Edit"
    }

}
