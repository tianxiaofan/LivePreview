import QtQuick 2.12
import "../ModelView/common"

Background {
    width: 300
    height: 300

    Canvas{
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")

            ctx.drawImage("assets/ball.png",10,10)


            // store current context setup
            ctx.save()
            ctx.strokeStyle = '#ff2a68'
            // create a triangle as clip region
            ctx.beginPath()
            ctx.moveTo(110,10)
            ctx.lineTo(155,10)
            ctx.lineTo(135,55)
            ctx.closePath()
            // translate coordinate system
            ctx.clip()  // create clip from the path
            // draw image with clip applied
            ctx.drawImage('assets/ball.png', 100, 10)
            // draw stroke around path
            ctx.stroke()
            // restore previous context
            ctx.restore()

        }

        Component.onCompleted: {
            loadImage("assets/ball.png")
        }

    }

}
