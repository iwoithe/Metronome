import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.UiComponents

Item {
    id: root

    property int buttonGapY: 20

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
            cellHeight: 60 + (2 * root.buttonGapY)

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

    Connections {
        target: settingsPageLoader.item
        function onPopPage() {
            settingsPageView.pop()
        }
    }
}
