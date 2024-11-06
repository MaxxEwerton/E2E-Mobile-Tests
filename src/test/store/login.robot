*** Comments ***
Documentation
...Suite with login tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot

Test Setup          Run keywords
...                 Open App            
...                 Read CVC Data Prd   
Test Teardown       Close App

*** Test Cases ***
#Test Case 001: Login With Success
#    Given im on the app        ${user[-1].EMAIL}     ${user[-1].SENHA}
#     And Search Product    ${SnackHanaProductName}    ${SnackHanaProductselect}
#     When Add Product To Bag
#     Then Pay Product With Pix

# Test Case 001: Login With Success
#     Given im on the app        ${InitialAccount}    ${InitialPassword}
#     And Search Product    ${SnackHanaProductName}    ${SnackHanaProductselect}
#     When Add Product To Bag
#     Then Pay Product With Boleto