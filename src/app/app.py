import sys
import logging

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterUncreatableType

from .constants import Constants

import appshell.module

from framework.ui import Theme


class App:
    # Singleton object definitions
    # Must last the lifetime of this class or QML reference will be null
    theme: Theme = Theme()

    def __init__(self) -> None:
        # TODO: Add a logging class
        logging.basicConfig(level=logging.DEBUG)

        self.app = QGuiApplication(sys.argv)
        self.app.setApplicationName(Constants.APP_NAME)
        self.app.setOrganizationName(Constants.APP_AUTHOR)
        self.app.setApplicationVersion(str(Constants.APP_VERSION))

        self.engine: QQmlApplicationEngine = None

    def initTypes(self) -> None:
        # TODO: Ideally want to use qmlRegisterUncreatableType for singleton objects
        # qmlRegisterUncreatableType(Theme, "Metronome.Ui", 1, 0, "Theme", "Cannot create a Theme")
        self.engine.rootContext().setContextProperty("Theme", self.theme)

    def run(self) -> int:
        logging.debug(Constants.APP_NAME + " " + str(Constants.APP_VERSION))
        self.engine = QQmlApplicationEngine()

        self.initTypes()

        if Constants.DEBUG:
            self.engine.warnings.connect(lambda text: print(text))

        self.engine.quit.connect(self.app.quit)
        self.engine.load(QUrl("qrc:/qml/main.qml"))

        if not self.engine.rootObjects():
            return -1

        return self.app.exec()
