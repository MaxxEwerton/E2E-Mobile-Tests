*** Settings ***

Resource            ../Resource/ResourcePets.robot

Suite Setup         Conectar a API Pets

*** Test Cases ***
Consulta especies (GET consultando todas as especies disponiveis pra cadastro)
    Dado que o usuario deseja requisitar todas as especies
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    200
    Então Serão validados os dados de retorno de acordo com o body de retorno pra especies

Consulta especies validando as que possuem suporte para serviços (GET consultando todas as especies validando que os serviços são disponiveis apenas pra cachorro e gato)
    Dado que o usuario deseja requisitar todas as especies
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    200
    Então Serão validados os dados de retorno de acordo com o body validando que cachorro e gato apenas podem realizar serviços

Consulta raças de cachorro (GET consultando todas as raças de cachorro)
    Dado que o usuario deseja requisitar todas as raças de cachorro
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    200
    Então Serão validados os dados de retorno de acordo com o body validando as raças disponíveis para a especie cachorro

Consulta raças de gato (GET consultando todas as raças de gato)
    Dado que o usuario deseja requisitar todas as raças de gato
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    200
    Então Serão validados os dados de retorno de acordo com o body validando as raças disponíveis para a especie gato    

Cadastro pet cachorro com sucesso informando dados obrigatórios (Post Cadastrando pet Cachorro com sucesso)
    Dado que o usuario deseja cadastrar um novo cachorro informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Cadastro pet gato com sucesso informando dados obrigatórios (Post Cadastrando pet Gato com sucesso)
    Dado que o usuario deseja cadastrar um novo Gato informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Cadastro pet peixe com sucesso informando dados obrigatórios (Post Cadastrando pet Peixe com sucesso)
    Dado que o usuario deseja cadastrar um novo Peixe informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Cadastro pet ave com sucesso informando dados obrigatórios (Post Cadastrando pet Ave com sucesso)
    Dado que o usuario deseja cadastrar um novo pet Ave informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Cadastro pet roedor com sucesso informando dados obrigatórios (Post Cadastrando pet Roedor com sucesso)
    Dado que o usuario deseja cadastrar um novo pet Roedor informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Cadastro pet coelho com sucesso informando dados obrigatórios (Post Cadastrando pet Coelho com sucesso)
    Dado que o usuario deseja cadastrar um novo pet Coelho informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados    

Cadastro pet réptil com sucesso informando dados obrigatórios (Post Cadastrando pet Réptil com sucesso)
    Dado que o usuario deseja cadastrar um novo pet Réptil informando os dados obrigatórios
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    201
    Então Serão validados os dados de retorno de acordo com o body validando os dados cadastrados

Cadastro pet sem sucesso informando dados obrigatórios menos o nome (Post Cadastrando pet sem nome )
    Dado que o usuario deseja cadastrar um novo pet informando os dados obrigatórios menos o nome
    Quando obtiver o retorno da requisição de Pets o Status Code deverá ser    400