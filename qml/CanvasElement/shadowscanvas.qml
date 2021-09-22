import QtQuick 2.12
import "../ModelView/common"

Background {
    width: 400
    height: 300

    Canvas{
        id:cvs
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")

            //绘制背景
            ctx.strokeStyle = "#333"
            ctx.fillRect(0,0,cvs.width,cvs.height);

            //绘制阴影配置
            ctx.shadowColor = "#2ed5fa"
            ctx.shadowOffsetX = 2;
            ctx.shadowOffsetY = 2;
            ctx.shodowBlur = 10;

            ctx.font = "bold 80px 黑体";
            ctx.fillStyle = "#24d12e"
            ctx.fillText("Canvas!",30,180);

        }

    }

}
