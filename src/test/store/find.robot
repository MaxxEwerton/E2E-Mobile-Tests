*** Comments ***
Documentation
...Suite with find tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot
 
Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***

Test Case 001: busca simples [QAPTZ-1377]
    Given im on the app     ${MainUser}        ${MainPassword}
    And click in find field
    When search product        racao 
    Then should return the searched result

Test Case 002: busca mais pesquisados [QAPTZ-1378]
    Given im on the app     ${MainUser}        ${MainPassword}
    And click in find field
    When click in the most searched products
    Then should return the most shearched result
