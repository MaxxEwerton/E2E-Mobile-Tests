*** Comments ***
Documentation
...Suite tests to signature

*** Settings ***    
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/subscription.robot
Resource            ../../main/pages/store/bag.robot

Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: Subscription Enrollment Validations [QAPTZ-1383]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Add Product To Bag
    When Activate Predefined Frequency Subscription
    And Go To The Payment Screen
    And Not Confirm The Subscription Terms
    Then Should Remove The Product Subscription
    And Delete Product From Bag

Test Case 002: Subscription Cancellation Validations [QAPTZ-1384]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Add Product To Bag
    When Activate Other Frequency Subscription
    And Go To The Payment Screen
    And Confirm The Subscription Terms
    Then Should Remove The Product Subscription
    And Delete Product From Bag