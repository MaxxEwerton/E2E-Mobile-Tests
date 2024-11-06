*** Comments ***
Documentation
...Suite with favorite tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot
 
Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: favoritar and unfavorite [QAPTZ-1375]
    Given im on the app     ${MainUser}        ${MainPassword}
    And click in find field
    When search product        racao 
    Then should return the searched result

    And I click in first product
    And I click to favorite
    And I back to store pages
    When Access Favorites on Menu Lateral  
    Then The favorited product must be displayed

    When I click to unfavorite
    Then the favorited product should not be displayed

