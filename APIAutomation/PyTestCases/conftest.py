import pytest

@pytest.fixture()
#@pytest.fixture(autouse=True)
def tc_setup():
    print("Open Browser")
    print("Login")
    print("Select Item")
    yield
    print("logoff")
    print("Close browser")