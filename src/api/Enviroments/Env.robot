*** Variables ***
${ENV}              STG
${BASE_URL}         ${${ENV}_BASE_URL}

# DADOS STG
${STG_BASE_URL}     https://stg-services.labpetz.com.br
${STG_CLIENT_ID}    350876bb-c4fe-45a9-84f3-83bc79ae1fde
&{STG_USER}               cpf=54443067000
...                   password=B12alpha1@
${STG_CUSTOMER_UUID}    53274dac-de19-4158-b036-46dd6398c468
${STG_PROFISSIONAL_ID}  2346
${STG_CLIENTID}         e1c391c4-b7f1-4573-93de-d812242780bd
${STG_SERVICE}          3061

# DADOS DEV
${DEV_BASE_URL}     https://dev-services.labpetz.com.br
${DEV_CLIENT_ID}    14d20d79-de8c-3e22-af15-f6d317b07ebc
&{DEV_USER}               cpf=81180603060
...                   password=B12alpha1@
${DEV_CUSTOMER_UUID}    4d9f2e21-a514-49cc-a623-c1e06b7dc7ff
${DEV_PROFISSIONAL_ID}  3928
${DEV_SERVICE}          3064



