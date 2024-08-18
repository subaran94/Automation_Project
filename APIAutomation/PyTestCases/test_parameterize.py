import pytest


@pytest.mark.parametrize("a, b, final", [(2, 3, 5),(4, 7, 9),(5, 7, 12)])
def testAdd(a, b, final):
    assert a+b == final