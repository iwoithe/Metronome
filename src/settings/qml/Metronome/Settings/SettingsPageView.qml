import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents


Item {
    id: root

    signal popPage

    Rectangle {
        anchors.fill: parent
        color: Theme.panelColor()
    }

    MButton {
        anchors.left: parent.left
        anchors.top: parent.top
        width: 60
        text: qsTr("Back")
        onClicked: root.popPage()
    }
}
