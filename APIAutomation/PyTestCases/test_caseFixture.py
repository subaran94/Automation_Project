import pytest

@pytest.fixture()
def setUp():
    print("Open Browser")
    print("Select Item")
    yield
    print("Close browser")

def testAddItemtoCart(setUp):
    print("item added successfully")

def test_RemoveItemFromCart(setUp):
    print("item removed from cart")

def testAdd2ndItemtoCart(tc_setup):
    print("2nd item added successfully")

def test_Remove2ndItemFromCart(tc_setup):
    print("2nd item removed from cart")

