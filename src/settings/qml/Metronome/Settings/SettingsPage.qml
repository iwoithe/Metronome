import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents

Item {
    id: root

    StackView {
        id: settingsPageView
        initialItem: settingsButtonsView
        anchors.fill: parent
    }

    SettingsModel {
        id: settingsModel

        Component.onCompleted: settingsModel.load()
    }

    Component {
        id: settingsButtonsView

        GridView {
            Component {
                id: settingsButtonDelegate

                MButton {
                    text: title
                    onClicked: {
                        settingsPageLoader.source = qmlPath
                        settingsPageView.push(settingsPageLoader)
                    }
                }
            }

            cellWidth: parent.width / 2
            cellHeight: 60

            model: settingsModel

            delegate: settingsButtonDelegate

            clip: true
            boundsBehavior: Flickable.StopAtBounds

            ScrollBar.horizontal: MScrollBar {}
            ScrollBar.vertical: MScrollBar {}
        }
    }

    Loader {
        id: settingsPageLoader
    }
}
