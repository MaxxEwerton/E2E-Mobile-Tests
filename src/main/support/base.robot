*** Comments ***
Documentation
... Suite with base system features
... Resources used in all scenarios

*** Settings ***
Library     FakerLibrary    locale=pt_BR
Library     RequestsLibrary
Library     OperatingSystem
Library     AppiumLibrary   run_on_failure=Nothing
Library     Collections
Library     JSONLibrary
Library     CSVLibrary
Library     String
Library     Telnet
Resource    ./commom-resources.robot
Resource    ../../api/Resource/ResourcePets.robot
Resource    ../../api/Resource/ResourceUSers.robot
Resource    ../../api/Resource/ResourceAgendamentoBet.robot

Resource    ../pages/store/commom-ecommerce.robot
Resource    ../pages/store/cancel-order.robot

*** Variables ***
#User data
${file_path}    ./src/main/support/prd_dados.csv
${Password}            123456
${InitialAccount}      83415541002
${MainUser}         75629083465
${MainPassword}         123456
${InitialPassword}     123456
${ApiScheduleAcount}        54443067000
${ApiSchedulePassword}        B12alpha1@
${UserServices}        75638411054
${PasswordServices}    123456@Abc
${UserServicesCat}        62516410026
${PasswordServicesCat}    B12alpha1@

#Primeiro xpath sempre ios usando o * para nao ter problemas, segundo sempre android pode ser usado qualquer Elemento
#Login
${UserEmailOrCpfTextField}      //*[@*='TextField' or @*='Digite seu e-mail ou CPF']
${UserPasswordTextfield}        //*[@*='XCUIElementTypeSecureTextField' or @*='Digite sua senha']
${Submit}                       //*[@*='Entrar. Botão, clique duas vezes para acesssar.' or @*='Entrar']
${ForgotPassword}               //*[@*='Esqueci minha senha' or @*='br.com.petz:id/tv_forgot_password']
${Divider}                      //*[@*='dataStackView' or @*='br.com.petz:id/l_l_divider']
${LoginWithoutAccount}          //*[@*='Entrar sem conta. Botão, clique duas vezes para acesssar.' or @*='br.com.petz:id/bt_login_without_account']
${CreateAccountButton}          //*[@*='Criar conta' or @*='Criar conta']

# Secutity Page 1
${SecurityScreenTitle}          //*[@*='VERIFICAÇÃO DE SEGURANÇA' or @*='br.com.petz:id/text_title_menu_start']
${SecurityScreenAlert}          //*[@*='Vamos enviar um código de segurança para validar a criação da conta.' or @*='br.com.petz:id/tv_title']
${SecurityScreenSmsText}          //*[@*='SMS' or @*='SMS']
${SecurityScreenRadioButton}          //*[@*='br.com.petz:id/cl_radio_button' or @*='br.com.petz:id/cl_radio_button']
${SecurityScreenReceiveCodeButton}          //*[@*='Receber código' or @*='br.com.petz:id/mb_continue']
${SecurityScreenNeedHelpButton}          //*[@*='Precisa de ajuda?' or @*='br.com.petz:id/mb_need_help']

# Security Page 2
${SecurityScreenTextCodeSend}          //*[@*='Digite o código enviado para' or @*='br.com.petz:id/tv_info']
${SecurityScreenTextVerifyCode}          //*[@*='Verifique se recebeu o código em seu celular ou aguarde para gerar um novo.' or @*='br.com.petz:id/tv_text_alert']
${SecurityScreenTextResendCode}          //*[@*='br.com.petz:id/tv_resend_timer_alert' or @*='br.com.petz:id/tv_resend_timer_alert']
${SecurityScreenValidateRegisterButton}          //*[@*='Validar' or @*='br.com.petz:id/mb_confirm_registration']
${SecurityScreenSetCode1}          //*[@*='br.com.petz:id/cet_1' or @*='br.com.petz:id/cet_1']
${SecurityScreenSetCode2}          //*[@*='br.com.petz:id/cet_2' or @*='br.com.petz:id/cet_2']
${SecurityScreenSetCode3}          //*[@*='br.com.petz:id/cet_3' or @*='br.com.petz:id/cet_3']
${SecurityScreenSetCode4}          //*[@*='br.com.petz:id/cet_4' or @*='br.com.petz:id/cet_4']
${SecurityScreenSetCode5}          //*[@*='br.com.petz:id/cet_5' or @*='br.com.petz:id/cet_5']
${SecurityScreenSetCode6}          //*[@*='br.com.petz:id/cet_6' or @*='br.com.petz:id/cet_6']


#Home app
${Ecosystems}                   //*[@*='MenuButton' or @*='br.com.petz:id/button_right_menu']
${LateralMenuButton}                  //*[@*='Meu PerfilButton' or @*='br.com.petz:id/button_left_menu']
${LateralMenuProfileHello}                  //*[@*='Meu Perfil' or @*='br.com.petz:id/menu_profile_hello_txt']
${LateralMenu}                  //*[@*='' or @*='br.com.petz:id/button_left_menu']
${LateralMenuTierClubz}              //*[@*='br.com.petz:id/menu_profile_tier_card']
${LateralMenuAjuda}                  //*[@*='Ajuda' or @*='br.com.petz:id/action_help']
${LateralMenuFavoritos}                  //*[@*='Favoritos' or @*='br.com.petz:id/action_favorites']
${LateralMenuMeusDados}                  //*[@*='Meus Dados' or @*='br.com.petz:id/action_my_data']
${LateralMenuMeusPedidos}                  //*[@*='Pedidos' or @*='br.com.petz:id/action_my_order']
${LateralMenuMeusPets}                  //*[@*='Meus Pets' or @*='br.com.petz:id/action_my_pets']
${LateralMenuMinhaCarteira}                  //*[@*='Minha Carteira' or @*='br.com.petz:id/action_my_wallet']
${LateralMenuFeedPetz}                  //*[@*='Feed Petz' or @*='br.com.petz:id/action_feed_petz']
${LateralMenuEndereços}                  //*[@*='Endereços' or @*='br.com.petz:id/action_addresses']
${LateralMenuAlterarSenha}                  //*[@*='Alterar Senha' or @*='br.com.petz:id/action_change_password']
${LateralMenuPolíticasPetz}                  //*[@*='Políticas Petz' or @*='br.com.petz:id/action_change_policies_petz']
${LateralMenuSair}                  //*[@*='Sair' or @*='br.com.petz:id/button_menu_exit']
${LateralMenuFechar}                  //*[@*='Voltar' or @*='br.com.petz:id/menu_close_button']
${CancelButton}    //*[@*='nameTitleLabel' or @*='Cancelar']
${LeftMenu}    //*[@*='Voltar' or @*='br.com.petz:id/button_left_menu']

${NavBarStoreHome}              //*[@*='Loja' or @*='Loja']
${NavBarSignatureHome}          //*[@*='Assinatura' or @*='Assinatura']
${NavBarRepurchase}             //*[@*='Recompra' or @*='Recompra']
${NavBarClubz}                  //*[@*='Clubz' or @*='Clubz']
${NavBarBag}                    //*[@*='Sacola' or @*='Sacola']
${EcosystemsTitleText}          //*[@*="br.com.petz:id/menu_title_txt"]
${EcosystemsStore}              //*[@*='LojaLabel' or @*='br.com.petz:id/menu_card_petz_container']
${EcosystemsBeT}                //*[@*='Banho&TosaLabel' or @*='br.com.petz:id/menu_card_grooming_container']
${EcosystemsSeres}              //*[@*='VeterinárioLabel' or @*='br.com.petz:id/menu_card_veterinary_container']
${EcosystemsBlog}               //*[@*='BlogPetzLabel' or @*='br.com.petz:id/menu_card_blog']
${JumpOnboarding}               //*[@*='nameTitleLabel' or @*='Pular']


#Cadastro
${HeaderCreateAccount}          //*[@*='nameTitleLabel' or @*='CRIAR CONTA']
${FullNameTextField}            //*[@*='nameTitleLabel' or @*='Digite seu nome completo']
${CpfTextField}                 //*[@*='nameTitleLabel' or @*='000.000.000–00']
${EmailTextField}               //*[@*='nameTitleLabel' or @*='Digite seu e-mail']
${CellPhoneTextField}           //*[@*='nameTitleLabel' or @*='(00) 00000 0000']
${CellPhoneTextField11}        //*[@*='nameTitleLabel' or @*='(11) 00000 0000']
${Genders}                      //*[@*='br.com.petz:id/dropdown' or @*='Selecione o seu gênero']
${FemaleGender}                 Feminino
${MaleGender}                   Masculino
${GenderNotDefined}             Prefiro não informar
${DateOfBirthTextField}         //*[@*='dd/mm/aaaa' or @*='br.com.petz:id/edt_birth']
${PasswordTextField}            //*[@*='nameTitleLabel' or @*='Digite a sua senha']
${ConfirmPasswordTextField}     //*[@*='nameTitleLabel' or @*='Confirme a sua senha']
${TermsAndConditions}           //*[@*='nameTitleLabel' or @*='Concordo com os Termos e Condições']
${CheckBoxTerms}                //*[@*='nameTitleLabel' or @*='br.com.petz:id/check_box']
${ModalBraze}                   //*[@*='br.com.petz:id/com_braze_inappmessage_modal_close_button']
${MinhasOfertasButton}          //*[@*='br.com.petz:id/textOffers' or @*='br.com.petz:id/textOffers']

#Menus lateral
${LateralMenuAcessHelp}        //*[@*='Ajuda' or @*='Entrar']
${LateralMenuHelpValidate}        //*[@*='AJUDA' or @*='Entrar']
${LateralMenuAcessFavorites}        //*[@*='Favoritos' or @*='Entrar']
${LateralMenuFavoritesValidate}        //*[@*='FAVORITOS' or @*='Entrar']
${LateralMenuAcessMyData}        //*[@*='Meus Dados' or @*='Entrar']
${LateralMenuMyDataValidate}        //*[@*='MEUS DADOS' or @*='Entrar']
${LateralMenuAcessOrders}        //*[@*='br.com.petz:id/action_my_order' or @*='Entrar']
${LateralMenuOrdersValidate}        //*[@*='MEUS PEDIDOS' or @*='Entrar']
${LateralMenuAcessWallet}        //*[@*='Minha Carteira' or @*='Entrar']
${LateralMenuWalletValidate}        //*[@*='MINHA CARTEIRA' or @*='Entrar']
${LateralMenuAcessFeedPetz}        //*[@*='Feed Petz' or @*='Entrar']
${LateralMenuFeedPetzValidate}        //*[@*='FEED PETZ' or @*='Entrar']
${LateralMenuAcessAdresses}        //*[@*='Endereços' or @*='Entrar']
${LateralMenuAdressesValidate}        //*[@*='MEUS ENDEREÇOS' or @*='Entrar']
${LateralMenuAcessChangePassword}        //*[@*='Alterar Senha' or @*='Entrar']
${LateralMenuChangePasswordValidate}        //*[@*='ALTERAR SENHA' or @*='Entrar']
${LateralMenuAcessPetzPolitics}        //*[@*='Políticas Petz' or @*='Entrar']
${LateralMenuPetzPoliticsValidate}        //*[@*='POLÍTICAS PETZ' or @*='Entrar']
${FindField}        //*[@*='O que seu pet precisa?' or @*='Entrar']
${FirstProductDisplayed}        xpath=(//*[@*='br.com.petz:id/text_title'])[1]
${SecondProductDisplayed}        xpath=(//*[@*='br.com.petz:id/text_title'])[2]



${FirstProductSearched}        //*[@*=contains(@text,"Ração Golden Special") or @*='Entrar']
${SecondProductSearched}        //*[@*=contains(@text,"Ração Golden Power") or @*='Entrar']
${MostSearchedProducts}         //*[@*='br.com.petz:id/top_search_button' or @*='br.com.petz:id/top_search_button']
${FavoriteButton}         //*[@*='br.com.petz:id/cb_favorite_fixed' or @*='br.com.petz:id/cb_favorite_fixed']
${UnfavoriteButton}         //*[@*='br.com.petz:id/ivc_favorite_product' or @*='br.com.petz:id/ivc_favorite_product']
${UnfavoriteConfirmation}       	//*[@*='br.com.petz:id/tv_description' or @*='br.com.petz:id/tv_description']
${UnfavoriteConfirmationButton}         //*[@*='br.com.petz:id/action_button' or @*='br.com.petz:id/action_button']
${FavoritePageEmpty}         //*[@*='br.com.petz:id/tv_empty_favorites_title' or @*='br.com.petz:id/tv_empty_favorites_title']

${ShortcutAndroid}              //*[@*='nameTitleLabel' or @*='']
${ShortcutIos}                  //*[@*='' or @*='Entrar']

#Product Page
${RecommendedProduct}            xpath=(//*[@*='br.com.petz:id/text_title'])[2]
${ProductTittle}                  //*[@*='br.com.petz:id/tv_name' or @*='br.com.petz:id/tv_name']
${ProductPrice}                  //*[@*='br.com.petz:id/text_price_new' or @*='br.com.petz:id/text_price_new']
${ProductSubscriberPrice}                  //*[@*='br.com.petz:id/text_subscriber_price' or @*='br.com.petz:id/text_subscriber_price']
${ProductAdded}                    //*[@*='br.com.petz:id/tv_product_name' or @*='br.com.petz:id/tv_product_name']
${QuickAddButton}               //*[@*='br.com.petz:id/cv_add_item' or @*='br.com.petz:id/cv_add_item']

#Home Banho e Tosa
${BetLeftMenu}                       //*[@*='Meu PerfilButton' or @*='br.com.petz:id/button_left_menu']
${BetEcosystems}                     //*[@*='MenuButton' or @*='br.com.petz:id/button_right_menu'] 
${BetImageLogoMenu}                  id=br.com.petz:id/image_logo_menu
${BeTMainBanner}                     //*[@*="Banner do banho e tosa"]
${BetScheduleNowBtn}                 id=br.com.petz.grooming:id/schedule_now_btn
${BeTCardSchedule}                   id=br.com.petz:id/card_scheduling_tv_schedule                                          
${ServicesGroomingMenuStart}         id=br.com.petz.grooming:id/menu_start
${ServicesGroomingMenuSchedule}      id=br.com.petz.grooming:id/menu_agenda
${ServicesGroomingMenuStoreUnits}    id=br.com.petz.grooming:id/menu_store_units 

#Home Seres Veterinário
${SeresLeftMenu}                    //*[@*='Meu PerfilButton' or @*='br.com.petz:id/button_left_menu']
${SeresEcosystems}                  //*[@*='MenuButton' or @*='br.com.petz:id/button_right_menu']  
${SeresImageLogoMenu}               id=br.com.petz:id/image_logo_menu
${SeresMainBanner}                  id=br.com.petz.seres:id/img_banner
${SeresScheduleNowBtn}              id=br.com.petz.seres:id/bt_schedule_home
${SeresCardSchedule}                id=br.com.petz:id/card_scheduling_tv_schedule
${SeresNavHome}                     id=br.com.petz.seres:id/nav_home
${SeresNavSchedule}                 id=br.com.petz.seres:id/nav_history_schedule
${SeresNavStoreUnits}               //*[@*="Unidades"]

#Home Blog
${BlogLeftMenuBtn}       //*[@*='Voltar' or @*='br.com.petz:id/button_custom_left_menu']
${BlogEcosystems}        //*[@*="br.com.petz:id/button_custom_right_menu"]
${BlogLogo}              //*[@*="logo"]
${BlogTextBanner}        //*[@*="Tudo o que você precisa saber sobre comportamento"]
${BlogHighlightPetz}     //*[@*="Destaques Petz"]
${BlogLearnbySubject}    //*[@*="Aprenda por assunto"]
${BlogKeepLearning}      //*[@*="Continue aprendendo"]
${BlogSeeMoreTopics}     //*[@*="Ver mais tópicos"]
${BlogSeeAllPubli}       //*[@*="Ver Todos"]

*** Keywords ***
im on the app
    [Arguments]    ${EmailOrCpf}    ${Password}
    Fill in Login    ${EmailOrCpf}    ${Password}
    Sleep    4
    Validate and Click    ${JumpOnboarding}
    Validate Store Home

that I'm a new user
    Validate Login Screen
    Sleep    2
    # Dado que seja um usuario novo
    # Fill in Login    ${CPF}     ${SENHA}
    Validate and Click    ${CreateAccountButton}
    Fill in Registration
    Validate Security Login
    Validate and Click    ${SecurityScreenReceiveCodeButton}
    Validate Secutity Login 2
    Validate and Click    ${SecurityScreenSetCode1}
    Press Keycode    7
    Sleep    2
    Press Keycode    7
    Sleep    2
    Press Keycode    7
    Sleep    2
    Press Keycode    7
    Sleep    2
    Press Keycode    7
    Sleep    2
    Press Keycode    7
    Sleep    2
    Validate and Click    ${SecurityScreenValidateRegisterButton}
    Validate and Click    ${JumpOnboarding}
    Validate Store Home

Enter The Ecosystem
    [Arguments]    ${Ecosystem}
    Validate and Click    ${Ecosystems}
    Validate Element    ${EcosystemsStore}
    Validate Element    ${EcosystemsSeres}
    Validate Element    ${EcosystemsBeT}
    Validate and Click    ${Ecosystem}

Dado que seja um usuario novo
    Conectar a API Usuarios
    Dado que um novo usuario deseja se cadastrar informando os dados obrigatórios
    Quando obtiver o retorno da requisição de usuarios o Status Code deverá ser     200
    Então Serão validados os dados de retorno do novo usuário de acordo com o body validando os dados cadastrados

Dado que queira cadastrar um pet cachorro
    Conectar a API Pets
    Dado que o usuario deseja cadastrar um novo cachorro informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Dado que queira cadastrar um pet gato
    Conectar a API Pets
    Dado que o usuario deseja cadastrar um novo Gato informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Schedule a New Appointment of Bath And Grooming Via Api
    Dado que um novo usuario cadastrado deseja criar um agendamento simples de banho com as informações necessárias
    Quando obtiver o retorno da requisição de agendamento o Status Code deverá ser    201
    Então Serão validados os dados de retorno do do agendamento de acordo com o body validando os dados cadastrados
    E em seguida realizo a confirmação do agendamento aguardando status    204

Schedule a New Appointment of Vaccine Via Api
    Sleep    2

Schedule a New Appointment of Consult Via Api
    Sleep    2

Fill in Login
    [Arguments]    ${Email}    ${Password}
    Validate Login Screen
    Validate and Input Text    ${UserEmailOrCpfTextField}    ${Email}
    Sleep    2
    Validate and Input Text    ${UserPasswordTextfield}    ${Password}
    Sleep    4
    Validate and Click    ${Submit}

Fill in Registration
    ${FakeName}    FakerLibrary.Name
    ${FakeCpf}    FakerLibrary.cpf
    ${FakeEmail}    FakerLibrary.Random Number    digits= 10
    ${CellPhoneFake3}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake4}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake5}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake6}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake7}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake8}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake9}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake10}            FakerLibrary.Random Number    digits=1
    ${CellPhoneFake11}            FakerLibrary.Random Number    digits=1
    Close Modal Braze
    Swipe To the Top    ${FullNameTextField}
    Validate Element    ${HeaderCreateAccount}
    Click Element    ${FullNameTextField}
    Input Text    ${FullNameTextField}    ${FakeName}
    Input Text    ${CpfTextField}    ${FakeCpf}
    Input Text    ${EmailTextField}    ${FakeEmail}@stresstest.com.br
    Validate and Click    ${CellPhoneTextField}
    Input Text Into Current Element        1
    Sleep    1
    Input Text Into Current Element    1
    Sleep    1
    Input Text Into Current Element    9
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake4}
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake5}
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake6}
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake7}
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake8}
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake9}
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake10}
    Sleep    1
    Input Text Into Current Element    ${CellPhoneFake11}
    Hide Keyboard
    Sleep    3
    Click Element    ${Genders}
    # Validate and Click    ${MaleGender}
    Sleep    3
    Click Element At Coordinates     278    1590
    Hide Keyboard
    Sleep    3
    Validate and Click    ${DateOfBirthTextField}
    Press Keycode    8
    Press Keycode    8
    Press Keycode    8
    Press Keycode    8
    Press Keycode    9
    Press Keycode    7
    Press Keycode    7
    Press Keycode    7 
    Hide Keyboard
    Sleep    1
    Input Text    ${PasswordTextField}    ${Password}
    Swipe Until Element is Visible    ${CreateAccountButton}
    Input Text    ${ConfirmPasswordTextField}    123456
    Click Element    ${CheckBoxTerms}
    Click Element    ${CreateAccountButton}
    Sleep    8
    Set Test Variable   ${FakeCpf}    
    Set Test Variable   ${FakeEmail} 
    Set Test Variable   ${Password}

Validate Element
    [Arguments]    ${Locator}
    Wait Until Element Is Visible    ${Locator}    40

Validate Text
    [Arguments]    ${Locator}
    Wait Until Page Contains    ${Locator}    40

Validate and Input Text
    [Arguments]    ${Locator}    ${String}
    Wait Until Element Is Visible    ${Locator}    40
    Element Should Be Enabled    ${Locator}    40
    Input Text    ${Locator}    ${String}

Validate and Click
    [Arguments]    ${Locator}
    Wait Until Element Is Visible    ${Locator}    40
    Element Should Be Enabled    ${Locator}    40
    Click Element    ${Locator}

Validate and Click On
    [Arguments]    ${Locator}
    Sleep    4
    Wait Until Element Is Visible    ${Locator}    40
    Element Should Be Enabled    ${Locator}    40
    Click Element    ${Locator}

Validate and Click On Text
    [Arguments]    ${Locator}
    Sleep    4
    Wait Until Page Contains    ${Locator}    40
    Click Text    ${Locator}

Validate and Click Text
    [Arguments]    ${Locator}
    Wait Until Page Contains    ${Locator}    40
    Click Text    ${Locator}

Inspect if Text Exists and Confirm
    [Arguments]    ${Text}
    FOR    ${index}    IN RANGE    1
        ${CheckElement}    Run Keyword and Return Status    Wait Until Page Contains    ${Text}
        LOG    ${CheckElement}
        IF    ${CheckElement} == True
            Click Text    ${Text}
        ELSE
            Wait Until Page Contains    ${Text}
        END
    END

Inspect if Element Exists and Confirm
    [Arguments]    ${Locator}        ${AnotherLocator}
    FOR    ${index}    IN RANGE    1
        ${CheckElement}    Run Keyword and Return Status    Validate Element    ${Locator}
        LOG    ${CheckElement}
        IF    ${CheckElement} == True
            Click Element    ${Locator}
        ELSE
            Validate Element    ${AnotherLocator}
        END
    END

Swipe Until Element is Visible
    [Arguments]    ${Element}
    FOR    ${i}    IN RANGE    40
        ${Result}    Run KeyWord And Return Status    Element Should Be Visible    ${Element}
        IF    ${Result}    BREAK
        Swipe By Percent     50.18     46.87      50.18       18.22
    END

Swipe Until Text is Visible
    [Arguments]    ${Element}
    FOR    ${i}    IN RANGE    20
        ${Result}    Run KeyWord And Return Status    Wait Until Page Contains    ${Element}
        IF    ${Result}    BREAK
        Swipe By Percent     50.18     46.87      50.18       18.22
    END

Swipe To the Top
    [Arguments]    ${Element}
    FOR    ${i}    IN RANGE    20
        ${Result}    Run KeyWord And Return Status    Element Should Be Visible    ${Element}
        IF    ${Result}    BREAK
        Swipe By Percent    50    30    50    70
        Sleep    1
    END

Validate Security Login
    Validate Element    ${SecurityScreenTitle} 
    Validate Element    ${SecurityScreenAlert}
    Validate Element    ${SecurityScreenSmsText}
    Validate Element    ${SecurityScreenRadioButton}
    Validate Element    ${SecurityScreenReceiveCodeButton}
    Validate Element    ${SecurityScreenNeedHelpButton}

Validate Secutity Login 2
    Validate Element    ${SecurityScreenTextCodeSend} 
    Validate Element    ${SecurityScreenTextVerifyCode}
    Validate Element    ${SecurityScreenTextResendCode}
    Validate Element    ${SecurityScreenValidateRegisterButton}
    Validate Element    ${SecurityScreenSetCode1}
    Validate Element    ${SecurityScreenSetCode2}
    Validate Element    ${SecurityScreenSetCode3}
    Validate Element    ${SecurityScreenSetCode4}
    Validate Element    ${SecurityScreenSetCode5}
    Validate Element    ${SecurityScreenSetCode6}

Validate Lateral Menu
    Validate Element    ${LateralMenuProfileHello}
    Validate Element    ${LateralMenuTierClubz}
    Validate Element    ${LateralMenu}
    Validate Element    ${LateralMenuMeusPedidos}
    Validate Element    ${LateralMenuFavoritos}
    Validate Element    ${LateralMenuAjuda}
    Validate Element    ${LateralMenuMeusDados}
    Validate Element    ${LateralMenuMeusPets}
    Validate Element    ${LateralMenuMinhaCarteira}
    Validate Element    ${LateralMenuEndereços}
    Validate Element    ${LateralMenuAlterarSenha}
    Validate Element    ${LateralMenuFeedPetz}
    Validate Element    ${LateralMenuPolíticasPetz}
    Swipe Until Element is Visible    ${LateralMenuSair}
    Swipe To the Top    ${LateralMenuAjuda}
    Validate Element    ${LateralMenuFechar}

Validate Login Screen
    Validate Element    ${UserEmailOrCpfTextField}
    Validate Element    ${UserPasswordTextfield}
    Validate Element    ${Submit}
    Validate Element    ${ForgotPassword}
    Validate Element    ${Divider}
    Validate Element    ${LoginWithoutAccount}
    Validate Element    ${CreateAccountButton}

Validate Create Account Screen
    Validate Element    ${HeaderCreateAccount}
    Validate Element    ${FullNameTextField}
    Validate Element    ${CpfTextField}
    Validate Element    ${EmailTextField}
    Validate Element    ${CellPhoneTextField}
    Validate Element    ${Genders}
    Validate Element    ${DateOfBirthTextField}
    Validate Element    ${PasswordTextField}
    Swipe Until Element is Visible    ${CreateAccountButton}
    Validate Element    ${ConfirmPasswordTextField}
    Validate Element    ${TermsAndConditions}
    Validate Element    ${CheckBoxTerms}
    Validate Element    ${CreateAccountButton}

Validate Store Home
    Validate Element    ${Ecosystems}
    Validate Element    ${LateralMenu}
    Validate Element    ${NavBarStoreHome}
    Validate Element    ${NavBarSignatureHome}
    Validate Element    ${NavBarRepurchase}
    Validate Element    ${NavBarClubz}
    Validate Element    ${NavBarBag}

Validate Grooming Home
    Validate Element    ${BetLeftMenu}
    Validate Element    ${Ecosystems}
    Validate Element    ${BetImageLogoMenu}
    Validate Element    ${BeTMainBanner}
    Validate Element    ${BetScheduleNowBtn}
    Validate Element    ${BeTCardSchedule}
    Validate Element    ${ServicesGroomingMenuStart}
    Validate Element    ${ServicesGroomingMenuSchedule}
    Validate Element    ${ServicesGroomingMenuStoreUnits}

Validate Seres Home
    Validate Element    ${SeresLeftMenu}
    Validate Element    ${SeresEcosystems}
    Validate Element    ${SeresImageLogoMenu}
    Validate Element    ${SeresMainBanner}
    Validate Element    ${SeresScheduleNowBtn}
    Validate Element    ${SeresCardSchedule}
    Validate Element    ${SeresNavHome} 
    Validate Element    ${SeresNavSchedule}
    Validate Element    ${SeresNavStoreUnits}

Validate Blog Home
    Validate Element    ${BlogLeftMenuBtn}
    Validate Element    ${BlogEcosystems}
    Validate Element    ${BlogLogo}
    Validate Element    ${BlogTextBanner}
    Validate Element    ${BlogHighlightPetz}
    Swipe Until Element is Visible    ${BlogSeeAllPubli}
    Validate Element    ${BlogLearnbySubject}
    Validate Element    ${BlogSeeMoreTopics}
    Validate Element    ${BlogSeeAllPubli}
    

# Itens de acesso ao menu lateral e validacao simples que acessou a tela
Access My Pets
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate and Click    ${LateralMenuMeusPets}

Access Help on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessHelp}
    Validate Element    ${LateralMenuHelpValidate}

Access Favorites on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessFavorites}
    Validate Element    ${LateralMenuFavoritesValidate}

Access My Data on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessMyData}
    Validate Element    ${LateralMenuMyDataValidate}

Access Orders on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessOrders}
    Validate Element    ${LateralMenuOrdersValidate}

Access Wallet on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessWallet}
    Validate Element    ${LateralMenuWalletValidate}

Access Feed Petz on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessFeedPetz}
    Validate Element    ${LateralMenuFeedPetzValidate}

Access Adresses on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessAdresses}
    Validate Element    ${LateralMenuAdressesValidate}

Access Change Password on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessChangePassword}
    Validate Element    ${LateralMenuChangePasswordValidate}

Access Petz Politics on Menu Lateral  
    Validate and Click    ${LateralMenuButton}
    Validate Lateral Menu
    Validate And Click    ${LateralMenuAcessPetzPolitics}
    Validate Element    ${LateralMenuPetzPoliticsValidate}

click in find field
    Validate and Click  ${ButtonSearchHome}

search product
    [Arguments]     ${Texto}
    Sleep       3
    Input Text Into Current Element     ${Texto}
    Sleep    1
    Hide Keyboard
    Sleep       1
    Press Keycode      66

should return the most shearched result
    Element Should Contain Text    ${FirstProductDisplayed}     ${ProductSearchedName}
    Element Should Contain Text    ${SecondProductDisplayed}     ${ProductSearchedName}

should return the searched result
    Wait Until Page Contains Element    ${FirstProductSearched}     
    Wait Until Page Contains Element    ${SecondProductSearched}     

click in the most searched products
    Sleep                    3
    ${ProductSearchedName}     Get Text               ${MostSearchedProducts}
    Validate and Click       ${MostSearchedProducts}
    Sleep                    1
    Hide Keyboard

Access the clubz page
    Validate and Click  ${NavBarClubz}


I click in first product
    Validate and Click       ${FirstProductSearched}

I click to favorite
    Validate and Click       ${FavoriteButton}

I back to store pages
    Validate and Click       ${NavBarStoreHome}

The favorited product must be displayed
    Validate Element        ${FirstProductSearched}

I click to unfavorite
    Validate and Click      ${UnfavoriteButton}

i click in my offers
    Validate and Click        ${MinhasOfertasButton}

The favorited product should not be displayed
    Validate and Click  ${UnfavoriteConfirmationButton}
    Validate Element  ${FavoritePageEmpty}

click in recommended product
    Close Modal Update App
    Swipe Until Element is Visible      ${RecommendedProduct}
    Validate and Click                  ${RecommendedProduct}
    Validate Element                    ${ProductTittle} 
    Swipe Until Element is Visible      ${ProductPrice}
    Validate Element                    ${ProductPrice}          
    Validate Element                    ${ProductSubscriberPrice}
    
click to add product to bag
    Swipe Until Element is Visible        ${AddToBagButton}
    Validate and Click                    ${AddToBagButton}
    
click to go to the bag
    Validate Element                        ${AddMoreProducts}
    Sleep                                    5
    Validate Element                        ${ProductAdded}
    Validate and Click                      ${OpenBag}

Close Modal Update App
    FOR    ${index}    IN RANGE    1
        ${CheckElement}    Run Keyword and Return Status    Wait Until Element Is Visible    //*[@*="Fechar banner"]    05    
        LOG    ${CheckElement}
            IF    ${CheckElement} == True
                Validate and Click    //*[@*="Fechar banner"]
            END
    END

click to quick add a recommended product
    Swipe Until Element is Visible      ${RecommendedProduct}
    Validate and Click                  ${QuickAddButton}


Access Bag Page
    Validate and Click        ${NavBarBag}


Validate Element Text
    [Arguments]    ${locators}    ${text}
    Wait Until Element Is Visible    ${locators}    10
    Element Text Should Be    ${locators}    ${text}

Close Modal Braze
    ${ValidateModalBraze}    Run Keyword And Return Status    Wait Until Element Is Visible    ${ModalBraze}    30
    IF    ${ValidateModalBraze}
    Click Element   ${ModalBraze}
    END
