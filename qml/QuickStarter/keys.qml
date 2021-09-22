import QtQuick 2.0

DarkSquare {
    width: 400
    height: 200

    GreenSquare{
        id:square
        x:8;y:8
    }

    focus: true
    Keys.enabled: true
    Keys.priority: Keys.AfterItem
    Keys.onLeftPressed: square.x -= 8
    Keys.onRightPressed: square.x += 8
    Keys.onUpPressed: square.y -= 8
    Keys.onDownPressed: square.y += 8
    Keys.onPressed: {
        console.log(event.key)
        switch(event.key)
        {
        case Qt.Key_Plus:
            console.log("plus")
            square.scale += 0.2
            break
        case Qt.Key_Minus:
            console.log("minus")
            square.scale -= 0.2
            break
        }
    }
    Component.onCompleted: {
        console.log(activeFocus)
    }
    onActiveFocusChanged: {
        console.log(activeFocus)
    }

}


