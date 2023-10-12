from typing import Dict

from PySide6.QtCore import QAbstractListModel, Qt, QObject, Slot, Signal, Property, QModelIndex, QByteArray

from .settingspagemodel import SettingsModelPage


class SettingsModel(QAbstractListModel):
    currentPageIndexChanged = Signal(int, arguments=["pageIndex"])
    pagesChanged = Signal()

    def __init__(self) -> None:
        QAbstractListModel.__init__(self)

        self.__pages = []
        self.__currentPageIndex = 0

    def currentPageIndex(self) -> int:
        return self.__currentPageIndex

    def setCurrentPageIndex(self, val: int) -> None:
        if self.__currentPageIndex != val:
            self.__currentPageIndex = val
            self.currentPageIndexChanged.emit(self.__currentPageIndex)

    currentPageIndex = Property(int, fget=currentPageIndex, fset=currentPageIndex, notify=currentPageIndexChanged)

    def pages(self):
        return self.__pages

    pages = Property(QObject, fget=pages, notify=pagesChanged)

    def rowCount(self, parent) -> int:
        return len(self.__pages)

    def data(self, index, role):
        if 0 <= index.row() < len(self.__pages):
            roleName = self.roleNames().get(role)
            if roleName:
                page: SettingsModelPage = self.__pages[index.row()]
                value = getattr(page, "get" + roleName.decode()[0].upper() + roleName.decode()[1:])()
                return value

    def roleNames(self) -> Dict[int, QByteArray]:
        d = {
            Qt.DisplayRole + 1: "id".encode(),
            Qt.DisplayRole + 2: "title".encode(),
            Qt.DisplayRole + 3: "qmlPath".encode()
        }

        return d

    def addSettingsPage(self, pageId: str, title: str, qmlPath: str) -> None:
        page: SettingsModelPage = SettingsModelPage()
        page.setPageId(pageId)
        page.setTitle(title)
        page.setQmlPath(qmlPath)
        self.__pages.append(page)

    @Slot()
    def load(self) -> None:
        self.beginResetModel()
        self.addSettingsPage("about", "About", "qrc:/qml/Metronome/Settings/AboutSettingsPage.qml")
        self.addSettingsPage("accents", "Accents", "qrc:/qml/Metronome/Settings/AccentsSettingsPage.qml")
        self.addSettingsPage("bpm", "BPM", "qrc:/qml/Metronome/Settings/BpmSettingsPage.qml")
        self.addSettingsPage("time-signature", "Time Signature", "qrc:/qml/Metronome/Settings/TimeSignatureSettingsPage.qml")
        self.endResetModel()
        self.layoutChanged.emit()
