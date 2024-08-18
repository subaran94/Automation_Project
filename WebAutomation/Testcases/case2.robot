*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}   chrome
${url}   https://demo.nopcommerce.com/


*** Test Cases ***
LoginTest
    open browser    ${url}   ${browser}
    click link  xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
    input text  id:Email    deniyalsubaran@gmail.com
    input text  id:Password     9852071834
    click element   xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/button
    Sleep   20
    close browser

*** Keywords ***

