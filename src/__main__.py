import os
import sys

from app import App

if sys.platform == "win32":
    os.environ['QT_MULTIMEDIA_PREFERRED_PLUGINS'] = 'windowsmediafoundation'

if __name__ == "__main__":
    app = App()
    ret = app.run()
    sys.exit(ret)
