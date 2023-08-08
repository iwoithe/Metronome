from .timesignature import TimeSignature


class TimeSignatureCursor:
    def __init__(self, ts: TimeSignature = TimeSignature(4, 4)) -> None:
        self.__curBeat = 1
        self.__timeSignature = ts

    def currentBeat(self) -> int:
        return self.__curBeat

    def nextBeat(self) -> int:
        if self.__curBeat + 1 <= self.__timeSignature.numerator():
            return self.__curBeat + 1
        else:
            return 1

    def previousBeat(self) -> int:
        if self.__curBeat - 1 >= 1:
            return self.__curBeat - 1
        else:
            return self.__timeSignature.numerator()

    def reset(self) -> None:
        self.__curBeat = 1

    def setBeat(self, val: int) -> None:
        self.__curBeat = val
