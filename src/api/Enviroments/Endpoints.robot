*** Variables ***
${POSTS}                posts/
${TOKEN_SENSIDIA}       /oauth/access-token
${BANHO_TOSA}           /banho-tosa
${TOKEN_BeT}            ${BANHO_TOSA}/v1/auth/token
${CUSTOMERS_V2}         ${BANHO_TOSA}/v2/customers/
${CUSTOMERS_V3}         ${BANHO_TOSA}/v3/customers/
${PETS}                 /pets
${STORES}               ${BANHO_TOSA}/v1/stores
${FAVORITE}             /favorite
${ASM_TOKEN}            /asm/v1/auth/token
${PET}                  /pet/v2
${ESPECIES}             ${PET}/species
${RACAS}                /breeds
${PET_V1}               /pet/v1
${CDM_V2}               /cdm/v2/customers/PERSON
${SSM}                  /ssm-scheduling/v1/stores
${SCHEDULING}           ${BANHO_TOSA}/v1/schedulings
${CUSTOMERS_DOCUMENT}   ${PET}/customers/document