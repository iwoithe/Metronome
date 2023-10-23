import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents


Item {
    id: root

    signal popPage

    property string title: qsTr("Title")
    property var model

    Rectangle {
        anchors.fill: parent
        color: Theme.panelColor()
    }

    MButton {
        id: backButton
        anchors.left: parent.left
        anchors.top: parent.top
        width: 60
        text: qsTr("Back")
        onClicked: root.popPage()
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: backButton.verticalCenter
        color: Theme.foregroundColor()
        text: root.title
        font.bold: true
        font.pointSize: 18
    }
}
