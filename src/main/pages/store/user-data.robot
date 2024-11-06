*** Comments ***
Documentation
... Suite with login variables

*** Settings ***
Resource    ../../support/base.robot

*** Variables ***
${UserDataVariable}            userDataVariable

*** Keywords ***

Define keywords
    Wait Until Element Is Visible        ${UserDataVariable}