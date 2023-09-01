class TimeSignature:
    def __init__(self, n: int = 4, d: int = 4) -> None:
        self.__numerator: int = n
        self.__denominator: int = d

    def numerator(self) -> int:
        return self.__numerator

    def setNumerator(self, val: int) -> None:
        if self.__numerator != val:
            self.__numerator = val

    def denominator(self) -> int:
        return self.__denominator

    def setDenominator(self, val: int) -> None:
        if self.__denominator != val:
            self.__denominator = val
