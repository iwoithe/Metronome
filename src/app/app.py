import sys
import logging

from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtWidgets import QApplication

import appshell.module

from .constants import Constants


class App:
    def run(self) -> int:
        # TODO: Add a logging class
        logging.basicConfig(level=logging.DEBUG)
        logging.debug(Constants.APP_NAME + " " + str(Constants.APP_VERSION))

        app = QApplication(sys.argv)
        app.setApplicationName(Constants.APP_NAME)
        app.setOrganizationName(Constants.APP_AUTHOR)
        app.setApplicationVersion(str(Constants.APP_VERSION))

        engine = QQmlApplicationEngine()

        engine.quit.connect(app.quit)
        engine.load(":/qml/main.qml")

        return app.exec()
