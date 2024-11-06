*** Comments ***
Documentation
... Suite with cancel variables

*** Settings ***
Resource                        ../../support/base.robot

*** Variables ***
${RowMyOrder}                   //*[@*='iOS' or @*='br.com.petz:id/row_my_order'] 
${ButtonCancelOrder}            //*[@*='iOS' or @*='br.com.petz:id/cl_cancellation_button']
${TitleStartCancel}             //*[@*='iOS' or @*='br.com.petz:id/tv_bottom_sheet_title']
${ButtonStartCancel}            //*[@*='iOS' or @*='br.com.petz:id/mb_bottom_sheet_primary_action']
${DropdownReason}               //*[@*='iOS' or @*='br.com.petz:id/dropdown']
${TitleCancelOrder}             //*[@*='iOS' or @*='br.com.petz:id/text_title_menu_start']
${LabelReasonDetails}           //*[@*='iOS' or @*='br.com.petz:id/tv_cancellation_reason_details_title']
${InputDescriptionReason}       //*[@*='iOS' or @*='br.com.petz:id/et_reason_commentary']
${ButtonCancellation}           //*[@*='iOS' or @*='br.com.petz:id/cancellationButton']
${LabelCancelRequestSuccess}    //*[@*='iOS' or @*='br.com.petz:id/tv_cancel_request_success']
${LabelRefundMethod}            //*[@*='iOS' or @*='br.com.petz:id/tv_radio_group_title']
${DataCancellationReason}       //*[@*='iOS' or @*='br.com.petz:id/tv_cancellation_reason_data']
${DataRefundSelected}           //*[@*='iOS' or @*='br.com.petz:id/tv_refund_selected']
${LabelRevisionCancellation}    //*[@*='iOS' or @*='br.com.petz:id/tv_revision_title']                
${DescriptionReason}            Cancelamento feito pelos testes automatizados
${Refund}                       1
${PixOrCreditCard}              2

*** Keywords ***
that I'm in my orders
    Access Orders on Menu Lateral  

click on ${NumberOrder}   
    Wait Until Page Contains Element    ${RowMyOrder}     
    Click Text    Pedido ${NumberOrder} 

Click the cancel button
    Swipe Until Element is Visible    ${ButtonCancelOrder}  
    Click Element   ${ButtonCancelOrder} 
        
click to start cancellation
    Wait Until Page Contains Element   ${TitleStartCancel}  
    Element Should Contain Text    ${TitleStartCancel}     Sobre o cancelamento
    Click Element   ${ButtonStartCancel}  
 
select the reason 
    Wait Until Page Contains Element     ${TitleCancelOrder}  
    Element Should Contain Text    ${TitleCancelOrder}     CANCELAR PEDIDO
    Wait Until Page Contains Element     ${DropdownReason}   
    Click Text     Selecione o motivo
    #select the reason for cancellation
    Sleep    2
    Click Element At Coordinates   196   1070
    Wait Until Page Contains Element    ${LabelReasonDetails}  
    Input Text  ${InputDescriptionReason}   ${DescriptionReason}   
    Swipe Until Element is Visible    ${ButtonCancellation} 
    Validate And Click   ${ButtonCancellation}  

select the refund method ${RefundType} 
    Wait Until Page Contains Element    ${LabelRefundMethod} 
    Element Should Contain Text    ${LabelRefundMethod}    Escolha a forma de reembolso
    Click Element  xpath=(//android.widget.RadioButton[@resource-id="br.com.petz:id/radioButton"])[${RefundType}]
    Swipe Until Element is Visible    ${ButtonCancellation} 
    Element Should Be Enabled    ${ButtonCancellation} 
    Click Element   ${ButtonCancellation} 

confirm the cancellation request
    [Arguments]       ${Message}
    Wait Until Page Contains Element   	${LabelRevisionCancellation}  
    Element Should Contain Text   	${LabelRevisionCancellation}    Revise e confirme a sua solicitação
    Element Should Contain Text    ${DataRefundSelected}      ${Message}
    Swipe Until Element is Visible    ${ButtonCancellation}
    Sleep                5
    Click Element      ${ButtonCancellation} 

should cancel the order successfully
    Wait Until Page Contains Element   ${LabelCancelRequestSuccess} 
    Element Should Contain Text    ${LabelCancelRequestSuccess}     Pedido cancelado
   
that I canceled ${Order} with refund ${RefundType}
    that I'm in my orders
    click on ${Order}
    click the cancel button
    click to start cancellation
    select the reason
    select the refund method ${RefundType}
    confirm the cancellation request
    should cancel the order successfully
