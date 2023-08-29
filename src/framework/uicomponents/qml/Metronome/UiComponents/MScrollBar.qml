import QtQuick
import QtQuick.Controls

ScrollBar {
    id: root

    property int thickness: 4

    visible: size > 0 && size < 1

    contentItem: Rectangle {
        implicitWidth: root.thickness
        radius: root.width / 2
        color: Theme.placeholderColor()
    }
}
