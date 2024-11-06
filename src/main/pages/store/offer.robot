*** Comments ***
Documentation
... Suite with my pets variables

*** Settings ***
Resource    ../../support/base.robot

*** Variables ***

${RegrasButton}              //*[@*='br.com.petz:id/tv_action_header_cancel' or @*='br.com.petz:id/tv_action_header_cancel']
${TodasTab}                  //*[@*=contains(@text,"Todas") or @*='Todas']  
${AtivadasTab}               //*[contains(@text,"Ativadas")]
${ProductDisplayed}          //*[@*='br.com.petz:id/text_view_offer_description' or @*='br.com.petz:id/text_view_offer_description']
${AtivarOfertaButton}        //*[@*='br.com.petz:id/button' or @*='br.com.petz:id/button'] 
${ActiveFlag}                //*[@*='br.com.petz:id/text_view_offer_activated' or @*='br.com.petz:id/text_view_offer_activated']
${AdicionarSacolaButton}                //*[@*='br.com.petz:id/button_add_to_bag' or @*='br.com.petz:id/button_add_to_bag']


*** Keywords ***

i validate offer page
    Validate Element           ${LeftMenu}
    Validate Element           ${RegrasButton} 
    Validate Element           ${TodasTab}  
    Validate Element           ${AtivadasTab} 
    Validate Element           ${ProductDisplayed}

i click in active offer
    Validate and Click         ${AtivarOfertaButton}
    Validate Element           ${ActiveFlag}

i click in actives tab 
    Validate and Click         ${AtivadasTab}
    Sleep                      3
    Validate Element           ${ProductDisplayed}
    Validate Element           ${ActiveFlag}
    Validate Element           ${AdicionarSacolaButton}