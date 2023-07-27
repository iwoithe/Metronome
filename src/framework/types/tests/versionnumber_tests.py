from framework.types import VersionNumber, VersionNumberSuffix


def testVersionNumberMajor():
    versionNumber: VersionNumber = VersionNumber(1, 0, 0)
    assert versionNumber.major == 1


def testVersionNumberMinor():
    versionNumber: VersionNumber = VersionNumber(0, 3, 0)
    assert versionNumber.minor == 3


def testVersionNumberMicro():
    versionNumber: VersionNumber = VersionNumber(0, 0, 2)
    assert versionNumber.micro == 2


def testVersionNumberSuffix():
    versionNumber: VersionNumber = VersionNumber(4, 1, 0, VersionNumberSuffix.DEVELOPMENT)
    assert versionNumber.suffix == VersionNumberSuffix.DEVELOPMENT


def testVersionNumberSuffixNum():
    versionNumber: VersionNumber = VersionNumber(3, 2, 0, VersionNumberSuffix.BETA, 2)
    assert versionNumber.suffixNum == 2


def testVersionNumber__str__():
    versionNumber: VersionNumber = VersionNumber(4, 1, 0, VersionNumberSuffix.ALPHA, 2)
    assert str(versionNumber) == "4.1.0-alpha.2"

    versionNumber = VersionNumber(2, 3, 1, VersionNumberSuffix.RELEASE)
    assert str(versionNumber) == "2.3.1"
