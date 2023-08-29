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

    // TODO: Add option to choose tempo from tempo markings, e.g. allegro, moderato etc.

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
