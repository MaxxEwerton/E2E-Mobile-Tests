*** Comments ***
Documentation
...Suite with new user tests


*** Settings ***    
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/new-user.robot
Resource            ../../main/pages/store/categories.robot
 
Test Setup          Open App
Test Teardown       Close App


*** Test Cases ***
Test Case 001: Dog Category Validations [QAPTZ-1464]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Click Home Category    Cachorro
    And Validate Dog Category
    When I Click On Category  RAÇÃO
    And I Click On Category   RAÇÃO SECA
    And I Click On The First Product Displayed On The Page
    Then I Should Be Redirected To The Product Detail Page
 
Test Case 002: Cat Category Validations [QAPTZ-1465]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Click Home Category   Gato
    And Validate Cat Category
    When I Click On Category  ARRANHADORES E BRINQUEDOS
    And I Click On Category   ARRANHADORES
    And I Click On The First Product Displayed On The Page
    Then I Should Be Redirected To The Product Detail Page

Test Case 003: Birds Category Validations [QAPTZ-1466]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Click Home Category   Pássaros
    And Validate Birds Category
    When I Click On Category  ALIMENTAÇÃO
    And I Click On Category   CALOPSITA
    And I Click On The First Product Displayed On The Page
    Then I Should Be Redirected To The Product Detail Page

Test Case 004: Fish Category Validations [QAPTZ-1467]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Click Home Category   Peixes
    And Validate Fish Category
    When I Click On Category  ALIMENTAÇÃO
    And I Click On Category   ALIMENTO BASE
    And I Click On The First Product Displayed On The Page
    Then I Should Be Redirected To The Product Detail Page

Test Case 005: Other Pets Validations [QAPTZ-1468]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Click Home Category   Outros\nPets
    And Validate Other Pets Category
    When I Click On Category  CHINCHILAS
    And I Click On Category   RAÇÃO
    And I Click On The First Product Displayed On The Page
    Then I Should Be Redirected To The Product Detail Page

Test Case 006: Home and Garden Category Validations [QAPTZ-1469]
    Given im on the app        ${MainUser}        ${MainPassword}
    And Click Home Category   Casa e\nJardim
    And Validate Home and Garden Category
    When I Click On Category  JARDIM
    And I Click On Category   SEMENTES
    And I Click On The First Product Displayed On The Page
    Then I Should Be Redirected To The Product Detail Page