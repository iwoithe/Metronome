import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

SettingsPageView {
    id: root

    model: TimeSignatureSettingsModel {}

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("-")
                onClicked: root.model.numerator -= 1
            }

            Label {
                text: root.model.numerator
                color: Theme.foregroundColor()
                font.pointSize: 14
            }

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("+")
                onClicked: root.model.numerator += 1
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("-")
                onClicked: root.model.denominator -= 1
            }

            Label {
                text: root.model.denominator
                color: Theme.foregroundColor()
                font.pointSize: 14
            }

            MButton {
                Layout.preferredWidth: 60
                text: qsTr("+")
                onClicked: root.model.denominator += 1
            }
        }
    }

    Component.onCompleted: root.model.load()
}
