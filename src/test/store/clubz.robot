*** Comments ***
Documentation
...Suite with find tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot
Resource            ../../main/pages/store/clubz.robot

Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: validate clubz page
    Given im on the app     ${MainUser}        ${MainPassword}
    When Access the clubz page
    Then i validate clubz page and payment page