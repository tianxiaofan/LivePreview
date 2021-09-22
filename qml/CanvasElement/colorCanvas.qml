import QtQuick 2.12
import "../ModelView/common"

Background {
    width: 120
    height: 120

    Canvas{
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")

            var gradient = ctx.createLinearGradient(100,0,100,200)
            gradient.addColorStop(0, "blue")
            gradient.addColorStop(0.5, "lightsteelblue")

            ctx.fillStyle = gradient

            ctx.fillRect(10,10,100,100)
        }

    }

}
