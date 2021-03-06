/*
 * Copyright (c) 2013, Juergen Bocklage-Ryannel, Johan Thelin
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the editors nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// M1>>
import QtQuick 2.5
import Qt.labs.settings 1.1

Rectangle {
    id:root
    width: 600; height: 400
    color: '#ffffff'

    state: "analog"
    property int speed: 0
    states: [State {
            name: "analog"
            PropertyChanges { target: analogButton; color: "green"; }
            PropertyChanges { target: dialLoader; source: "Analog.qml"; }
        },
        State {
            name: "digital"
            PropertyChanges { target: digitalButton; color: "green"; }
            PropertyChanges { target: dialLoader; source: "Digital.qml"; }
        }]

    SequentialAnimation{
        running: true
        loops: Animation.Infinite

        NumberAnimation{target: root; property: "speed"; to: 145; easing.type: Easing.InOutQuad; duration: 4000}
        NumberAnimation{target: root; property: "speed"; to: 0; easing.type: Easing.InOutQuad; duration: 4000}
    }

    Loader{
        id:dialLoader
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: analogButton.top
        }
        onLoaded: binder.target = dialLoader.item
    }

    Binding{
        id:  binder
        property: "speed"
        value: speed
    }

    Rectangle{
        id:analogButton
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        color: "gray"
        width: parent.width / 2 - 1
        height: 100

        Text {
            anchors.centerIn: parent
            text: qsTr("Analog")
        }

        MouseArea{
            anchors.fill: parent
            onClicked: root.state = "analog"
        }
    }
    Rectangle{
        id:digitalButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "gray"
        width: parent.width / 2 - 1
        height: 100

        Text {
            anchors.centerIn: parent
            text: qsTr("Digital")
        }

        MouseArea{
            anchors.fill: parent
            onClicked: root.state = "digital"
        }
    }

}
// <<M1
