import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

SettingsPageView {
    id: root

    AboutSettingsModel {
        id: settingsModel
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Label {
            color: Theme.foregroundColor()
            text: qsTr("About")
            font.bold: true
            font.pointSize: 18
        }

        Label {
            color: Theme.foregroundColor()
            text: settingsModel.appName + " v" + settingsModel.appVersion
            font.pointSize: 14
        }

        Label {
            color: Theme.foregroundColor()
            text: qsTr("A simple, yet featureful metronome app for desktop")
            font.pointSize: 14
        }

        Label {
            color: Theme.foregroundColor()
            text: qsTr("Third party libraries used:<ul><li>PySide 6</li><li>PyDispatcher</li><li>PyTest</li></ul>")
            font.pointSize: 14
            textFormat: Text.RichText
        }

        Label {
            color: Theme.foregroundColor()
            text: qsTr("Made with ❤️ by %1").arg(settingsModel.appAuthor)
            font.pointSize: 14
        }
    }
}
