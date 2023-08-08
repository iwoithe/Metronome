import QtQuick
import QtQuick.Layouts
import QtQuick.Window

import Metronome.Playback
import Metronome.UiComponents

Window {
    id: root
    visible: true

    width: 960
    height: 640

    color: Theme.backgroundColor()

    ColumnLayout {
        anchors.centerIn: parent

        spacing: 40

        MButton {
            id: playButton
            text: qsTr("Play")
            toggle: true
            onClicked: {
                if (toggled) {
                    playbackModel.play()
                } else {
                    playbackModel.stop()
                }
            }
        }

        MButton {
            id: tapButton
            text: qsTr("Tap")
        }

        MButton {
            id: settingsButton
            text: qsTr("Settings")
            toggle: true
        }
    }

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
}
