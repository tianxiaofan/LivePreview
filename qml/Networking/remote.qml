import QtQuick 2.12

Rectangle {
    id: item
    width: 480
    height: 320
    visible: true

    Loader {
        id: root
        source: 'http://localhost:8080/rect.qml'
        onLoaded: {
            root.width = item.width
            root.height = item.height
        }
        asynchronous: true
        visible: true
    }

}
