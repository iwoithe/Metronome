import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Ui

Item {
    id: root

    signal clicked

    property bool toggled: false
    property bool hovered: false

    property var playbackModel

    implicitWidth: 280
    implicitHeight: 280

    function updatePlayback() {
        if (toggled) {
            playbackModel.play()
        } else {
            playbackModel.stop()
        }
    }

    Rectangle {
        id: bgRect
        anchors.fill: parent
        radius: parent.width / 2
        color: Theme.backgroundColor()
        border.width: 10
        border.color: Theme.placeholderColor()
    }

    /*Rectangle {
        id: bpmController
        x: bgRect.radius + (Math.cos(playbackModel.bpm * (Math.PI / 180)) * bgRect.radius) - radius
        y: bgRect.radius - (Math.sin(playbackModel.bpm * (Math.PI / 180)) * bgRect.radius) - radius
        width: radius * 2
        height: radius * 2
        radius: 20
        color: Theme.foregroundColor()
    }

    DragHandler {
        id: bpmControllerHandler
        target: bpmController

        xAxis.enabled: false

        onTranslationChanged: {
            if (playbackModel.bpm <= 0) {
                playbackModel.bpm = 1
            } else {
                playbackModel.bpm -= delta.y
            }


            bpmController.x = bgRect.radius + (Math.cos(playbackModel.bpm * (Math.PI / 180)) * bgRect.radius) - bpmController.radius
            bpmController.y = bgRect.radius - (Math.sin(playbackModel.bpm * (Math.PI / 180)) * bgRect.radius) - bpmController.radius
            console.log(bpmController.x)
        }
    }*/

    ColumnLayout {
        spacing: 8
        anchors.centerIn: parent

        Label {
            id: bpmLabel
            text: root.playbackModel.bpm
            font.pointSize: 48
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: Theme.foregroundColor()
        }

        Label {
            text: qsTr("BPM")
            font.pointSize: 14
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: Theme.foregroundColor()
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.toggled = !root.toggled
            root.clicked()
            root.updatePlayback()
        }

        onHoveredChanged: {
            root.hovered = !root.hovered
            root.hoveredChanged()
        }
    }

    /*MouseArea {
        id: bpmControllerMouseArea
        anchors.fill: bpmController
        drag {
            target: bpmController
            axis: Drag.YAxis
        }
    }*/

    states: [
        State {
            name: "TOGGLED"
            when: root.toggled

            PropertyChanges {
                bgRect.border.color: Theme.activeColor()
            }
        },

        State {
            name: "HOVERED"
            when: root.hovered

            PropertyChanges {
                bgRect.opacity: 0.8
            }
        }
    ]
}
