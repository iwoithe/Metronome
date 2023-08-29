import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents

SettingsPageView {
    id: root

    AccentsSettingsModel {
        id: settingsModel
    }

    Label {
        anchors.centerIn: parent
        text: qsTr("Accents Settings")
        color: Theme.foregroundColor()
    }

    Component.onCompleted: settingsModel.load()
}
