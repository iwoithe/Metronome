from framework.types import TimeSignature, TimeSignatureCursor

from PySide6.QtCore import QAbstractListModel, QTimer, Slot, Signal, Property, QObject, QUrl
from PySide6.QtMultimedia import QMediaPlayer, QAudioOutput

from .accentsmodel import AccentsModel

import share.resources


class PlaybackModel(QAbstractListModel):
    accentsModelChanged = Signal(AccentsModel)

    def __init__(self) -> None:
        QAbstractListModel.__init__(self)

        self.__accentsModel: AccentsModel = None

        self.__bpm = 120

        self.__intervalTimer = QTimer(self)
        self.__intervalTimer.timeout.connect(self.playSound)

        self.__timeSignature = TimeSignature(4, 4)
        self.__cursor = TimeSignatureCursor(self.__timeSignature)

        self.__accentOutput: QAudioOutput = QAudioOutput()
        self.__accentMediaPlayer: QMediaPlayer = QMediaPlayer()
        self.__accentMediaPlayer.setAudioOutput(self.__accentOutput)
        self.__accentMediaPlayer.setSource(QUrl("qrc:/audio/defaults/accent.wav"))

        self.__normalOutput: QAudioOutput = QAudioOutput()
        self.__normalMediaPlayer: QMediaPlayer = QMediaPlayer()
        self.__normalMediaPlayer.setAudioOutput(self.__normalOutput)
        self.__normalMediaPlayer.setSource(QUrl("qrc:/audio/defaults/normal.wav"))

    def accentsModel(self) -> QObject:
        return self.__accentsModel

    def setAccentsModel(self, val: QObject) -> None:
        if self.__accentsModel != val:
            self.__accentsModel = val
            self.accentsModelChanged.emit(self.__accentsModel)

    accentsModel = Property(QObject, fget=accentsModel, fset=setAccentsModel, notify=accentsModelChanged)

    @Slot()
    def play(self) -> None:
        self.__cursor.reset()
        self.playSound()
        self.__intervalTimer.setInterval(self.bpmToMilliseconds())
        self.__intervalTimer.start()

    def playSound(self) -> None:
        curBeat: int = self.__cursor.currentBeat()

        if self.__accentsModel.isAccented(curBeat):
            if self.__accentMediaPlayer.mediaStatus == QMediaPlayer.PlaybackState.PlayingState:
                self.__accentMediaPlayer.stop()

            self.__accentMediaPlayer.play()
        else:
            if self.__normalMediaPlayer.mediaStatus == QMediaPlayer.PlaybackState.PlayingState:
                self.__normalMediaPlayer.stop()

            self.__normalMediaPlayer.play()

        self.__cursor.setBeat(self.__cursor.nextBeat())

    @Slot()
    def stop(self) -> None:
        self.__intervalTimer.stop()
        self.__accentMediaPlayer.stop()
        self.__normalMediaPlayer.stop()

    def bpmToMilliseconds(self) -> float:
        return 60_000 / self.__bpm
