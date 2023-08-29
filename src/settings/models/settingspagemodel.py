from PySide6.QtCore import QAbstractListModel, Qt, QObject, Slot, Signal, Property


class SettingsModelPage(QObject):
    pageIdChanged = Signal(str, arguments=["pageId"])
    titleChanged = Signal(str, arguments=["title"])
    qmlPathChanged = Signal(str, arguments=["qmlPath"])

    def __init__(self, parent: QObject = None):
        super().__init__(parent)

        self.__pageId = None
        self.__title = None
        self.__qmlPath = None

    def getPageId(self) -> str:
        return self.__pageId

    def setPageId(self, val: str):
        if self.__pageId != val:
            self.__pageId = val
            self.pageIdChanged.emit(self.__pageId)

    pageId = Property(str, fget=getPageId, fset=setPageId, notify=pageIdChanged)

    def getTitle(self) -> str:
        return self.__title

    def setTitle(self, val: str) -> None:
        if self.__title != val:
            self.__title = val
            self.titleChanged.emit(self.__title)

    title = Property(str, fget=getTitle, fset=setTitle, notify=titleChanged)

    def getQmlPath(self) -> str:
        return self.__qmlPath

    def setQmlPath(self, val: str) -> None:
        if self.__qmlPath != val:
            self.__qmlPath = val
            self.qmlPathChanged.emit(self.__qmlPath)

    qmlPath = Property(str, fget=getQmlPath, fset=setQmlPath, notify=qmlPathChanged)
