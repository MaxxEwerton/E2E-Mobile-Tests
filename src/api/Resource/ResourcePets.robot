*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     String
Library     Telnet
Library     FakerLibrary    locale=pt_BR
Library     RPA.RobotLogListener
Resource    ../Enviroments/Env.robot
Resource    ../Enviroments/Endpoints.robot
Resource    ../Utils/token.robot


*** Keywords ***
# SETUP E TEARDOWN
Conectar a API Pets
    Create Session    labPetz    ${BASE_URL}
    Token Asm
    ${BEARER}    Catenate    Bearer    ${ACCESS_TOKEN}
    ${headers}    Create Dictionary
    ...    client_id=${${ENV}_CLIENT_ID}
    ...    clientId=e1c391c4-b7f1-4573-93de-d812242780bd
    ...    Authorization=${BEARER}
    ...    content-type=application/json
    Set Suite Variable    ${headers}


# AÇÕES

Consulta pets usuario
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${CUSTOMERS_DOCUMENT}/${${ENV}_USER.cpf}/pets
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${PET_PADRAO}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    ${PET_PADRAO_NAME}    Get From Dictionary    ${RESPOSTA.json()[0]}    name
    Set Test Variable    ${PET_PADRAO}
    Set Test Variable    ${PET_PADRAO_NAME}     

Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_CACHORRO}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    ${UUID_GATO}    Get From Dictionary    ${RESPOSTA.json()[1]}    uuid
    ${UUID_PEIXE}    Get From Dictionary    ${RESPOSTA.json()[2]}    uuid
    ${UUID_AVE}    Get From Dictionary    ${RESPOSTA.json()[3]}    uuid
    ${UUID_ROEDOR}    Get From Dictionary    ${RESPOSTA.json()[4]}    uuid
    ${UUID_COELHO}    Get From Dictionary    ${RESPOSTA.json()[5]}    uuid
    ${UUID_REPTIL}    Get From Dictionary    ${RESPOSTA.json()[6]}    uuid
    Set Test Variable    ${UUID_CACHORRO}
    Set Test Variable    ${UUID_GATO}
    Set Test Variable    ${UUID_PEIXE}
    Set Test Variable    ${UUID_AVE}
    Set Test Variable    ${UUID_ROEDOR}
    Set Test Variable    ${UUID_COELHO}
    Set Test Variable    ${UUID_REPTIL}

Dado que o usuario deseja requisitar todas as raças de cachorro
    Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}/${UUID_CACHORRO}/${RACAS}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_RACA_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    Set Test Variable    ${UUID_RACA_INDICE_0}

Dado que o usuario deseja requisitar todas as raças de gato
    Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}/${UUID_GATO}/${RACAS}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_RACA_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    Set Test Variable    ${UUID_RACA_INDICE_0}

Dado que o usuario deseja requisitar todas as raças de peixe
    Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}/${UUID_PEIXE}/${RACAS}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_RACA_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    Set Test Variable    ${UUID_RACA_INDICE_0}

Dado que o usuario deseja requisitar todas as raças de Ave
    Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}/${UUID_AVE}/${RACAS}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_RACA_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    Set Test Variable    ${UUID_RACA_INDICE_0}

Dado que o usuario deseja requisitar todas as raças de roedor
    Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}/${UUID_ROEDOR}/${RACAS}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_RACA_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    Set Test Variable    ${UUID_RACA_INDICE_0}

Dado que o usuario deseja requisitar todas as raças de coelho
    Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}/${UUID_COELHO}/${RACAS}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_RACA_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    Set Test Variable    ${UUID_RACA_INDICE_0}

Dado que o usuario deseja requisitar todas as raças de réptil
    Dado que o usuario deseja requisitar todas as especies
    ${RESPOSTA}    Get Request
    ...    labPetz
    ...    ${ESPECIES}/${UUID_REPTIL}/${RACAS}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    ${UUID_RACA_INDICE_0}    Get From Dictionary    ${RESPOSTA.json()[0]}    uuid
    Set Test Variable    ${UUID_RACA_INDICE_0}

Dado que o usuario deseja cadastrar um novo cachorro informando os dados obrigatórios
    ${NOME_FAKE}    FakerLibrary.name
    Set Test Variable    ${NOME_FAKE}
    Dado que o usuario deseja requisitar todas as raças de cachorro
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_CACHORRO}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${DATA}    Update Value To Json    ${DATA}    $.customerUuid    ${${ENV}_CUSTOMER_UUID}
    Log To Console    ${DATA}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}
    Log To Console    ${UUID_PET}

Dado que o usuario deseja cadastrar um novo Gato informando os dados obrigatórios
    ${NOME_FAKE}    FakerLibrary.name
    Set Test Variable    ${NOME_FAKE}
    Dado que o usuario deseja requisitar todas as raças de gato
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_GATO}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}

Dado que o usuario deseja cadastrar um novo Peixe informando os dados obrigatórios
    ${NOME_FAKE}    FakerLibrary.name
    Set Test Variable    ${NOME_FAKE}
    Dado que o usuario deseja requisitar todas as raças de peixe
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_PEIXE}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}

 Dado que o usuario deseja cadastrar um novo pet Ave informando os dados obrigatórios
    ${NOME_FAKE}    FakerLibrary.name
    Set Test Variable    ${NOME_FAKE}
    Dado que o usuario deseja requisitar todas as raças de ave
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_AVE}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}

Dado que o usuario deseja cadastrar um novo pet Roedor informando os dados obrigatórios
    ${NOME_FAKE}    FakerLibrary.name
    Set Test Variable    ${NOME_FAKE}
    Dado que o usuario deseja requisitar todas as raças de roedor
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_ROEDOR}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}

Dado que o usuario deseja cadastrar um novo pet Coelho informando os dados obrigatórios
    ${NOME_FAKE}    FakerLibrary.name
    Set Test Variable    ${NOME_FAKE}
    Dado que o usuario deseja requisitar todas as raças de coelho
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_COELHO}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}

Dado que o usuario deseja cadastrar um novo pet Réptil informando os dados obrigatórios
    ${NOME_FAKE}    FakerLibrary.name
    Set Test Variable    ${NOME_FAKE}
    Dado que o usuario deseja requisitar todas as raças de réptil
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${NOME_FAKE}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_REPTIL}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}

 Dado que o usuario deseja cadastrar um novo pet informando os dados obrigatórios menos o nome
    Dado que o usuario deseja requisitar todas as raças de réptil
    ${DATA}    Load Json From File    fixtures/pets/NewPet.json
    ${DATA}    Update Value To Json    ${DATA}    $.name    ${EMPTY}
    ${DATA}    Update Value To Json    ${DATA}    $.speciesUuid    ${UUID_REPTIL}
    ${DATA}    Update Value To Json    ${DATA}    $.breedUuid    ${UUID_RACA_INDICE_0}
    ${RESPOSTA}    Post Request
    ...    labPetz
    ...    ${PET_V1}${PETS}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}
    ${UUID_PET}    Get From Dictionary    ${RESPOSTA.json()}    uuid
    Set Test Variable    ${UUID_PET}

Excluir pet
    ${BEARER}    Catenate    Bearer    ${ACCESS_TOKEN}
    ${RESPOSTA}    Delete Request
    ...    labPetz
    ...    ${PET_V1}${PETS}/${UUID_PET}
    ...    data=${DATA}
    ...    headers=${headers}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
    Set Test Variable    ${DATA}

# CONFERÊNCIAS
Quando obtiver o retorno da requisição de Pets o Status Code deverá ser
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Então Serão validados os dados de retorno de acordo com o body de retorno pra especies
    Dictionary Should Contain Item    ${RESPOSTA.json()[0]}    name    Cachorro
    Dictionary Should Contain Item    ${RESPOSTA.json()[1]}    name    Gato
    Dictionary Should Contain Item    ${RESPOSTA.json()[2]}    name    Peixe
    Dictionary Should Contain Item    ${RESPOSTA.json()[3]}    name    Ave
    Dictionary Should Contain Item    ${RESPOSTA.json()[4]}    name    Roedor
    Dictionary Should Contain Item    ${RESPOSTA.json()[5]}    name    Coelho
    Dictionary Should Contain Item    ${RESPOSTA.json()[6]}    name    Réptil

Então Serão validados os dados de retorno de acordo com o body validando que cachorro e gato apenas podem realizar serviços
    Should Not Be Empty    ${RESPOSTA.json()[0]["supportedBusinessLine"]}
    Should Not Be Empty    ${RESPOSTA.json()[1]["supportedBusinessLine"]}
    Should Contain    ${RESPOSTA.json()[0]["supportedBusinessLine"][0]}    name    Veterinário    or    Estética
    Should Contain    ${RESPOSTA.json()[0]["supportedBusinessLine"][1]}    name    Veterinário    or    Estética
    Should Contain    ${RESPOSTA.json()[1]["supportedBusinessLine"][0]}    name    Veterinário    or    Estética
    Should Contain    ${RESPOSTA.json()[1]["supportedBusinessLine"][1]}    name    Veterinário    or    Estética
    Should Be Empty    ${RESPOSTA.json()[2]["supportedBusinessLine"]}
    Should Be Empty    ${RESPOSTA.json()[3]["supportedBusinessLine"]}
    Should Be Empty    ${RESPOSTA.json()[4]["supportedBusinessLine"]}
    Should Be Empty    ${RESPOSTA.json()[5]["supportedBusinessLine"]}
    Should Be Empty    ${RESPOSTA.json()[6]["supportedBusinessLine"]}

Então Serão validados os dados de retorno de acordo com o body validando as raças disponíveis para a especie cachorro
    Dictionary Should Contain Item    ${RESPOSTA.json()[0]}    name    SRD GRDE PELO CURTO
    Dictionary Should Contain Item    ${RESPOSTA.json()[1]}    name    SRD GRDE PELO LONGO
    Dictionary Should Contain Item    ${RESPOSTA.json()[2]}    name    SRD MD PELO CURTO
    Dictionary Should Contain Item    ${RESPOSTA.json()[3]}    name    SRD MD PELO LONGO
    Dictionary Should Contain Item    ${RESPOSTA.json()[4]}    name    SRD PEQ PELO CURTO
    Dictionary Should Contain Item    ${RESPOSTA.json()[5]}    name    SRD PQ PELO CURTO

Então Serão validados os dados de retorno de acordo com o body validando as raças disponíveis para a especie gato
    Dictionary Should Contain Item    ${RESPOSTA.json()[0]}    name    GATO SRD PELO CURTO
    Dictionary Should Contain Item    ${RESPOSTA.json()[1]}    name    GATO SRD PELO CURTO
    Dictionary Should Contain Item    ${RESPOSTA.json()[2]}    name    GATO SRD PELO LONGO
    Dictionary Should Contain Item    ${RESPOSTA.json()[3]}    name    GATO SRD PELO MEDIO
    Dictionary Should Contain Item    ${RESPOSTA.json()[4]}    name    GATO SRD PELO MEDIO
    Dictionary Should Contain Item    ${RESPOSTA.json()[5]}    name    GATO SRD PQ PELO CURTO

Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados
    ${UUID_ESPECIE}    Get From Dictionary    ${DATA}    speciesUuid
    ${UUID_RACA}    Get From Dictionary    ${DATA}    breedUuid
    ${DT_NASCIMENTO}    Get From Dictionary    ${DATA}    birthday
    ${GENERO}    Get From Dictionary    ${DATA}    gender
    ${PESO}    Get From Dictionary    ${DATA}    weight
    ${CASTRADO}    Get From Dictionary    ${DATA}    castrated
    Dictionary Should Contain Item    ${RESPOSTA.json()}    name    ${NOME_FAKE}
    Dictionary Should Contain Item    ${RESPOSTA.json()["breed"]["species"]}    uuid    ${UUID_ESPECIE}
    Dictionary Should Contain Item    ${RESPOSTA.json()["breed"]}    uuid    ${UUID_RACA_INDICE_0}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    birthday    ${DT_NASCIMENTO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    gender    ${GENERO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    weight    ${PESO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    castrated    ${CASTRADO}
    #Excluir pet
    Log To Console    ${NOME_FAKE}    EXCLUIDO
