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
Resource    ResourcePets.robot


*** Keywords ***
# SETUP E TEARDOWN
Conectar a API Agendamento
    Create Session    labPetz    ${BASE_URL}
    Token Asm
    ${BEARER}    Catenate    Bearer    ${ACCESS_TOKEN}
    ${headers}    Create Dictionary
    ...    client_id=${${ENV}CLIENT_ID}
    ...    clientId=cbeda2a3-8443-46cc-8d13-d862cee33f2b
    ...    Authorization=${BEARER}
    ...    content-type=application/json
    Set Suite Variable    ${headers}

# AÇÕES

Consulta primeiro horario Moura
    Conectar a API Agendamento
    ${headers}    Create Dictionary
    ...    content-type=application/json
    ...    Origin=BET
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${SSM}/18328118000109/available-schedule?specialtyId=9&professionalId=2731&petId=1&usePackage=true&servicesIds=3066,3707
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${HORARIO_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]["hours"][0]}    hourEpochTimestamp
    Set Test Variable    ${HORARIO_INDICE_0}

Dado que um novo usuario cadastrado deseja criar um agendamento simples de banho com as informações necessárias
    ${DATA}    Load Json From File    ./src/api/fixtures/agendamento/Agendamento.json
    Consulta primeiro horario Moura
    Consulta pets usuario
    ${DATA}    Update Value To Json    ${DATA}    $.attendances[0].date    ${HORARIO_INDICE_0}
    ${DATA}    Update Value To Json    ${DATA}    $.attendances[0].pet.uuid    ${PET_PADRAO}
    ${DATA}    Update Value To Json    ${DATA}    $.attendances[0].professional.id    ${${ENV}_PROFISSIONAL_ID}
    ${DATA}    Update Value To Json    ${DATA}    $.attendances[0].services[0].id    ${${ENV}_SERVICE}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${SCHEDULING}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${ID_GROUP}    Get From Dictionary    ${RESPOSTA.json()}    idGroup
    Set Test Variable    ${ID_GROUP}

# CONFERÊNCIAS

Quando obtiver o retorno da requisição de agendamento o Status Code deverá ser
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Então Serão validados os dados de retorno do do agendamento de acordo com o body validando os dados cadastrados
    ${DATE}    Get From Dictionary    ${DATA["attendances"][0]}    date
    Dictionary Should Contain Item    ${RESPOSTA.json()["attendances"][0]}    date    ${DATE}
    Dictionary Should Contain Item    ${RESPOSTA.json()["attendances"][0]["pet"]}    name    ${PET_PADRAO_NAME}

E em seguida realizo a confirmação do agendamento aguardando status
    [Arguments]    ${STATUSCODE_DESEJADO}
    ${DATA}    Create Dictionary    observation=Obs teste
    ${RESPOSTA}    Patch Request
    ...    labPetz
    ...    ${SCHEDULING}/${ID_GROUP}/confirm
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}
