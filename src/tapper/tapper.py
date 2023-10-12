import time


class Tapper:
    # Based on https://github.com/blurks/taptempo/blob/main/src/taptempo/taptempo.py
    def __init__(self) -> None:
        self.firstTap: int = 0
        self.lastTap: int = 0
        self.totalTaps: int = 0
        self.bpm = 0
        self.bpmMean: int = 0

        self.reset()

    def reset(self) -> None:
        self.firstTap = 0
        self.lastTap = 0
        self.totalTaps = 0
        self.bpm = 0
        self.bpmMean = 0

    def tap(self) -> int:
        tap = time.time()
        if self.totalTaps <= 0:
            self.firstTap = tap
            self.lastTap = tap
        else:
            self.bpm = 60 / (tap - self.lastTap)
            self.bpmMean = 60 / ((tap - self.firstTap) / self.totalTaps)

        self.totalTaps += 1
        self.lastTap = tap
        return int(self.bpm)
