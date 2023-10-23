import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

SettingsPageView {
    id: root

    model: AboutSettingsModel {}

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Label {
            color: Theme.foregroundColor()
            text: root.model.appName + " v" + root.model.appVersion
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
            text: qsTr("Made with ❤️ by %1").arg(root.model.appAuthor)
            font.pointSize: 14
        }
    }
}
