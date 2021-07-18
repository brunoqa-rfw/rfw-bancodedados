*** Settings ***
Library    DatabaseLibrary
Library    String

*** Keywords ***
Criar Tabela
    Run Keyword And Ignore Error    Inserir Dados Via ARQUIVO No Banco De Dados
    ...    ${EXECDIR}/resources/sql/create_table_accounts.sql

Conferir Se O Usuario Foi Inserido Com Sucesso 
    [Arguments]    ${USER}

    Check If Exists In Database    selectStatement=SELECT username FROM account WHERE username = '${USER}'
    Set Test Variable    ${USER}

Deletar Usuario    
    [Arguments]    ${USUARIO}=${USER}
    Executar Script Via STRING No Banco De Dados    DELETE FROM account WHERE username='${USUARIO}';

Inserir Dados Via ARQUIVO No Banco De Dados
    [Arguments]    ${FILE}
    Execute SQL Script   sqlScriptFileName=${FILE}

Executar Script Via STRING No Banco De Dados
    [Arguments]          ${SCRIPT}
    Execute SQL String   sqlString=${SCRIPT}

Executar Query No Banco De Dados
    [Arguments]         ${QUERY}
    ${RESPONSE_QUERY}   Query   selectStatement=${QUERY}
    [Return]            ${RESPONSE_QUERY}

Resposta Select
    [Arguments]     ${TABELA}

    ${RESPOSTA_SELECT}      Executar query no Banco de dados    SELECT * from ${TABELA}
    Log    ${RESPOSTA_SELECT}

    [Return]    ${RESPOSTA_SELECT}

Selecionar Usuario

    ${RESPOSTA_SELECT}=    Resposta Select    account
    Log    ${RESPOSTA_SELECT}

    ${usuario_random}=    Evaluate    random.choice($RESPOSTA_SELECT)  random

    [Return]   ${usuario_random}