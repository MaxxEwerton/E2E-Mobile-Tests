*** Comments ***
Documentation
...Suite with bag tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot
Resource            ../../main/pages/store/bag.robot
Resource            ../../main/pages/store/payments.robot

Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***

Test Case 001: Buy With Pix [QAPTZ-1475] [QAPTZ-1485] [QAPTZ-1365]
    Given im on the app        ${MainUser}        ${MainPassword}
    And click in recommended product
    When Add Product To Bag and Click Payment
    Then Pay Product With Pix
    And Go To My Orders After Buy a Product
    And Click on ${OrderNumber}
    And Click the cancel button
    And Click to start cancellation
    And Select the reason
    And Select the refund method ${PixOrCreditCard} 
    And Confirm the cancellation request        Estorno via Pix
    Then Should cancel the order successfully

Test Case 002: Buy With Credit Card [QAPTZ-1474] [QAPTZ-1488]
    Given im on the app        ${MainUser}        ${MainPassword}
    And click in recommended product
    When Add Product To Bag and Click Payment
    And Pay Product With Credit Card
    And Go To My Orders After Buy a Product
    And Click on ${OrderNumber}
    And Click the cancel button
    And Click to start cancellation
    And Select the reason
    And Select the refund method ${PixOrCreditCard} 
    And Confirm the cancellation request        Estorno no Cartão
    Then Should cancel the order successfully

Test Case 002: Buy With Boleto [QAPTZ-1476] [QAPTZ-1486]
    Given im on the app        ${MainUser}        ${MainPassword}
    And click in recommended product
    When Add Product To Bag and Click Payment
    And Pay Product With Boleto
    And Go To My Orders After Buy a Product
    And Click on ${OrderNumber}
    And Click the cancel button
    And Click to start cancellation
    And Select the reason
    And Select the refund method ${Refund}
    And Confirm the cancellation request    Vale-troca  
    Then Should cancel the order successfully
