*** Comments ***
Documentation
...Suite with new user tests

*** Settings ***    
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/service-drawer.robot

Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: Service Store Validations [QAPTZ-1379]
    Given im on the app        ${MainUser}        ${MainPassword}
    And I Click On The Services Drawer Menu
    When Validate and Click    ${EcosystemsStore}
    Then I Should Be Redirected To Store Page

Test Case 002: Service Grooming Validations [QAPTZ-1381]
    Given im on the app        ${MainUser}        ${MainPassword}
    And I Click On The Services Drawer Menu
    When Validate and Click    ${EcosystemsBeT} 
    Then I Should Be Redirected To Grooming Page

Test Case 003: Service Seres Validations [QAPTZ-1382]
    Given im on the app        ${MainUser}        ${MainPassword}
    And I Click On The Services Drawer Menu
    When Validate and Click    ${EcosystemsSeres}
    Then I Should Be Redirected To Seres Page

Test Case 004: Service Blog Validations [QAPTZ-1380]
    Given im on the app        ${MainUser}        ${MainPassword}
    And I Click On The Services Drawer Menu
    When Validate and Click    ${EcosystemsBlog}
    Then I Should Be Redirected To Blog Page