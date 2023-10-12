import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

SettingsPageView {
    id: root

    property int bpmChangeAmount: 1

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
            font.pointSize: 18
        }

        RowLayout {
            spacing: 20

            MButton {
                Layout.preferredWidth: 60
                text: "-"
                onClicked: settingsModel.bpm -= root.bpmChangeAmount
            }

            Label {
                color: Theme.foregroundColor()
                text: settingsModel.bpm
                font.pointSize: 14
            }

            MButton {
                Layout.preferredWidth: 60
                text: "+"
                onClicked: settingsModel.bpm += root.bpmChangeAmount
            }
        }
    }

    Component.onCompleted: settingsModel.load()
}
