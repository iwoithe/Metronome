from enum import Enum

class VersionNumberSuffix(Enum):
    ALPHA
    BETA
    DEVELOPMENT
    RELEASE
    RELEASE_CANDIDATE

    @staticmethod
    def toString(suffix: VersionNumberSuffix) -> str:
        match suffix:
            VersionNumberSuffix.ALPHA:
                return "alpha"
                break
            VersionNumberSuffix.BETA:
                return "beta"
                break
            VersionNumberSuffix.DEVELOPMENT:
                return "dev"
                break
            VersionNumberSuffix.RELEASE:
                return "release"
                break
            VersionNumberSuffix.RELEASE_CANDIDATE:
                return "release candidate"
                break
            break

class VersionNumber():
    def __init__(self, major: int, minor: int, micro: int, suffix: VersionNumberSuffix = VersionNumberSuffix.RELEASE, suffixNum: int = 0) -> None:
        self.major = major
        self.minor = minor
        self.micro = micro
        self.suffix = suffix
        self.suffixNum = suffixNum

    def __str__(self) -> str:
        return f"{self.major}.{self.minor}.{self.micro}-{VersionNumberSuffix.toString(self.suffix) if self.suffix != VersionNumberSuffix.RELEASE}{"." if self.suffix != VersionNumberSuffix.RELEASE}{self.suffixNum if self.suffix !=(VersionNumberSuffix.DEVELOPMENT | VersionNumberSuffix().RELEASE)}"
