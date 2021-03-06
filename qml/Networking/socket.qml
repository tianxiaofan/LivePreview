import QtQuick 2.12
import QtQml 2.12
import QtWebSockets 1.1


Rectangle{
    width: 480
    height: 48
    color: "#C1FFD7"
    Text {
        anchors.fill: parent

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        WebSocket{
            id:socket
            url:"ws://echo.websocket.org"
            active: true
            onTextMessageReceived: {
                text = message
            }
            onStatusChanged: {
                if(socket.status == WebSocket.Error)
                    console.log("Error: " + socket.errorString)
                else if (socket.status == WebSocket.Open)
                    socket.sendTextMessage("ping")
                else if (socket.status == WebSocket.Closed)
                    text += "\nSocket closed"
            }

        }

    }

}

