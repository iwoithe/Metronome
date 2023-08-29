from PySide6.QtCore import QObject, Slot


class AccentsSettingsModel(QObject):
    def __init__(self) -> None:
        QObject.__init__(self)

    @Slot()
    def load(self) -> None:
        pass
