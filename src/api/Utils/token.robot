
*** Settings ***

Library             RequestsLibrary
Library             Collections
Resource            ../Enviroments/Env.robot
Resource            ../Enviroments/Endpoints.robot

*** Variables ***
${CLIENT_SECRET}      c8259736-cfd0-376e-ae1c-507c04ddf101
${API_KEY}            cebe7a77-584f-4635-bf75-e32a55b7e3fc
${auth}    Create List    ${${ENV}_CLIENT_ID}    ${CLIENT_SECRET}


*** Keywords ***

# AÇÕES

Token Sensedia
    ${auth}    Create List    ${${ENV}_CLIENT_ID}    ${CLIENT_SECRET}
    Create Session    tokenSensidia    ${BASE_URL}     auth=${auth}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary    grant_type=client_credentials
    ${json_data}    Evaluate    json.dumps($data)    json

    ${ACCESS_TOKEN}    Post Request
    ...    tokenSensidia
    ...    ${TOKEN_SENSIDIA}
    ...    data=${data}  
    ...    headers=${headers}
    Log    ${ACCESS_TOKEN.text}
    ${ACCESS_TOKEN}        Get From Dictionary    ${ACCESS_TOKEN.json()}    access_token
    Set Test Variable    ${ACCESS_TOKEN}

Token BeT
    ${auth}    Create List    ${${ENV}_CLIENT_ID}    ${CLIENT_SECRET}
    Create Session    tokenSensidia    ${BASE_URL}
    ${headers}    Create Dictionary    Content-Type=application/json    api-key=${API_KEY}    ${${ENV}_CLIENT_ID}=${${ENV}_CLIENT_ID}
    ${data}    Create Dictionary    username=${${ENV}_USER.cpf}    password=${${ENV}_USER.password}
    ${json_data}    Evaluate    json.dumps($data)    json

    ${ACCESS_TOKEN}    Post Request
    ...    tokenSensidia
    ...    ${TOKEN_BeT}
    ...    data=${data}  
    ...    headers=${headers}
    Log    ${ACCESS_TOKEN.text}
    ${ACCESS_TOKEN}        Get From Dictionary    ${ACCESS_TOKEN.json()}    accessToken
    Set Test Variable    ${ACCESS_TOKEN}
    

Token Asm
    Create Session    tokenSensidia    ${BASE_URL}
    ${headers}    Create Dictionary    Content-Type=application/json    api-key=${API_KEY}
    ${data}    Create Dictionary    username=${${ENV}_USER.cpf}    password=${${ENV}_USER.password}
    ${json_data}    Evaluate    json.dumps($data)    json

    ${ACCESS_TOKEN}    Post Request
    ...    tokenSensidia
    ...    ${ASM_TOKEN}
    ...    data=${data}  
    ...    headers=${headers}
    Log    ${ACCESS_TOKEN.text}
    ${ACCESS_TOKEN}        Get From Dictionary    ${ACCESS_TOKEN.json()}    accessToken
    Set Suite Variable    ${ACCESS_TOKEN}

# *** Test Cases ***
# Imprimir token
#     Token Asm
#     Log To Console    ${ACCESS_TOKEN}


    