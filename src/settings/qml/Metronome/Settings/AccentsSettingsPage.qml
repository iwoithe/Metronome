import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Playback
import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

SettingsPageView {
    id: root

    model: AccentsSettingsModel {}

    GridView {
        anchors.centerIn: parent
        width: 300
        height: 300
        model: AccentsModel.numerator()
        delegate: MButton {
            width: 60
            height: 60
            toggle: true
            text: index + 1
            onClicked: AccentsModel.setAccent(index + 1, toggled)

            Component.onCompleted: toggled = AccentsModel.isAccented(index + 1)
        }
    }

    Component.onCompleted: root.model.load()
}
