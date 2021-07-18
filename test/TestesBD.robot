*** Settings ***
Documentation   Projeto de conexão com Banco de Dados
...    Postgres
...    SQL

Resource    ../resources/conexaoBD.resource
Resource    ../resources/kwd.resource

Test Setup    Run Keywords
...    Conetar No Banco De Dados
...    Criar Tabela

Test Teardown    Run Keywords
...    Limpar Tabela Account
...    Desconectar do Banco de Dados

*** Test Cases ***
Relaiza A Execucao De Scripts SQL Via Arquivos
    [Tags]    TEST01    scripts sql via Arquivos
    [Teardown]    Deletar Usuario

    Inserir Dados Via ARQUIVO No Banco De Dados    ${EXECDIR}/resources/sql/insert_into_account.sql
    Conferir se o usuario foi inserido com sucesso    Emilly Sebastiana Monteiro
    
Executar Scripts SQL Via STRING
    [Tags]    TEST02    scripts sql via string
    [Teardown]    Deletar Usuario

    Executar script via STRING no Banco de Dados     INSERT INTO account (username, password, email) VALUES ('Luiz Almeida', 'robot123', 'robot3@robot.com')
    Conferir se o usuario foi inserido com sucesso    Luiz Almeida

Select Um Nome Randomico
    [Tags]    TEST03    selecionar usuario random
    
    Inserir Dados Via ARQUIVO No Banco De Dados    ${EXECDIR}/resources/sql/insert_mult_account.sql
    ${usuario_selecionado}=    Selecionar Usuario
    
    Log    ${usuario_selecionado[0]}
