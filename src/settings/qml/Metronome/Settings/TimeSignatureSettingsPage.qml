import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents

SettingsPageView {
    id: root

    TimeSignatureSettingsModel {
        id: settingsModel
    }

    Row {
        anchors.centerIn: parent

        Column {
            MButton {
                text: qsTr("Up")
                onClicked: settingsModel.numerator += 1
            }

            Label {
                text: settingsModel.numerator
                color: Theme.foregroundColor()
            }

            MButton {
                text: qsTr("Down")
                onClicked: settingsModel.numerator -= 1
            }
        }

        Column {
            MButton {
                text: qsTr("Up")
                onClicked: settingsModel.denominator += 1
            }

            Label {
                text: settingsModel.denominator
                color: Theme.foregroundColor()
            }

            MButton {
                text: qsTr("Down")
                onClicked: settingsModel.denominator -= 1
            }
        }
    }

    Component.onCompleted: settingsModel.load()
}
