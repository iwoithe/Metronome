from PySide6.QtCore import QAbstractListModel, Qt


class SettingsModel(QAbstractListModel):
    def __init__(self) -> None:
        QAbstractListModel.__init__(self)

        self.__pages = []
        self.__currentPage = 0

    def rowCount(self, parent) -> int:
        return len(self.__pages)

    def data(self, index, role):
        if (role == Qt.DisplayRole and
            index.row() >= 0 and
            index.row() < len(self.__pages) and
            index.column() == 0):
            return self.__pages[index.row()]
        else:
            return None
