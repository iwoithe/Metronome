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

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Label {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: Theme.foregroundColor()
            text: qsTr("Time signature")
            font.bold: true
            font.pixelSize: 18
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("-")
                onClicked: settingsModel.numerator -= 1
            }

            Label {
                text: settingsModel.numerator
                color: Theme.foregroundColor()
            }

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("+")
                onClicked: settingsModel.numerator += 1
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("-")
                onClicked: settingsModel.denominator -= 1
            }

            Label {
                text: settingsModel.denominator
                color: Theme.foregroundColor()
            }

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("+")
                onClicked: settingsModel.denominator += 1
            }
        }
    }

    Component.onCompleted: settingsModel.load()
}
