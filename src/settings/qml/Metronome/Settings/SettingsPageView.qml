import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents


Item {
    id: root

    signal popPage

    MButton {
        anchors.left: parent.left
        anchors.top: parent.top
        text: qsTr("Back")
        onClicked: root.popPage()
    }
}
