*** Comments ***
Documentation
...Suite with new user tests

*** Settings ***    
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/new-user.robot

Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: Buy With Credit Card
    Given that I'm a new user
    And Search Expensive Product    ${RoyalCaninProductName}    ${RoyalCaninProductselect}
    Add Product To Bag And Remove It
    And Search Product Snack Hana Cheap    ${SnackHanaProductName}    ${SnackHanaProductselect}
    When Add Product To Bag And Fill New Adresses
    Then Pay Product With Credit Card
    And Go To My Orders After Buy a Product
    And Click on ${OrderNumber}
    And Click the cancel button
    And Click to start cancellation
    And Select the reason
    And Select the refund method ${PixOrCreditCard} 
    And Confirm the cancellation request    Estorno no Cartão
    Then Should cancel the order successfully
#
#Test Case 002: Buy With Pix
#    Given that I'm a new user
#    And Search Expensive Product    ${RoyalCaninProductName}    ${RoyalCaninProductselect}
#    Add Product To Bag And Remove It
#    And Search Product Snack Hana Cheap    ${SnackHanaProductName}    ${SnackHanaProductselect}
#    When Add Product To Bag And Fill New Adresses
#    Then Pay Product With Pix
#    And Go To My Orders After Buy a Product
#    And Click on ${OrderNumber}
#    And Click the cancel button
#    And Click to start cancellation
#    And Select the reason
#    And Select the refund method ${PixOrCreditCard} 
#    And Confirm the cancellation request    Estorno via Pix
#    Then Should cancel the order successfully
#
#Test Case 003: Buy With Boleto
#    Given that I'm a new user
#    And Search Expensive Product    ${RoyalCaninProductName}    ${RoyalCaninProductselect}
#    Add Product To Bag And Remove It
#    And Search Product Snack Hana Cheap    ${SnackHanaProductName}    ${SnackHanaProductselect}
#    When Add Product To Bag And Fill New Adresses
#    Then Pay Product With Boleto
#    And Go To My Orders After Buy a Product
#    And Click on ${OrderNumber}
#    And Click the cancel button
#    And Click to start cancellation
#    And Select the reason
#    And Select the refund method ${Refund}
#    And Confirm the cancellation request    Vale-troca  
#    Then Should cancel the order successfully