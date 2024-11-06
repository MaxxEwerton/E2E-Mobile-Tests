*** Comments ***
Documentation
...Suite with bag tests

*** Settings ***
Resource            ../../main/support/base.robot
Resource            ../../main/pages/store/login.robot
Resource            ../../main/pages/store/bag.robot
 
Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***

Test Case 001: standard addition to bag [QAPTZ-1478]
   Given im on the app     ${MainUser}        ${MainPassword}
   And Exclude Product From Bag Before Scenario
   And click in recommended product
   And click to add product to bag
   When click to go to the bag
   Then the product will be displayed in the bag
   When delete a product from bag
   Then the product will be deleted

Test Case 002: quick addition to bag [QAPTZ-1479]
   Given im on the app     ${MainUser}        ${MainPassword}
   And Exclude Product From Bag Before Scenario
   And click to quick add a recommended product
   When click to go to the bag
   Then the product will be displayed in the bag
   When delete a product from bag
   Then the product will be deleted

Test Case 003: exclude product from bag [QAPTZ-1482]
   Given im on the app     ${MainUser}        ${MainPassword}
   And Exclude Product From Bag Before Scenario
   And click to quick add a recommended product
   And click to go to the bag
   When delete a product from bag
   Then the product will be deleted

Test Case 004: inscrease product from bag [QAPTZ-1480]
   Given im on the app     ${MainUser}        ${MainPassword}
   And Exclude Product From Bag Before Scenario
   And click to quick add a recommended product
   And click to go to the bag
   When i inscrease a product on bag
   Then validate quantity of product    2
   When delete a product from bag
   Then the product will be deleted

Test Case 005: decrease product from bag [QAPTZ-1481]
   Given im on the app     ${MainUser}        ${MainPassword}
   And Exclude Product From Bag Before Scenario
   And click to quick add a recommended product
   And click to go to the bag
   And i inscrease a product on bag
   And validate quantity of product    2
   When i decrease a product on bag
   Then validate quantity of product    1
   And delete a product from bag
   And the product will be deleted
