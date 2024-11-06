*** Settings ***

Resource            ../Resource/ResourceUsers.robot

Suite Setup         Conectar a API Usuarios

*** Test Cases ***
Cadastro usuário com sucesso informando dados obrigatórios (Post Cadastrando usuário com sucesso)
    Dado que um novo usuario deseja se cadastrar informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Usuarios o Status Code deverá ser    200
    Então Serão validados os dados de retorno do novo usuário de acordo com o body validando os dados cadastrados