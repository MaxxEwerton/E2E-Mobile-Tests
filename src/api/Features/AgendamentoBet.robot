*** Settings ***

Resource            ../Resource/ResourceUsers.robot
Resource    ../Resource/ResourceAgendamentoBet.robot

Suite Setup         Conectar a API Agendamento

*** Test Cases ***
Agendamento banho simples cachorro (Post Agendamento simples cachorro)
    Dado que um novo usuario cadastrado deseja criar um agendamento simples de banho com as informações necessárias
    Quando obtiver o retorno da requisição de agendamento o Status Code deverá ser    201
    Então Serão validados os dados de retorno do do agendamento de acordo com o body validando os dados cadastrados
    E em seguida realizo a confirmação do agendamento aguardando status    204