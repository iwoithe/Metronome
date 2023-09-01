from PySide6.QtCore import QObject, Slot, Property, Signal

from framework.types import TimeSignature

from pydispatch import dispatcher


class TimeSignatureSettingsModel(QObject):
    numeratorChanged = Signal(int, arguments=["numerator"])
    denominatorChanged = Signal(int, arguments=["denominator"])

    def __init__(self) -> None:
        QObject.__init__(self)
        self.__timeSignature: TimeSignature = TimeSignature()

    def getNumerator(self) -> int:
        return self.__timeSignature.numerator()

    def setNumerator(self, val: int) -> None:
        self.__timeSignature.setNumerator(val)
        dispatcher.send("numeratorChanged", self, self.__timeSignature.numerator())
        self.numeratorChanged.emit(self.__timeSignature.numerator())

    numerator = Property(int, fget=getNumerator, fset=setNumerator, notify=numeratorChanged)

    def getDenominator(self) -> int:
        return self.__timeSignature.denominator()

    def setDenominator(self, val: int) -> None:
        self.__timeSignature.setDenominator(val)
        dispatcher.send("denominatorChanged", self, self.__timeSignature.denominator())
        self.denominatorChanged.emit(self.__timeSignature.denominator())

    denominator = Property(int, fget=getDenominator, fset=setDenominator, notify=denominatorChanged)

    @Slot()
    def load(self) -> None:
        pass
