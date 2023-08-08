from .models.accentsmodel import AccentsModel
from .models.playbackmodel import PlaybackModel

from PySide6.QtQml import qmlRegisterType


def registerTypes() -> None:
    qmlRegisterType(AccentsModel, "Metronome.Playback", 1, 0, "AccentsModel")
    qmlRegisterType(PlaybackModel, "Metronome.Playback", 1, 0, "PlaybackModel")
