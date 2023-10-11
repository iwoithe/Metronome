import sys
import logging

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterUncreatableType

from .constants import Constants

import appshell.resources
import framework.uicomponents.resources
import framework.ui
import playback
import settings



class App:
    def __init__(self) -> None:
        # TODO: Add a logging class
        logging.basicConfig(level=logging.DEBUG)

        self.app = QGuiApplication(sys.argv)
        self.app.setApplicationName(Constants.APP_NAME)
        self.app.setOrganizationName(Constants.APP_AUTHOR)
        self.app.setApplicationVersion(str(Constants.APP_VERSION))

        self.engine: QQmlApplicationEngine = None

    def initTypes(self) -> None:
        framework.ui.registerTypes()
        playback.registerTypes()
        settings.registerTypes()

    def run(self) -> int:
        logging.debug(Constants.APP_NAME + " " + str(Constants.APP_VERSION))
        self.engine = QQmlApplicationEngine()
        self.engine.addImportPath(":/qml")

        self.initTypes()

        if Constants.DEBUG:
            self.engine.warnings.connect(lambda text: print(text))

        self.engine.quit.connect(self.app.quit)
        self.engine.load(QUrl("qrc:/qml/main.qml"))

        if not self.engine.rootObjects():
            return -1

        return self.app.exec()
