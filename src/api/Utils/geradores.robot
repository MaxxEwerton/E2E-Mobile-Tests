*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${CLIENT_ID}        14d20d79-de8c-3e22-af15-f6d317b07ebc
${CLIENT_SECRET}    c8259736-cfd0-376e-ae1c-507c04ddf101
${API_KEY}          ce774654-7baf-11ed-a1eb-0242ac120002
&{USER}             cpf=45368311850
...                 password=123456
${auth}             Create List    ${CLIENT_ID}    ${CLIENT_SECRET}


*** Keywords ***
# AÇÕES

# Gerador cpf
#     Create Session    cpf    https://www.4devs.com.br
#     ${headers}    Create Dictionary    Content-Type=application/x-www-form-urlencoded; charset=UTF-8
#     ${data}    Create Dictionary    acao=gerar_cpf    pontuacao=N
#     ${json_data}    Evaluate    json.dumps($data)    json
#     ${CPF}    Post Request
#     ...    cpf
#     ...    /ferramentas_online.php
#     ...    data=${data}
#     ...    headers=${headers}
#     Log    ${CPF.text}
#     ${CPF_GERADO}    Evaluate    ${CPF.text}
#     ${CPF_GERADO}    Convert To String    ${CPF_GERADO}
#     Set test Variable    ${CPF_GERADO}
#     RETURN    ${CPF_GERADO}

Gerador cpf
    Create Session    cpf    https://www.4devs.com.br
    ${headers}    Create Dictionary    Content-Type=application/x-www-form-urlencoded; charset=UTF-8
    ${data}    Create Dictionary    acao=gerar_cpf    pontuacao=N
    ${json_data}    Evaluate    json.dumps($data)    json
    ${response}    Post Request    cpf    /ferramentas_online.php    data=${data}    headers=${headers}
    Log To Console    ${response.text}    
    ${cpf_text}    Convert To String    ${response.text}    
    ${cpf_gerado}    Set Variable    ${cpf_text}  
    Set Test Variable    ${cpf_gerado}
    RETURN    ${cpf_gerado}
