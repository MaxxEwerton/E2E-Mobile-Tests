*** Comments ***
Documentation
... Suite with my pets variables

*** Settings ***
Resource    ../../support/base.robot

*** Variables ***
#Tela Inicial
${WelcomeText}              //*[@*='Olá, Noah Cardoso' or @*='Olá,']
${MyWalletButton}           //*[@*='Minha carteira' or @*='Minha carteira']
${SilverCard}               //*[@*='• 10% OFF no Banho & Tosa' or @*='• 10% OFF no Banho & Tosa']
${GoldCard}                 //*[@*='• 20% OFF no Banho & Tosa' or @*='• 20% OFF no Banho & Tosa']
${DiamondCard}              //*[@*='• 30% OFF no Banho & Tosa' or @*='• 30% OFF no Banho & Tosa']
${UnblockSilver}            //*[@*='Desbloquear por 12x de R$ 6,90' or @*='Desbloquear por 12x de R$ 6,90']
${UnblockGold}              //*[@*='Desbloquear por 12x de R$ 12,90' or @*='Desbloquear por 12x de R$ 12,90']
${UnblockDiamond}           //*[@*='Desbloquear por 12x de R$ 24,90' or @*='Desbloquear por 12x de R$ 24,90']
${Title}              //*[@*='br.com.petz:id/text_title_menu_start' or @*='Desbloquear por 12x de R$ 6,90'] 
${Tier}               //*[@*='br.com.petz:id/text_tier' or @*='Desbloquear por 12x de R$ 6,90'] 
${BackButton}               //*[@*='br.com.petz:id/button_left_menu' or @*='Desbloquear por 12x de R$ 6,90'] 
${CardNumberField}          //android.widget.EditText[@text="Digite o número do cartão"]
${ValidateDateField}            //android.widget.EditText[@text="MM/AA"]
${SecurityCodeField}            //android.widget.EditText[@text="Ex: 123"]
${CardNameField}                //android.widget.EditText[@text="Digite o nome como está no cartão"]
${QuantityPaymentField}            //androidx.compose.ui.platform.ComposeView[@resource-id="br.com.petz:id/idd_card_installments"]/android.view.View/android.view.View




*** Keywords ***



i validate clubz page and payment page
    Validate Element                      ${WelcomeText}
    Validate Element                      ${MyWalletButton}
    Swipe Until Element is Visible        ${UnblockSilver}
    Validate Element                      ${SilverCard}
    Validate Element                      ${GoldCard}
    #Validate Element                      ${DiamondCard}
    Validate and Click                    ${UnblockSilver}
    Element Should Contain Text           ${Title}     CLUBZ PRATA
    Element Should Contain Text           ${Tier}      PRATA
    Validate payments fields
    Validate and Click                    ${BackButton}
    Swipe Until Element is Visible        ${UnblockSilver}
    Validate and Click                    ${GoldCard}
    Validate and Click                    ${UnblockGold}
    Element Should Contain Text           ${Title}     CLUBZ OURO
    Element Should Contain Text           ${Tier}      OURO
    Validate payments fields
    Validate and Click                    ${BackButton}
    Swipe Until Element is Visible        ${UnblockSilver}
    Validate and Click                    ${GoldCard}
    Validate and Click                    ${DiamondCard}
    Validate and Click                    ${UnblockDiamond}
    Element Should Contain Text           ${Title}     CLUBZ DIAMANTE
    Element Should Contain Text           ${Tier}      DIAMANTE
    Validate payments fields



Validate payments fields
    Validate Element                      ${CardNumberField}      
    Validate Element                      ${ValidateDateField}      
    Validate Element                      ${SecurityCodeField}      
    Validate Element                      ${CardNameField}      
    Validate Element                      ${QuantityPaymentField}      

