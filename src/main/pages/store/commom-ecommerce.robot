*** Comments ***
Documentation
... Suite with commom ecommerce variables

*** Settings ***
Resource    ../../support/base.robot
Resource    ../../pages/store/delivery-address.robot


*** Variables ***
${CCNumber}    5116841376681067
${CCMonth}    0129
${CCCode}    739
${CCName}    PET CENTER COMERCIO E PARTICIPACOES S.A
${RoyalCaninProductName}    Ração Hills
${RoyalCaninProductselect}            Ração Hills Science
${SnackHanaProductName}    snack hana
${SnackHanaProductselect}    Snack Hana
${Cep}        07950250
${PayWithPixText}        //*[@*='Pix' or @*='Pix']
${PayWithCardText}        Cartão
${PayWithBoletoText}        Boleto
${FakeEmail}            
${FakeCpf}
${OrderNumber}        
${InputSearchHome}            //*[@*='br.com.petz:id/input_search' or @*='br.com.petz:id/input_search']
${DetailsOfItemTitle}        //*[@*='br.com.petz:id/text_title_custom_menu_start' or @*='br.com.petz:id/text_title_custom_menu_start']
${AddToBagButton}            //*[@*='Adicionar à sacola' or @*='br.com.petz:id/bt_contained_button']
${AddedProducts}            //*[@*='Produtos Adicionados' or @*='br.com.petz:id/tv_bottom_sheet_title']
${OpenBag}            //*[@*='Ir para sacola' or @*='br.com.petz:id/btn_cta_open_bag']
${AddMoreProducts}            //*[@*='Adicionar mais produtos' or @*='br.com.petz:id/btn_cta_add_more_products']
${ButtonSearchHome}            //*[@*='br.com.petz:id/button_search' or @*='br.com.petz:id/button_search']
${GoToPaymentButton}            //*[@*='Ir para pagamento' or @*='br.com.petz:id/button_payment']
${InputCep}            //*[@*='00000-000' or @*='00000-000']
${EconomicSend}            //*[@*='Econômica' or @*='Econômica']
${ScheduleSend}            //*[@*='Agendada' or @*='Agendada']
${PaymentTitle}            //*[@*='PAGAMENTO' or @*='br.com.petz:id/text_title_menu_start']
${PayWithPixValidate}        //*[@*='O pagamento é imediato.' or @*='br.com.petz:id/tv_pix_imadiate']
${PayNowButton}            //*[@*='Pagar agora' or @*='br.com.petz:id/bt_checkout_pay_now']
${OrderSuccessTitle}            //*[@*='PEDIDO REALIZADO' or @*='br.com.petz:id/text_title_menu_start']
${TitlePixCode}            //*[@*='Código Pix' or @*='br.com.petz:id/tv_pix_code']
${OrderGreetings}            //*[@*='' or @*='br.com.petz:id/tv_order_number_title']
${ClearCepButton}            //*[@*='br.com.petz:id/text_input_end_icon' or @*='br.com.petz:id/text_input_end_icon']
${PayWithBolletoValidate}    //*[@*='br.com.petz:id/tv_text_alert' or @*='O boleto será gerado após finalizar a compra.']
${RegisterNumberButton}            //*[@*='Cadastrar' or @*='br.com.petz:id/mb_bottom_sheet_primary_action']
${HouseNumberInput}            //*[@*='000' or @*='000']
${Complement}            //*[@*='Apto / Bloco / Casa' or @*='Apto / Bloco / Casa']
${Reference}            //*[@*='Ex: Em frente do mercado' or @*='Ex: Em frente do mercado']
${AddressName}            //*[@*='Casa' or @*='Casa']
${SaveAddressButton}        //*[@*='Salvar endereço' or @*='br.com.petz:id/save_address']
${ExcludeProductAtCartButton}            //*[@*='br.com.petz:id/iv_delete' or @*='br.com.petz:id/iv_delete']
${AddMoreProductsOnCart}            //*[@*='br.com.petz:id/bt_plus' or @*='br.com.petz:id/bt_plus']
${MinusProductOnCart}            //*[@*='br.com.petz:id/bt_minus' or @*='br.com.petz:id/bt_minus']
${ExcludeProductModalTitle}            //*[@*='Excluir produto' or @*='Excluir produto']
${ExcludeProductMessage}            //*[@*='Tem certeza que quer excluir da sua sacola esse produto?' or @*='Tem certeza que quer excluir da sua sacola esse produto?']
${MaintainProduct}            //*[@*='Manter' or @*='Manter']
${ExcludeProductButton}            //*[@*='Excluir' or @*='Excluir']
${EmptyBagMessage}            //*[@*='br.com.petz:id/tv_empty_bag' or @*='br.com.petz:id/tv_empty_bag']
${CCNumberTextField}            //*[@*='Digite o número do cartão' or @*='Digite o número do cartão']
${CCMonthNumberTextField}            //*[@*='MM/AA' or @*='MM/AA']
${CCCodeField}            //*[@*='Ex: 123' or @*='Ex: 123']
${CCNameTextField}               //*[@*='Digite o nome como está no cartão' or @*='Digite o nome como está no cartão']
${SaveCardCheckBox}            //*[@*='Salvar o cartão para compras futuras' or @*='br.com.petz:id/mcb_save_card']
${OrderNumberId}        //*[@*='br.com.petz:id/tv_order_number_order_number' or @*='br.com.petz:id/tv_order_number_order_number']
${GoToStoreButton}            //*[@*='Ir para loja' or @*='br.com.petz:id/mbt_go_to_store']
${GoToMyOrdersButton}            //*[@*='Ir para Meus pedidos' or @*='br.com.petz:id/mbt_go_to_my_orders']
${ProdName}                 xpath=(//*[@*="br.com.petz:id/prodName"])

# ${}            //*[@*='' or @*='']
*** Keywords ***
Go To My Orders After Buy a Product
    Swipe Until Element is Visible    ${GoToMyOrdersButton}
    Validate and Click    ${GoToMyOrdersButton}

Go To Store After Buy a Product
    Swipe Until Element is Visible    ${GoToStoreButton}
    Validate and Click    ${GoToStoreButton}

Save New User Data TO Csv
    ${list}    Create List    ${FakeCpf}    ${FakeEmail}@stresstest.com.br    ${Password}    ${OrderNumber}
    ${data}    create list    ${list}
    Append To Csv File    ${file_path}    ${data}    delimiter=,
    
Fill House Number After Register
    Validate and Click    ${RegisterNumberButton}
    Swipe Until Element is Visible    ${HouseNumberInput}
    Validate and Click    ${HouseNumberInput}
    Press Keycode    8
    Sleep    1
    Press Keycode    8
    Hide Keyboard
    Swipe Until Element is Visible    ${Complement}
    Validate and Click    ${Complement}
    Press Keycode    8
    Sleep    1
    Press Keycode    8
    Hide Keyboard
    Swipe Until Element is Visible    ${Reference}
    Validate and Click    ${Reference}
    Press Keycode    8
    Sleep    1
    Press Keycode    8
    Hide Keyboard
    Swipe Until Element is Visible    ${AddressName}
    Validate and Click       ${AddressName}
    Press Keycode    8
    Sleep    1
    Press Keycode    8
    Hide Keyboard
    Validate and Click    ${SaveAddressButton}

Search Product Snack Hana
    Input Text Into Current Element     h
        Sleep    1
    Input Text Into Current Element     a 
        Sleep    1
    Input Text Into Current Element     n
        Sleep    1

Search Expensive Product Royal Canin
    Input Text Into Current Element     h
        Sleep    1
    Input Text Into Current Element     i
        Sleep    1
    Input Text Into Current Element     l
        Sleep    1
    Input Text Into Current Element     l
        Sleep    1
    Input Text Into Current Element     s
        Sleep    1

Input Schedule CEP
    Input Text Into Current Element     0
        Sleep    1
    Input Text Into Current Element     9
        Sleep    1
    Input Text Into Current Element     6
        Sleep    1
    Input Text Into Current Element     3
        Sleep    1
    Input Text Into Current Element     5
        Sleep    1
    Input Text Into Current Element     1
        Sleep    1
    Input Text Into Current Element     4
        Sleep    1
    Input Text Into Current Element     0
        Sleep    1


Input Cep SP
    Input Text Into Current Element     0
        Sleep    1
    Input Text Into Current Element     7
        Sleep    1
    Input Text Into Current Element     9
        Sleep    1
    Input Text Into Current Element     2
        Sleep    1
    Input Text Into Current Element     9
        Sleep    1
    Input Text Into Current Element     0
        Sleep    1
    Input Text Into Current Element     0
        Sleep    1
    Input Text Into Current Element     0
        Sleep    1

Search Expensive Product 
    [Arguments]    ${NameOfProduct}    ${Product}
    Validate and Click    ${ButtonSearchHome}
    Sleep    2
    Input Text     ${InputSearchHome}    ${NameOfProduct}
    Validate Element    ${ProdName}\[1]
    Element Should Contain Text    ${ProdName}\[1]    ${Product}
    Validate and Click    ${ProdName}\[1]
    Validate Element    ${DetailsOfItemTitle}

Search Product Snack Hana Cheap
    [Arguments]    ${NameOfProduct}    ${Product}
    Validate and Click    ${ButtonSearchHome}
    Sleep    2
    Input Text     ${InputSearchHome}    ${NameOfProduct}
    Validate Element    ${ProdName}\[1]
    Element Should Contain Text    ${ProdName}\[1]    ${Product}
    Validate and Click    ${ProdName}\[1]
    Validate Element    ${DetailsOfItemTitle}

Add Product To Bag And Remove It
    Validate and Click    ${AddToBagButton}
    Validate Element    ${AddedProducts}
    Validate Element    ${OpenBag}
    Validate Element    ${AddMoreProducts}
    Validate and Click    ${OpenBag}
    Sleep    4
    Validate Element    ${ExcludeProductAtCartButton} 
    Validate Element    ${AddMoreProductsOnCart}
    Validate Element    ${MinusProductOnCart}
    # Validate and Click    ${AddMoreProductsOnCart}
    # Sleep    4
    # Validate and Click    ${MinusProductOnCart}
    Sleep    4
    Validate and Click    ${ExcludeProductAtCartButton}
    Validate Element    ${ExcludeProductModalTitle}
    Validate Element    ${ExcludeProductMessage}
    Validate Element    ${MaintainProduct}
    Validate Element    ${ExcludeProductButton}
    Validate and Click    ${ExcludeProductButton}
    Validate Element    ${EmptyBagMessage}
    Validate and Click    ${LeftMenu}
    Validate Element    ${DetailsOfItemTitle}
    Sleep    2
    Validate and Click    ${NavBarStoreHome}

Add Product To Bag And Fill New Adresses
    Validate and Click    ${AddToBagButton}
    Validate Element    ${AddedProducts}
    Validate Element    ${OpenBag}
    Validate Element    ${AddMoreProducts}
    Validate and Click    ${OpenBag}
    Sleep    4
    Swipe Until Element is Visible    ${InputCep}
    Sleep    2
    #Inspect if Element Exists and Confirm    ${ClearCepButton}    ${InputCepText}
    Validate and Click     ${InputCep}
    Input Cep SP
    Hide Keyboard
    Sleep    2
    Swipe Until Element is Visible    ${EconomicSend}
    Validate and Click    ${EconomicSend}
    Sleep    4
    Click Element    ${GoToPaymentButton}
    Fill House Number After Register
    Sleep    10
    Validate and Click    ${GoToPaymentButton}

Add Product To Bag and Click Payment
    Validate and Click    ${AddToBagButton}
    Validate Element    ${AddedProducts}
    Validate Element    ${OpenBag}
    Validate Element    ${AddMoreProducts}
    Validate and Click    ${OpenBag}
    Sleep    6
    Swipe Until Element is Visible    ${EconomicSend}
    Validate and Click    ${EconomicSend}
    Sleep    4
    Validate and Click    ${GoToPaymentButton}

Add Product To Bag And Click Payment And Schedule Devilery
    Validate and Click    ${AddToBagButton}
    Validate Element    ${AddedProducts}
    Validate Element    ${OpenBag}
    Validate Element    ${AddMoreProducts}
    Validate and Click    ${OpenBag}
    Sleep    6
    Swipe Until Element is Visible    ${ScheduleSend} 
    Validate and Click       ${ClearCepButton}
    Input Schedule CEP
    Sleep                    7
    Validate and Click    ${ScheduleSend}
    Sleep    4
    Validate Schedule Page
    Select Schedule Delivery Date
    Validate and Click    ${GoToPaymentButton}

Validate Payment Initial Screen
    Validate Element    ${PaymentTitle}
    Swipe Until Element is Visible    ${SaveCardCheckBox}
    Validate Element    ${CCNumberTextField} 
    Validate Element    ${CCMonthNumberTextField}
    Validate Element    ${CCCodeField}
    Swipe To the Top    ${CCNumberTextField}

Pay Product With Credit Card
    Validate Payment Initial Screen
    Validate and Input Text    ${CCNumberTextField}    ${CCNumber}
    Validate and Input Text    ${CCMonthNumberTextField}    ${CCMonth}
    Validate and Input Text    ${CCCodeField}    ${CCCode}
    Validate and Input Text    ${CCNameTextField}    ${CCName}
    Hide Keyboard
    Click Element    ${PayNowButton}
    Validate Element    ${OrderSuccessTitle}
    Validate Element    ${OrderNumberId}
    ${OrderNumber}    Get Text    ${OrderNumberId}
    Set Test Variable    ${OrderNumber}
    Save New User Data TO Csv
    Validate Element    ${OrderGreetings}
    Set Test Variable    ${OrderNumber}
    
Pay Product With Pix
    Validate Payment Initial Screen
    Validate and Click    ${PayWithPixText}
    Validate Element    ${PayWithPixValidate}
    Sleep    4
    Click Element    ${PayNowButton}
    Validate Element    ${OrderSuccessTitle}
    Validate Element    ${OrderNumberId}
    ${OrderNumber}    Get Text    ${OrderNumberId}
    Set Test Variable    ${OrderNumber}
    Save New User Data TO Csv
    Validate Element    ${OrderGreetings}
    Validate Element    ${TitlePixCode}


Pay Product With Boleto
    Validate Payment Initial Screen
    Validate and Click On Text    ${PayWithBoletoText}
    Validate Element    ${PayWithBolletoValidate}
    Sleep    4
    Click Element    ${PayNowButton}
    Validate Element    ${OrderSuccessTitle}
    Validate Element    ${OrderNumberId}
    ${OrderNumber}    Get Text    ${OrderNumberId}
    Set Test Variable    ${OrderNumber}
    Save New User Data TO Csv
    Validate Element    ${OrderGreetings}
    Set Test Variable    ${OrderNumber}

Read CVC Data Prd
    @{user}=    read csv file to associative  ${file_path} 
    Set Global Variable    @{user}