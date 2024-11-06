*** Comments ***
Documentation
... Suite with commom ecommerce variables

*** Settings ***
Resource    ../../support/base.robot
Resource    ../../pages/store/clubz.robot


*** Variables ***
#LOCATOR
${PageTittle}     //*[@*='br.com.petz:id/text_title_menu_start' or @*='AGENDAMENTO']
${ChooseScheduleDateLabel}     //*[@*='br.com.petz:id/tv_date_and_hour' or @*='Escolha a data e horário de entrega']
${FirstTimeToSelect}              xpath=(//*[@*='br.com.petz:id/container_size_schedule'])[1]
${ConfirmButton}                  //*[@*='br.com.petz:id/bt_confirm' or @*='Confirmar']  
${DayToSelect}                    //*[@*='30' or @*='30'] 
${SubTittleScheduleButton}        xpath=(//*[@*='br.com.petz:id/tv_delivery_type_subtitle_time ' or @*='br.com.petz:id/tv_delivery_type_subtitle_time'])[3] 
${SubTittleScheduleButton2}        xpath=(//*[@*='br.com.petz:id/tv_value ' or @*='br.com.petz:id/tv_value'])[3]
${TotalValue}                    //*[@*='br.com.petz:id/tv_total_value' or @*=''] 
${Summary}                    //*[@*='br.com.petz:id/summary_variables' or @*=''] 






#TEXT
${PageTittleText}         AGENDAMENTO
${ChooseScheduleDateText}         Escolha a data e horário de entrega
${HourScheduleSubTittleText}        09h00 e 12h00 



*** Keywords ***
Select Schedule Delivery Date
    Sleep             3
    Validate and Click            ${FirstTimeToSelect}
    Validate and Click            ${ConfirmButton}
    Sleep             5
    Swipe Until Element is Visible        ${SubTittleScheduleButton}
    Validate Element      ${SubTittleScheduleButton}
    Swipe Until Element is Visible        ${SubTittleScheduleButton2}
    Validate Element      ${SubTittleScheduleButton2}

Validate Schedule Page
    Sleep            3
    Validate Element Text    ${PageTittle}    ${PageTittleText}
    Validate Element Text    ${ChooseScheduleDateLabel}        ${ChooseScheduleDateText}
    Validate Element           ${FirstTimeToSelect} 
    Element Should Be Disabled        ${ConfirmButton}
    
