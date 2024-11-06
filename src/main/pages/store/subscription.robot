*** Comments ***
Documentation
... Suite with categories variables

*** Settings ***
Resource                   ../../support/base.robot
Resource                   bag.robot

*** Variables ***
${ActiveSubscribe}                 //*[@*="br.com.petz:id/sc_active_item_subscribe"]
${TextSubscribe}                   //*[@*="br.com.petz:id/txt_activating_subscription"]
${BottomSheetTitle}                //*[@*="br.com.petz:id/tv_bottom_sheet_title"] 
${FrequencyInstruction}            //*[@*="br.com.petz:id/tv_purchase_frequency_instruction"]
${FrequencySelected}               //*[@*="br.com.petz:id/tv_purchase_frequency_days"]
${OtherFrequency}                  //*[@*="br.com.petz:id/mbt_other_frequency"]
${SubThirtyDays}                   //*[@*="br.com.petz:id/mbt_thirty_days"]
${SubFortyFiveDays}                //*[@*="br.com.petz:id/mbt_forty_five_days"]
${SubSixtyDays}                    //*[@*="br.com.petz:id/mbt_sixty_days"]
${SubNinetyDays}                   //*[@*="br.com.petz:id/mbt_ninety_days"]
${ChangeSubscribe}                 //*[@*="br.com.petz:id/txt_changing_subscription"]
${BtnActiveSubscribe}              //*[@*="br.com.petz:id/mb_bottom_sheet_primary_action"]
${BtnCancelSubscribe}              //*[@*="br.com.petz:id/mbt_cancel_subscribe"]
${CheckBoxSubscribeTerms}          //*[@*="br.com.petz:id/cb_active_subscribe"]
${DescriptionBottomSheet}          //*[@*="br.com.petz:id/tv_bottom_sheet_description"]
${BtnKeepSubscribe}                //*[@*="br.com.petz:id/mb_bottom_sheet_secondary_action"]
${BtnConfirmCancelSubscribe}       //*[@*="br.com.petz:id/mb_bottom_sheet_primary_action"]
${FieldFillDay}                    //*[@*="Exemplo: 10"]
${InstructionOtherFrequency}       //*[@*="br.com.petz:id/tv_title"]
${ConfirmRemoveText}               Tem certeza que deseja remover?
${SubscribeProductText}            Assinar produto
${BottomSheetSubscribePetzTxt}     Assinatura Petz
${FrequencyInstructionText}        Escolha a frequência da assinatura
${OtherFrequencyInstructionText}   Digite um período entre 7 e 150 dias

*** Keywords ***
Add Product To Bag
    click in recommended product
    click to add product to bag
    click to go to the bag

Activate Predefined Frequency Subscription
    Sleep    10
    ${ValidateActiveSuscribe}=    Run Keyword And Return Status    Validate Element Text    ${TextSubscribe}    ${SubscribeProductText}
    IF    ${ValidateActiveSuscribe}
    Validate and Click       ${ActiveSubscribe}
    ELSE
    Validate and Click       ${ActiveSubscribe}
    Sleep    3
    Validate and Click       ${ActiveSubscribe}
    END
    Validate Element Text    ${BottomSheetTitle}    ${BottomSheetSubscribePetzTxt}
    Validate Element         ${FrequencyInstruction}    
    Validate Element         ${OtherFrequency}
    Validate Element         ${SubThirtyDays}
    Validate Element         ${SubFortyFiveDays}
    Validate Element         ${SubSixtyDays}
    Validate Element         ${SubNinetyDays} 
    Click Random Frequency
    Validate Element Text    ${FrequencySelected}    ${FrequencyDays}
    Sleep    5
    Validate and Click       ${BtnActiveSubscribe}
    Sleep    5
    Validate Element Text    ${TextSubscribe}        Envio a cada ${FrequencyDays}
    Validate Element         ${ChangeSubscribe} 

Go To The Payment Screen
    Swipe Until Element is Visible    ${EconomicSend}
    Validate and Click       ${EconomicSend}
    Sleep    5
    Validate and Click       ${GoToPaymentButton}
    Validate Payment Initial Screen

Not Confirm The Subscription Terms
    Swipe Until Element is Visible    ${BtnCancelSubscribe}
    Element Attribute Should Match    ${CheckBoxSubscribeTerms}          checked    false
    Element Should Be Disabled        ${PayNowButton}

Should Remove The Product Subscription
    Validate and Click                ${BtnCancelSubscribe}
    Validate Element Text             ${BottomSheetTitle}                ${ConfirmRemoveText} 
    Validate Element                  ${DescriptionBottomSheet}
    Validate Element                  ${BtnKeepSubscribe} 
    Validate and Click                ${BtnConfirmCancelSubscribe}
    Wait Until Page Does Not Contain Element    ${BtnCancelSubscribe}    30
 
 Delete Product From Bag
     Validate and Click               ${LeftMenu}
     Swipe To the Top                 ${DeleteProductFromBag}
     delete a product from bag
     the product will be deleted

Activate Other Frequency Subscription
    Sleep    10
    ${ValidateActiveSuscribe}=    Run Keyword And Return Status    Validate Element Text    ${TextSubscribe}    ${SubscribeProductText}
    IF    ${ValidateActiveSuscribe}
    Validate and Click       ${ActiveSubscribe}
    ELSE
    Validate and Click       ${ActiveSubscribe}
    Sleep    3
    Validate and Click       ${ActiveSubscribe}
    END
    Validate Element Text    ${BottomSheetTitle}    ${BottomSheetSubscribePetzTxt}
    Validate Element         ${FrequencyInstruction}    
    Validate Element         ${OtherFrequency}
    Validate Element         ${SubThirtyDays}
    Validate Element         ${SubFortyFiveDays}
    Validate Element         ${SubSixtyDays}
    Validate Element         ${SubNinetyDays}
    Validate and Click       ${OtherFrequency}
    Validate Element Text    ${InstructionOtherFrequency}   ${OtherFrequencyInstructionText}
    Fill Random Days
    Validate Element Text    ${FrequencySelected}    ${RandomNumber} dias    
    Sleep    5
    Validate and Click       ${BtnActiveSubscribe}
    Sleep    5
    Validate Element Text    ${TextSubscribe}        Envio a cada ${RandomNumber} dias
    Validate Element         ${ChangeSubscribe} 

Confirm The Subscription Terms
    Swipe Until Element is Visible    ${BtnCancelSubscribe}
    Element Attribute Should Match    ${CheckBoxSubscribeTerms}          checked    false
    Element Should Be Disabled        ${PayNowButton}
    Validate and Click                ${CheckBoxSubscribeTerms}
    Sleep    3
    Element Attribute Should Match    ${CheckBoxSubscribeTerms}          checked    true
    Element Should Be Enabled         ${PayNowButton}    

Click Random Frequency
    ${SelectFrequency}=    Create List    ${SubThirtyDays}    ${SubFortyFiveDays}    ${SubSixtyDays}    ${SubNinetyDays}
    ${RandomFrequency}=    Evaluate       random.choice(${SelectFrequency})
    ${FrequencyDays}      Get Text       ${RandomFrequency}
    Set Test Variable      ${FrequencyDays}
    Click Element          ${RandomFrequency}

Fill Random Days
    ${RandomNumber}=    Evaluate    random.randint(7, 150)
    Set Test Variable   ${RandomNumber}
    Input Text          ${FieldFillDay}    ${RandomNumber}