import QtQuick
import QtQuick.Layouts
import QtQuick.Window

import Metronome.Playback
import Metronome.Settings
import Metronome.Ui
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
        accentsModel: AccentsModel
    }

    RowLayout {
        id: mainLayout
        spacing: 40

        anchors.fill: parent
        anchors.margins: 20

        ColumnLayout {
            id: controlsLayout
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Layout.preferredWidth: 280

            spacing: 40

            MPlayButton {
                id: playButton
                playbackModel: playbackModel
            }

            MButton {
                id: tapButton
                text: qsTr("Tap")
                onClicked: playbackModel.tap()
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
            Layout.fillHeight: true
            visible: root.settingsPageToggled
        }
    }

    Component.onCompleted: {
        AccentsModel.setNumerator(4)
        AccentsModel.setAccent(1, true)
    }
}
