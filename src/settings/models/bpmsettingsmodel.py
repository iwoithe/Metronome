from PySide6.QtCore import QObject, Signal, Property, Slot


class BpmSettingsModel(QObject):
    bpmChanged = Signal(int, arguments=["bpm"])

    def __init__(self) -> None:
        QObject.__init__(self)

        self.__bpm: int = 120

    def bpm(self) -> int:
        return self.__bpm

    def setBpm(self, val: int) -> None:
        if self.__bpm != val:
            self.__bpm = val
            self.bpmChanged.emit(self.__bpm)

    bpm = Property(int, fget=bpm, fset=setBpm, notify=bpmChanged)

    @Slot()
    def load(self) -> None:
        pass
