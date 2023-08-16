import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents

Item {
    id: root

    SettingsModel {
        id: settingsModel
    }

    GridView {
        anchors.fill: parent
        model: settingsModel
        delegate: MButton {
            text: index
        }
    }
}
