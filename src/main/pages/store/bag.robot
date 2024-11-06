*** Comments ***
Documentation
... Suite with my pets variables

*** Settings ***
Resource    ../../support/base.robot

*** Variables ***
#Tela Inicial
#Product Page
${RecommendedProduct}            //*[@*='br.com.petz:id/image_product' or @*='br.com.petz:id/image_product']
${ProductTittle}                  //*[@*='br.com.petz:id/tv_name' or @*='br.com.petz:id/tv_name']
${ProductPrice}                  //*[@*='br.com.petz:id/text_price_new' or @*='br.com.petz:id/text_price_new']
${ProductSubscriberPrice}                  //*[@*='br.com.petz:id/text_subscriber_price' or @*='br.com.petz:id/text_subscriber_price']
${QuickAddButton}               //*[@*='br.com.petz:id/cv_add_item' or @*='br.com.petz:id/cv_add_item']


#Bag Page
${SubscriptionButton}              //*[@*='br.com.petz:id/sc_active_item_subscribe' or @*='br.com.petz:id/sc_active_item_subscribe']
${ProductBagPrice}                 //*[@*='br.com.petz:id/tv_products_price' or @*='br.com.petz:id/tv_products_price'] 
${DigiteSeuCupomField}              //*[@*='br.com.petz:id/input_discount_coupon' or @*='br.com.petz:id/input_discount_coupon']
${ZipCodeField}                      //*[@*='br.com.petz:id/input_zip_code' or @*='br.com.petz:id/input_zip_code']  
${DeliveryModesOptions}                  //*[@*='br.com.petz:id/dtv_types_delivery' or @*='br.com.petz:id/dtv_types_delivery']
${SummaryFields}                        //*[@*='br.com.petz:id/summary_variables' or @*='br.com.petz:id/summary_variables']
${FixedContainerPrice}                   //*[@*='br.com.petz:id/cl_info_quantity_price' or @*='br.com.petz:id/cl_info_quantity_price'] 

${DeleteProductFromBag}                //*[@*='br.com.petz:id/iv_delete' or @*='br.com.petz:id/iv_delete']
${ManterProduct}                //*[@*='br.com.petz:id/mb_bottom_sheet_secondary_action' or @*='Manter']
${ConfirmDelete}                //*[@*='br.com.petz:id/mb_bottom_sheet_primary_action' or @*='Excluir']
${EmptyBagMessage}                //*[@*='br.com.petz:id/tv_empty_bag' or @*='br.com.petz:id/tv_empty_bag']
${InscreaseItem}               //*[@*='br.com.petz:id/bt_plus' or @*='br.com.petz:id/bt_plus']
${DecreaseItem}                //*[@*='br.com.petz:id/bt_minus' or @*='br.com.petz:id/bt_minus']
${ActualQuantity}                //*[@*='br.com.petz:id/tv_progress' or @*='br.com.petz:id/tv_progress']
${EmptyBagText}                Você ainda não tem nenhum \nproduto na sua sacola.




${MyPets}      //*[@*='' or @*='']
*** Keywords ***
the product will be displayed in the bag
    Sleep                                       6
    Validate Element                            ${SubscriptionButton}   
    Validate Element                            ${ProductAdded}
    Validate Element                            ${ProductBagPrice}
    #Validate Element                            ${DigiteSeuCupomField}
    Validate Element                            ${GoToPaymentButton}
    #Swipe Until Element is Visible              ${DeliveryModesOptions}
    #Validate Element                            ${DeliveryModesOptions}
    #Swipe Until Element is Visible              ${SummaryFields}                        
    #Validate Element                            ${DeliveryModesOptions}
    #Validate Element                            ${GoToPaymentButton}
    #Validate Element                            ${FixedContainerPrice}


delete a product from bag
    Sleep                                 6
    Validate and Click                    ${DeleteProductFromBag}
    Validate Element                      ${ProductAdded}
    Validate Element                      ${ManterProduct}
    Validate and Click                    ${ConfirmDelete}

Exclude Product From Bag Before Scenario
     Sleep    10
     Validate and Click     ${NavBarBag}
    ${ValidateMessageEmptyBag}=    Run Keyword And Return Status    Validate Element Text    ${EmptyBagMessage}    ${EmptyBagText}
    IF    ${ValidateMessageEmptyBag}
    Validate and Click       ${NavBarStoreHome}
    ELSE
    Validate and Click       ${DeleteProductFromBag}
    Validate and Click                    ${ConfirmDelete}
    Sleep    3
    Validate and Click       ${NavBarStoreHome}
    END


the product will be deleted
    Wait Until Element Is Visible        ${EmptyBagMessage}
    Element Should Contain Text    ${EmptyBagMessage}     Você ainda não tem nenhum \nproduto na sua sacola.

i inscrease a product on bag
    Sleep        7
    Wait Until Element Is Visible        ${InscreaseItem}
    Validate and Click                ${InscreaseItem}

validate quantity of product
    [Arguments]      ${Quantity}  
    Sleep                                5
    Wait Until Element Is Visible        ${ActualQuantity}
    Element Should Contain Text    ${ActualQuantity}     ${Quantity}  

i decrease a product on bag
    Sleep                                7
    Wait Until Element Is Visible        ${DecreaseItem}
    Validate and Click                ${DecreaseItem}
