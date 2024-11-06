*** Comments ***
Documentation
... Suite with login variables

*** Settings ***
Resource    ../../support/base.robot

*** Variables ***
${LoginVariable}            loginVariable

*** Keywords ***

Define keyword
    Wait Until Element Is Visible        $${LoginVariable}