import typing
from enum import Enum


class RetCode(Enum):
    UNDEFINED = -1,
    OK = 0,
    UNKNOWN_ERROR = 1,

    CANCEL = 2,
    NOT_SUPPORTED = 3,
    NOT_IMPLEMENTED = 4

    def __ge__(self, other) -> bool:
        return int(self.value) >= int(other.value)

    def __gt__(self, other) -> bool:
        return int(self.value) > int(other.value)

    def __le__(self, other) -> bool:
        return int(self.value) <= int(other.value)

    def __lt__(self, other) -> bool:
        return int(self.value) < int(other.value)

    def __str__(self) -> str:
        return self.name.replace("_", " ").title()


class Ret:
    def __init__(self, code: RetCode = RetCode.UNDEFINED, text: str = "", data: typing.Any = None) -> None:
        self.__code = code
        self.__data = data
        self.__text = text

    def __str__(self) -> str:
        return "[" + str(self.__code) + "] " + self.__text

    def __eq__(self, other) -> bool:
        return self.__code == other.__code

    def __ne__(self, other) -> bool:
        return self.__code != other.__code

    def code(self) -> RetCode:
        return self.__code

    def setCode(self, code: RetCode) -> None:
        self.__code = code

    def data(self) -> typing.Any:
        return self.__data

    def setData(self, data: typing.Any) -> None:
        self.__data = data

    def text(self) -> str:
        return self.__text

    def setText(self, text: str) -> None:
        self.__text = text

    def valid(self) -> bool:
        return self.__code > RetCode.UNDEFINED

    def success(self) -> bool:
        return self.__code == RetCode.OK
