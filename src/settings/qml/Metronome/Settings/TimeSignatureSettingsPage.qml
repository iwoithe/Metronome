import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents

SettingsPageView {
    id: root

    TimeSignatureSettingsModel {
        id: settingsModel
    }

    Label {
        anchors.centerIn: parent
        text: qsTr("Time Signature Settings")
        color: Theme.foregroundColor()
    }

    Component.onCompleted: settingsModel.load()
}
