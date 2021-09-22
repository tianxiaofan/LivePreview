import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.folderlistmodel 2.15
import QtQuick.Controls 1.5
import QtQml.Models 2.12
import io.qt.examples.quick.controls.filesystembrowser 1.0

ApplicationWindow {
    id:root
    width: 800
    height: 600
    visible: true
    Rectangle{
        id:fileList
        width: 200
        height: root.height

        color: "lightgrey"

        Button{
            id: clearBtn
            text: "clear"
            width: 100
            height: 40
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            onClicked: {
                clearQml()
            }
        }
        ItemSelectionModel {
            id: sel
            model: fileSystemModel
        }
        TreeView{
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: clearBtn.top
            model: fileSystemModel
            rootIndex: rootPathIndex
            selection: sel
            TableViewColumn {
                role: "fileName"
                resizable: true
            }
            onActivated: {
                var url = fileSystemModel.data(index, FileSystemModel.UrlStringRole)
                loadQml(url)
            }
        }

    }
    property string currentQml
    Rectangle{
        id:title
        anchors.left: fileList.right
        anchors.leftMargin: 2
        anchors.right: parent.right
        anchors.top: parent.top
        height: 20
        Text {
            text: currentQml
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        color: "mediumaquamarine"
    }

    Rectangle{
        id: showView
        anchors.left: fileList.right
        anchors.leftMargin: 2
        anchors.right: parent.right
        anchors.top: title.bottom
        anchors.bottom: parent.bottom
        Canvas{
            anchors.fill: parent
            visible: true
            property int img_w: 16
            property int img_h: 16
            property string imageData: "qrc:/image/lb_transparent.png"
            onPaint: {
                var ctx = getContext("2d");
                for(let i = 0; i <= Math.floor(width/img_w);i++)
                {
                    for (let j = 0; j <= Math.floor(height/img_h); j++)
                    {
                        ctx.drawImage(imageData,i*img_w,j*img_h);
                    }
                }
            }
            Component.onCompleted: {
                loadImage(imageData)
            }
        }

        Loader{
            anchors.centerIn: parent
            id: pageLoader
            asynchronous: true
            focus: true //这里需要开启,不然对于加载的qml,如果需要焦点事件,则无法接收
            visible: true
        }

    }


    function loadQml(name)
    {
        if(name.length <= 0)
            return

        pageLoader.source = "";

        //需要先清空,不然会
        QmlLiveEngine.clearCache();

        pageLoader.setSource(name)
        pageLoader.visible = true;

        if(currentQml !== name)
            currentQml = name;

        console.log(pageLoader.source)
    }
    function clearQml()
    {
        pageLoader.source = "";
        pageLoader.visible = false;
    }

    function _reload(){
        if(currentQml.length <= 0)
            return;

        loadQml(currentQml)
    }

}
