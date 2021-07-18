*** Settings ***
Library    DatabaseLibrary
Library    Dialogs

Resource    kwd.resource

*** Variables ***
${BD}    postgres

*** Keywords ***
Conetar No Banco De Dados
    IF    "${BD}" == "postgres"
        Connect To Database
        ...    dbapiModuleName=psycopg2    dbName=postgres     dbUsername=postgres
        ...    dbPassword=Postgres2021!    dbHost=localhost    dbPort=5432

    ELSE IF    "${BD}" == "sql"
        Connect To Database
        ...    dbapiModuleName=pymssql      dbName=robot        dbUsername=sa
        ...    dbPassword=MySql2021!        dbHost=localhost    dbPort=1433
    END

Desconectar do Banco de Dados
    Disconnect From Database

Limpar Tabela Account
    ${REGISTROS}    Row Count    selectStatement=SELECT * FROM account
    Run Keyword If  ${REGISTROS} > 0    Delete All Rows From Table    account

    Executar script via STRING no Banco de Dados     DROP table account
