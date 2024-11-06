*** Comments ***
Documentation
...Suite with bag tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot
Resource            ../../main/pages/store/bag.robot
 
Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***

Test Case 001: Schedule Delivery [QAPTZ-1366]
    Given im on the app        ${MainUser}        ${MainPassword}
    And click in recommended product
    When Add Product To Bag And Click Payment And Schedule Devilery
    And Pay Product With Credit Card
    And Go To My Orders After Buy a Product
    And Click on ${OrderNumber}
    And Click the cancel button
    And Click to start cancellation
    And Select the reason
    And Select the refund method ${PixOrCreditCard} 
    And Confirm the cancellation request        Estorno no Cartão
    Then Should cancel the order successfully 