import pytest

@pytest.fixture(params=["a","b"])
def allParams(request):
    print(request.param)


def testAddItemtoCart(allParams):
    print("item added successfully")