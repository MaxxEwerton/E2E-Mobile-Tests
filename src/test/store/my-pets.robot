*** Comments ***
Documentation
...Suite with my pets tests

*** Settings ***    
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/my-pets.robot
 
Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: Validate register pet [QAPTZ-1372]
   [Documentation]    O cenário em questão valida a tela de
   ...    cadastro de dados do pet
   [Tags]    Regression    Positive    Pets
   Given im on the app        ${MainUser}    ${MainPassword}
   And Access My Pets
   Then Register a new pet

Test Case 002: Validate edit pet [QAPTZ-1373]
   [Documentation]    O cenário em questão valida a tela de
   ...    edicao de dados do pet e todas as outras antes dela
   [Tags]    Regression    Positive    Pets
   Given im on the app        ${MainUser}    ${MainPassword}
   And Access My Pets
   Then Update a pet registered

Test Case 003: delete a pet registered [QAPTZ-1374]
    [Documentation]    O cenário em questão valida a tela de
    ...    deleção de dados do pet e todas as outras antes dela
    [Tags]    Regression    Positive    Pets
    Given im on the app        ${MainUser}    ${MainPassword}
    And Access My Pets
    Then delete a pet registered