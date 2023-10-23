import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

SettingsPageView {
    id: root

    property int bpmChangeAmount: 1

    model: BpmSettingsModel {}

    // TODO: Add option to choose tempo from tempo markings, e.g. allegro, moderato etc.

    RowLayout {
        anchors.centerIn: parent
        spacing: 20

        MButton {
            Layout.preferredWidth: 60
            text: "-"
            onClicked: root.model.bpm -= root.bpmChangeAmount
        }

        Label {
            color: Theme.foregroundColor()
            text: root.model.bpm
            font.pointSize: 14
        }

        MButton {
            Layout.preferredWidth: 60
            text: "+"
            onClicked: root.model.bpm += root.bpmChangeAmount
        }
    }

    Component.onCompleted: root.model.load()
}
