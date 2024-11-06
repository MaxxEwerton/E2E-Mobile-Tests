*** Comments ***
Documentation
...Suite with lateral menu tests

*** Settings ***
Resource            ../../main/support/base.robot

Test Setup          Open App
Test Teardown       Close App

# *** Test Cases ***
# Test Case 001: name of test
#     Given im on the app        ${InitialAccount}    ${InitialPassword}