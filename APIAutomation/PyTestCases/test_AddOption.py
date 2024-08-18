import pytest

@pytest.fixture()
def setUp():
    print("Open Browser")
    if browser == "Chrome" :
        print("Launch Chrome")
    elif browser == "ff" :
        print("Launch Firefox")

    else:
        print("provide valid browser")

    print("Select Item")
    yield
    print("Close browser")


def pytest_addoption(parser):
    parser.addoption("--browser")

@pytest.fixture(scope="session")
def browser(request):
    return request.config.getoption("--browser")

def testAddItemtoCart(setUp):
    print("item added successfully")