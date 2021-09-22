import QtQuick 2.5
import QtQuick.XmlListModel 2.0
import "../common"
import "../../FluidElements"

Background{
    width: 300
    height: 480
    Component{
        id: imageDelegate
        Box{
            width: listView.width
            height: 220
            color: "#333"

            Column{
                Text {
                    text: title
                    color: "#e0e0e0"
                }
                Image {
                    width: listView.width
                    height: 200
                    fillMode: Image.PreserveAspectFit
                    source: imageSource
                }
            }
        }
    }

    XmlListModel{
        id: imageModel
        source: "https://www.nasa.gov/rss/dyn/image_of_the_day.rss"
        query: "/rss/channel/item"

        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "imageSource"; query: "enclosure/string(@url)" }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: imageModel
        delegate: imageDelegate
    }
}
