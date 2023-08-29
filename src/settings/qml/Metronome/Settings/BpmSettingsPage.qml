import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents

SettingsPageView {
    id: root

    BpmSettingsModel {
        id: settingsModel
    }

    SpinBox {
        id: bpmSpinBox
        anchors.centerIn: parent
        value: settingsModel.bpm
        onValueModified: settingsModel.bpm = value
        from: 1
        to: 400
    }

    Component.onCompleted: settingsModel.load()
}
