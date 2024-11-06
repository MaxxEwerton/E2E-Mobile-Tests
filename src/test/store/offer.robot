*** Comments ***
Documentation
...Suite with offer tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot
Resource            ../../main/pages/store/offer.robot
 
Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***

Test Case 001: Offer To Active [QAPTZ-1472]
    Given that I'm a new user
    And i click in my offers
    When i validate offer page
    Then i click in active offer


Test Case 002: Activated Offer [QAPTZ-1473]
    Given that I'm a new user
    And i click in my offers
    And i validate offer page
    When i click in active offer
    Then i click in actives tab



