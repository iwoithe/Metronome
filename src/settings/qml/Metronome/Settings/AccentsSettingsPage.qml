import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Playback
import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

SettingsPageView {
    id: root

    AccentsSettingsModel {
        id: settingsModel
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Label {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: Theme.foregroundColor()
            text: qsTr("Accents")
            font.bold: true
            font.pointSize: 18
        }

        GridView {
            Layout.preferredWidth: 300
            Layout.preferredHeight: 300
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
    }

    Component.onCompleted: settingsModel.load()
}
