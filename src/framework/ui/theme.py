from PySide6.QtCore import QObject, Slot


class Colors:
    DARK_ACTIVE_COLOR = "#A3A8FF"
    DARK_BACKGROUND_COLOR = "#000114"
    DARK_FOREGROUND_COLOR = "#E8E8E8"
    DARK_INACTIVE_COLOR = "#5A5A5A"
    DARK_INVERTED_FOREGROUND_COLOR = "#000114"
    DARK_PLACEHOLDER_COLOR = "#5A5A5A"

    LIGHT_ACTIVE_COLOR = "#A3A8FF"
    LIGHT_BACKGROUND_COLOR = "#E8E8E8"
    LIGHT_FOREGROUND_COLOR = "#000114"
    LIGHT_INACTIVE_COLOR = "#5A5A5A"
    LIGHT_INVERTED_FOREGROUND_COLOR = "#000114"
    LIGHT_PLACEHOLDER_COLOR = "#5A5A5A"


class Theme(QObject):
    def __init__(self) -> None:
        QObject.__init__(self)
        self.__isDarkMode = True

    @Slot(result=str)
    def activeColor(self) -> str:
        if self.__isDarkMode:
            return Colors.DARK_ACTIVE_COLOR
        else:
            return Colors.LIGHT_ACTIVE_COLOR

    @Slot(result=str)
    def backgroundColor(self) -> str:
        if self.__isDarkMode:
            return Colors.DARK_BACKGROUND_COLOR
        else:
            return Colors.LIGHT_BACKGROUND_COLOR

    @Slot(result=str)
    def foregroundColor(self) -> str:
        if self.__isDarkMode:
            return Colors.DARK_FOREGROUND_COLOR
        else:
            return Colors.LIGHT_FOREGROUND_COLOR

    @Slot(result=str)
    def inactiveColor(self) -> str:
        if self.__isDarkMode:
            return Colors.DARK_INACTIVE_COLOR
        else:
            return Colors.LIGHT_INACTIVE_COLOR

    @Slot(result=str)
    def invertedForegroundColor(self) -> str:
        if self.__isDarkMode:
            return Colors.DARK_INVERTED_FOREGROUND_COLOR
        else:
            return Colors.LIGHT_INVERTED_FOREGROUND_COLOR

    @Slot(result=str)
    def placeholderColor(self) -> str:
        if self.__isDarkMode:
            return Colors.DARK_PLACEHOLDER_COLOR
        else:
            return Colors.LIGHT_PLACEHOLDER_COLOR
