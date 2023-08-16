import QtQuick
import QtQuick.Layouts
import QtQuick.Window

import Metronome.Playback
import Metronome.Settings
import Metronome.UiComponents

Window {
    id: root
    visible: true

    width: 960
    height: 640

    color: Theme.backgroundColor()

    property bool settingsPageToggled: false

    PlaybackModel {
        id: playbackModel
        accentsModel: accentsModel
    }

    AccentsModel {
        id: accentsModel
        Component.onCompleted: {
            accentsModel.setNumerator(4)
            accentsModel.setAccent(1, true)
        }
    }

    RowLayout {
        spacing: 40

        anchors.fill: parent
        anchors.margins: 20

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            implicitWidth: 280

            spacing: 40

            MPlayButton {
                id: playButton
                playbackModel: playbackModel
            }

            MButton {
                id: tapButton
                text: qsTr("Tap")
            }

            MButton {
                id: settingsButton
                text: qsTr("Settings")
                toggle: true
                onClicked: root.settingsPageToggled = !root.settingsPageToggled
            }
        }

        SettingsPage {
            id: settingsPage
            Layout.fillWidth: true
            visible: root.settingsPageToggled
        }
    }
}
