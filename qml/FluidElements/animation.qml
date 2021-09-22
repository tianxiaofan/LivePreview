import QtQuick 2.0

Image {
    id: root

    source: "qrc:/qml/FluidElements/assets/background.png"

    Image {
        x:40;y:40;
        source: "qrc:/qml/FluidElements/assets/box_green.png"

        NumberAnimation on x {
            to:240
            duration: 4000
            loops: Animation.Infinite
        }

        RotationAnimation on rotation {
            to:360
            duration: 4000
            loops: Animation.Infinite
        }

        NumberAnimation on scale {
            to: 0
            duration: 4000
            loops: Animation.Infinite
        }

    }
}
