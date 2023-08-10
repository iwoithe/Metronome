import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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

    ColumnLayout {
        spacing: 8
        anchors.centerIn: parent

        Label {
            id: bpmLabel
            text: root.playbackModel.bpm
            font.pointSize: 48
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Label {
            text: qsTr("BPM")
            font.pointSize: 14
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
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
