import QtQuick 2.5
import QtMultimedia 5.12
import "../ModelView/common"

Background{
    width: 1024
    height: 600

    MediaPlayer{
        id: player
        source: "trailer_400p.ogg"
    }
    VideoOutput{
        anchors.fill: parent
        source: player
    }

    Component.onCompleted: {
        player.play();
    }

}
