from enum import Enum


class VersionNumberSuffix(Enum):
    ALPHA = 1
    BETA = 2
    DEVELOPMENT = 3
    RELEASE = 4
    RELEASE_CANDIDATE = 5

    @staticmethod
    def toString(suffix) -> str:
        # TODO: Use match statement (need to update Python)
        if suffix == VersionNumberSuffix.ALPHA:
            return "alpha"
        elif suffix == VersionNumberSuffix.BETA:
            return "beta"
        elif suffix == VersionNumberSuffix.DEVELOPMENT:
            return "dev"
        elif suffix == VersionNumberSuffix.RELEASE:
            return "release"
        elif suffix == VersionNumberSuffix.RELEASE_CANDIDATE:
            return "release candidate"
        else:
            return ""


class VersionNumber:
    def __init__(self, major: int, minor: int, micro: int, suffix: VersionNumberSuffix = VersionNumberSuffix.RELEASE,
                 suffixNum: int = 0) -> None:
        self.major = major
        self.minor = minor
        self.micro = micro
        self.suffix = suffix
        self.suffixNum = suffixNum

    def __str__(self) -> str:
        suffix: str = ""
        if self.suffix != VersionNumberSuffix.RELEASE:
            suffix = "-" + VersionNumberSuffix.toString(self.suffix)

        suffixNum: str = ""
        if self.suffix not in [VersionNumberSuffix.DEVELOPMENT, VersionNumberSuffix.RELEASE]:
            suffixNum = "." + str(self.suffixNum)

        return f"{self.major}.{self.minor}.{self.micro}{suffix}{suffixNum}"
