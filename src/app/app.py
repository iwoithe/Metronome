from PySide6.QtGui import QApplication

from app.constants import Constants

class App:
    def run(self) -> int:
        app = QApplication(sys.argv)
        app.setApplicationName(Constants.APP_NAME)
        app.setOrganizationName(Constants.APP_AUTHOR)
        app.setApplicationVersion(str(Constants.APP_VERSION))

        engine = QQmlApplicationEngine()

        engine.quit.connect(app.quit)
        # TODO: Add main.qml file
        # engine.load("qrc:/appshell/main.qml")

        return app.exec()
