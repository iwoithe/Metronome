from framework.types import Ret, RetCode


def testRetCode__str__() -> None:
    assert str(RetCode.NOT_SUPPORTED) == "Not Supported"


def testCustomRetCode() -> None:
    # TODO: How to extend enumerations
    # TypeError: ModuleCodes: cannot extend enumeration 'RetCode'
    class ModuleCodes(RetCode):
        CUSTOM_ERROR = 10

    ret: Ret = Ret(ModuleCodes.CUSTOM_ERROR, "Custom error")
    assert str(ret) == "[Custom Error] Custom error"


def testRet__str__() -> None:
    ret: Ret = Ret(RetCode.NOT_IMPLEMENTED, "This feature has not been implemented yet")
    assert str(ret) == "[Not Implemented] This feature has not been implemented yet"


def testRet__eq__() -> None:
    left: Ret = Ret(RetCode.CANCEL, "Dialog closed by user")
    right: Ret = Ret(RetCode.CANCEL, "Some completely different text")

    assert left == right


def testRet__ne__() -> None:
    left: Ret = Ret(RetCode.CANCEL, "Dialog closed by user")
    right: Ret = Ret(RetCode.OK)

    assert left != right


def testRetNot() -> None:
    # TODO: Override not operator in Ret
    # ret: Ret = Ret(RetCode.NOT_IMPLEMENTED)
    # assert !ret == True
    pass


def testRetValid() -> bool:
    # TODO: Fix these tests
    ret: Ret = Ret(RetCode.UNDEFINED)
    assert ret.valid() is False

    ret = Ret(RetCode.NOT_SUPPORTED)
    assert ret.valid() is True


def testRetSuccess() -> None:
    ret: Ret = Ret(RetCode.UNKNOWN_ERROR)
    assert ret.success() is False

    ret = Ret(RetCode.OK)
    assert ret.success() is True
