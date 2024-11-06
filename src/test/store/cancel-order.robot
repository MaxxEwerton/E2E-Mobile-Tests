*** Comments ***
Documentation
...Suite Order Cancellation Tests

*** Settings ***
Resource            ../../main/support/base.robot

Test Setup          Open App   
#  Run Keywords  
# ...                 Open App 
# ...                 im on the app   bug@gmail.com    123456
Test Teardown       Close App

*** Variables ***
${CreditCard}       2
${Pedido}           256033157

# *** Test Cases ***
# Test Case 001: Order cancellation with credit card
#     [Tags]   smoke
#     Efetuar login ${email} ${senha}    
#     Go to my orders
#     Click on 256033157
#     Click the cancel button
#     Click to start cancellation
#     Select the reason
#     Select the refund method ${CreditCard}  
#     Confirm the cancellation request
#     Should cancel the order successfully
