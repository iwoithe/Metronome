# Import from `app.constants` not `app` to avoid circular import
from app.constants import Constants

from PySide6.QtCore import QObject, Property, Slot


class AboutSettingsModel(QObject):
    def __init__(self) -> None:
        QObject.__init__(self)

    def getAppName(self) -> str:
        return Constants.APP_NAME

    appName = Property(str, fget=getAppName)

    def getAppVersion(self) -> str:
        return str(Constants.APP_VERSION)

    appVersion = Property(str, fget=getAppVersion)

    def getAppAuthor(self) -> str:
        return Constants.APP_AUTHOR

    appAuthor = Property(str, fget=getAppAuthor)

    @Slot()
    def load(self) -> None:
        pass
