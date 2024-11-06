*** Comments ***
Documentation
... Suite with my pets variables

*** Settings ***
Resource    ../../support/base.robot

*** Variables ***
${NewUserVariable}            loginVariable

*** Keywords ***

Define keyword
    Wait Until Element Is Visible        $${NewUSerVariable}