import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Metronome.Settings
import Metronome.Ui
import Metronome.UiComponents

Item {
    id: root

    property int buttonGapY: 20
    property int transitionDuration: 200

    Rectangle {
        id: bgRect
        anchors.fill: parent
        color: Theme.panelColor()
    }

    StackView {
        id: settingsPageView
        initialItem: settingsButtonsView
        anchors.fill: parent

        pushEnter: Transition {
            PropertyAnimation {
                property: "x"
                from: root.width
                to: 0
                duration: root.transitionDuration
            }
        }

        pushExit: Transition {
            PropertyAnimation {
                property: "x"
                from: 0
                to: 0
                duration: root.transitionDuration
            }
        }

        popEnter: Transition {
            PropertyAnimation {
                property: "x"
                from: 0
                to: 0
                duration: root.transitionDuration
            }
        }

        popExit: Transition {
            PropertyAnimation {
                property: "x"
                from: 0
                to: root.width
                duration: root.transitionDuration
            }
        }
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
                        settingsPageLoader.item.title = title
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
