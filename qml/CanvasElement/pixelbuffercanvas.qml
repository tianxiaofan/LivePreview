import QtQuick 2.12
import "../ModelView/common"

Background {
    width: 240
    height: 120

    Canvas{
        id: cvs
        anchors.fill: parent
        property real hue: 0.0
        onPaint: {
            var ctx = getContext("2d")

            var x = 10 + Math.random(80) * 80
            var y = 10 + Math.random(80) * 80
            hue += Math.random() * 0.1
            if(hue > 1.0)
            {
                hue -= 1;
            }

            ctx.globalAlpha = 0.7 //透明度
            ctx.fillStyle = Qt.hsla(hue,0.5,0.5,1.0) //获取颜色
            ctx.beginPath();
            ctx.moveTo(x+5,y)
            ctx.arc(x,y,x/10,0,360) // x,y,radius,startAngle, endAngle
            ctx.closePath();
            ctx.fill();

        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                var url = cvs.toDataURL("image/png")
                print("image url = ",url)
                image.source = url

            }
        }
    }
    Image {
        id: image
        x:130;y:10
        width: 100
        height: 100
    }

    Timer{
        interval: 1000
        running: true
        triggeredOnStart: true
        repeat: true
        onTriggered: cvs.requestPaint()
    }

}
