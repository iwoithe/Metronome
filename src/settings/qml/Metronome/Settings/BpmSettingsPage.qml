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

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Label {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: Theme.foregroundColor()
            text: qsTr("BPM")
            font.bold: true
            font.pixelSize: 18
        }

        RowLayout {
            spacing: 20

            MButton {
                Layout.preferredWidth: 60
                text: "-"
                onClicked: settingsModel.bpm -= 1
            }

            Label {
                color: Theme.foregroundColor()
                text: settingsModel.bpm
            }

            MButton {
                Layout.preferredWidth: 60
                text: "+"
                onClicked: settingsModel.bpm += 1
            }
        }
    }

    Component.onCompleted: settingsModel.load()
}
