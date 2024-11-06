*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     String
Library     Telnet
Library     RPA.RobotLogListener
Library     FakerLibrary    locale=pt_br
Library     CSVLibrary
Resource    ../Enviroments/Env.robot
Resource    ../Enviroments/Endpoints.robot
Resource    ../Utils/token.robot
Resource    ../Utils/geradores.robot


*** Variables ***
${file_path}    ./src/api/Results/${ENV}_dados.csv


*** Keywords ***
# SETUP E TEARDOWN
Conectar a API Usuarios
    Create Session    labPetz    ${BASE_URL}
# AÇÕES

Dado que um novo usuario deseja se cadastrar informando os dados obrigatórios
    ${headers}    Create Dictionary
    ...    content-type=application/json
    ${CPF}    Gerador cpf
    ${EMAIL_FAKE}    Free Email
    ${NOME_FAKE}    FakerLibrary.name
    ${DDD}    Generate random string    2    123456789
    ${FONE}    Generate random string    9    123456789
    Set Test Variable    ${NOME_FAKE}
    ${DATA}    Load Json From File    ./src/api/fixtures/usuarios/NewUser.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.document    ${CPF}
    ${DATA}    Update Value To Json    ${DATA}    $.email    ${EMAIL_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.cellphoneAreaCode    ${DDD}
    ${DATA}    Update Value To Json    ${DATA}    $.cellphone    ${FONE}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${CDM_V2}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}

# CONFERÊNCIAS

Quando obtiver o retorno da requisição de Usuarios o Status Code deverá ser
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Então Serão validados os dados de retorno do novo usuário de acordo com o body validando os dados cadastrados
    ${CPF}    Get From Dictionary    ${DATA}    document
    ${NOME}    Get From Dictionary    ${DATA}    name
    ${GENERO}    Get From Dictionary    ${DATA}    gender
    ${EMAIL}    Get From Dictionary    ${DATA}    email
    ${SENHA}    Get From Dictionary    ${DATA}    password
    Dictionary Should Contain Item    ${RESPOSTA.json()}    document    ${CPF}
    Dictionary Should Contain Item    ${RESPOSTA.json()["customer"]}    name    ${NOME}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    gender    ${GENERO}
    Dictionary Should Contain Item    ${RESPOSTA.json()["customer"]}    email    ${EMAIL}
    ${list}    Create List    ${CPF}    ${EMAIL}    ${SENHA}
    ${data}    create list    ${list}
    Append To Csv File    ${file_path}    ${data}    delimiter=;
    Set Test Variable    ${CPF}
    Set Test Variable    ${SENHA}