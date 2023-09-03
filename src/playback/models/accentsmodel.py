from PySide6.QtCore import QObject, Slot

from pydispatch import dispatcher


class AccentsModel(QObject):
    # TODO: Receive changes from time signature
    def __init__(self) -> None:
        QObject.__init__(self)

        self.__accentsData = {}

        dispatcher.connect(self.setNumerator, "numeratorChanged")

    @Slot(int, result=bool)
    def isAccented(self, beatNum: int) -> bool:
        return self.__accentsData[beatNum]

    def resetData(self) -> None:
        self.__accentsData = {}

    @Slot(int, bool)
    def setAccent(self, beatNum: int, val: bool = True) -> None:
        self.__accentsData[beatNum] = val

    @Slot(int)
    def setNumerator(self, val: int) -> None:
        self.resetData()
        for i in range(val):
            if i == 0:
                self.__accentsData[i + 1] = True
            else:
                self.__accentsData[i + 1] = False
