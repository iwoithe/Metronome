import QtQuick
import QtQuick.Controls

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
        color: {
            if (root.flat && !root.hovered) {
                return "transparent"
            } else if (root.flat && root.hovered) {
                return Theme.foregroundColor()
            }

            if (root.toggle && root.toggled) {
                return Theme.foregroundColor()
            }

            if (root.hovered) {
                return Theme.foregroundColor()
            }

            return "transparent"
        }
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
        color: {
            if (root.flat && !root.hovered) {
                return Theme.foregroundColor()
            } else if (root.flat && root.hovered) {
                return Theme.invertedForegroundColor()
            }

            if (root.toggle && root.toggled) {
                return Theme.invertedForegroundColor()
            }

            if (root.hovered) {
                return Theme.invertedForegroundColor()
            }

            return Theme.foregroundColor()
        }
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
}
