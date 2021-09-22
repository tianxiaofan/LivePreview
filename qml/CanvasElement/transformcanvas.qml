import QtQuick 2.12
import "../ModelView/common"

Background {
    width: 300
    height: 300

    Canvas{
        id:cvs
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")

            ctx.lineWidh = 4;
            //画笔颜色
            ctx.strokeStyle = "blue";

            //转换坐标系
            ctx.translate(cvs.width /2,cvs.height /2);
            ctx.beginPath();
            ctx.rect(-20,-20,40,40);
            ctx.stroke();

            ctx.rotate(Math.PI/4)
            ctx.strokeStyle = "green";

            //横纵坐标缩放
            ctx.scale(1.5,0.5)

            ctx.beginPath();
            ctx.rect(-20,-20,40,40);
            ctx.stroke();


        }

    }

}
