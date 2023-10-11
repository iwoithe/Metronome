import QtQuick
import QtQuick.Controls

import Metronome.Ui

Item {
    id: root

    property bool flat: false
    property bool hovered: false
    property bool toggle: false
    property bool toggled: false

    signal clicked

    implicitWidth: 280
    implicitHeight: 60

    property alias text: textLabel.text

    Rectangle {
        id: bgRect
        anchors.fill: parent
        color: Theme.backgroundColor()
        radius: 30

        border.width: root.flat ? 0 : 2
        border.color: Theme.foregroundColor()
    }

    Label {
        id: textLabel
        anchors.centerIn: parent
        text: ""
        font.pointSize: 14
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: Theme.foregroundColor()
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.toggled = !root.toggled
            root.clicked()
        }
        onHoveredChanged: {
            root.hovered = !root.hovered
            root.hoveredChanged()
        }
    }

    states: [
        State {
            name: "FLAT"
            when: root.flat
            PropertyChanges {
                bgRect {
                    color: Theme.backgroundColor()
                    border.width: 2
                    border.color: Theme.foregroundColor()
                }

                textLabel.color: Theme.foregroundColor()
            }
        },
        State {
            name: "FLAT_HOVERED"
            when: root.flat && root.hovered
            PropertyChanges {
                bgRect {
                    color: Theme.foregroundColor()
                    border.width: 0
                }

                textLabel.color: Theme.invertedForegroundColor()
            }
        },
        State {
            name: "TOGGLED"
            when: root.toggle && root.toggled
            PropertyChanges {
                bgRect {
                    color: Theme.foregroundColor()
                    border.width: 0
                }

                textLabel.color: Theme.invertedForegroundColor()
            }
        },
        State {
            name: "HOVERED"
            when: root.hovered && !root.toggled
            PropertyChanges {
                bgRect {
                    color: Theme.foregroundColor()
                    border.width: 0
                }

                textLabel.color: Theme.invertedForegroundColor()
            }
        },
        State {
            name: "TOGGLE_HOVERED"
            when: root.hovered && root.toggle && root.toggled
            PropertyChanges {
                bgRect {
                    color: Theme.backgroundColor()
                    border.width: 2
                }

                textLabel.color: Theme.foregroundColor()
            }
        }
    ]
}
