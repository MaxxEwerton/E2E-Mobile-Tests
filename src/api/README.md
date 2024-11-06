# AUTOMAÇÃO SERVIÇOS PETZ - ROBOT FRAMEWORK
## PRÉ-REQUISITOS
Requisitos de software e hardware necessários para executar este projeto de automação

* Python 3.11 ou superior
* Robot Framework 6.1 ou superior
* Vs Code IDE
* Extensions Vs Code
    * Robot Framework Language
    * Python
* pip install robotframework-requests    

## ESTRUTURA DO PROJETO

| Diretório                         | Finalidade                                                                                                 | 
|--------------------------------|------------------------------------------------------------------------------------------------------------|
| Features           | Local onde são descritas as features "Test Cases" em formato BDD                                           |
| Resource             | Local onde estão criados os recursos de configuração e Keywords do projeto                                                           |
| Results             | Local onde são criadas as evidências e relatórios do projeto                                        |
| Enviroments             | Local onde são criadas variaveis de ambiente como Urls e Endpoints                                        |
| Utils|    Local onde são realizadas as chamadas realizadas em vários pontos do projeto                  |


## COMANDO PARA EXECUTAR OS TESTES

Com o prompt de comando acesse a pasta do projeto e execute o comando abaixo para rodar os testes automatizados.

robot -d Results ./src/api/Features/


## COMANDO PARA EXECUTAR OS TESTES INFORMANDO A VARIAVEL DE AMBIENTE

Com o prompt de comando acesse a pasta do projeto e execute o comando abaixo para rodar os testes automatizados com a váriavel ambiente desejada (Caso não seja informada será setada a padrão: DEV).

robot -v ENV:STG -d Results ./src/api/Features/

## COMANDO PARA EXECUÇÃO DE TESTES COM TAGS

Com o prompt de comando acesse a pasta do projeto e execute o comando abaixo para rodar um cenário com a tag específica

Ex.:
robot -d Results -t "Buscar a listagem de todos os posts (GET em todos os posts)" Features/PostsJsonPlaceHolder.robot

## EVIDÊNCIAS
Os arquivos com as evidências ficam localizados na pasta Results do projeto, esta pasta só é criada depois da primeira execução. Lá se encontram os Logs e o report html com os status da execução. Caso o relatório desejado seja o allure, complementar a execução com --listener allure_robotframework.
