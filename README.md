# README
<h1 align="center"> 🤖 RFW - Conctando Bancos de Dados</h1>

### Descrição do Projeto
<p align="center">É muito comum durante a automação de teste se conectar com um banco de dados. Neste projeto trago a conexão com 2 bancos de dados: Postgres e SQL Server.
Uma das vantagens de se trabalhar com o Robot Framework é que a única coisa que precisamos mudar para se conectar com o banco de dado são os inputs de conexão, simples assim 😉.

Trago aqui esse projeto pequeno mais de um conteúdo rico para auxiliar no dia a dia de um QA automatizador.</p>

## Pré-requisitos:
- 🐍 [Python 3](https://www.python.org/downloads/release/python-391/) (O projeto foi desenvolvido utilizando a versão 3.9.1)  
- 😼 [Git](https://git-scm.com/download/win)
- 🐳 [Docker](https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header)

## Instalando o Python:
Em ambientes Windows, faça o download da do pacote "Windows x86-64 executable installer" e siga as instruções do instalador.

Para falcilitar coloque o diretório de instalação na unidade C:/

### Clonando o Repositório Remoto
Através do terminal navegue até um diretório de sua escolha e execute o comando:
```batchfile
> git clone <"remote-url">
```

## Imagem e configuração Postgres e SQL Server
No terminal acesse o diretório do projeto, em seguida executo o comando:
```batchfile
> docker-compose up -d
```

Será realizada o download das imagens SQL Server, Postgres, PGAdmin 4 e será realizada a configuração das portas de acesso aos bancos de dados.

#### Criando Database Postgres
Acesse o navegador de sua preferência e acesse a página http://localhost:16543.

Aguarde alguns instante até que o serviço esteja de pé, leva cerca de 1min.
 
Realize o login:
- Login: **robot@gmail.com**
- Senha: **PgAdmin2021!**

Em seguida clique com o botão direito sobre o Server > Create > Server...

![create_server](/uploads/1f0680f5fdfbaae2c5a156106f9953bf/create_server.png)

Preencher com o nome **Local**:

![create_server_general](/uploads/248d809e5081b69481c0ecf134a5a15f/create_server_general.png)

Na aba Connection preencher conforme a imagem:
- Host name: **teste-postgres**
- Port: **5432**
- Username: **postgres**
- Senha: **Postgres2021!**

![create-server](/uploads/0669e1ec2733d7fed57403f8a51a5fb9/create-server.png)

#### Criando Database SQL Server

Realize o downlaod do [SQL MANAGEMENT](https://aka.ms/ssmsfullsetup) para se conectar no banco de dados SQL Server.

Semelhante ao Postgres vamos criar a Database do SQL Server:

- Nome do servidor: **127.0.0.1**
- Autenticação: **Autenticação do SQL Server**
- Login: **sa**
- Senha: **MySql2021!**

![sql_login](/uploads/4d71b113a2834850cc593a0387759a8e/sql_login.png)

Criando o Database (Banco de dados): Clique com o botão direito > Novo Banco De Dados

![novo_bd](/uploads/83af411199246d023f324c11601e235d/novo_bd.png)

Preencha o campo:
-  Nome do banco de dados: **robot**

![nome_bd](/uploads/0dd773da700fc42454da1bdf889cfb3a/nome_bd.png)

### Criando ambiente virtual
Execute o comando para realizar a instalação do ambiente virtual:
```batchfile
> pip install virtualenv
```

Informar o diretório do executável do python, no meu caso está instalado na unidade C:/ e coloque o nome do seu ambiente virtual.
```batchfile
> virtualenv --python C:\Python39\python.exe <nome_do_ambiente>
```

Um diretório será criado com o nome escolhido para o ambiente com a seguinte estrutura:
```batchfile
Include/
Lib/
LICENSE.txt
Scripts/
tcl/
```  
Para iniciar o ambiente virtual, rode o script `activate.bat` contido no diretório `Scripts`. Execute o comando:
```batchfile
> <nome_do_ambiente>\Scripts\activate.bat
```

### Instalando as Dependências
Dentro do projeto existe um arquivo `requirements.txt` que contém todas as dependências do projeto.

Instale-as em seu ambiente usando o comando:
```batchfile
> pip install -r requirements.txt
```

## 🚀 Executando os testes
Sempre que for executar os testes é necessário estar no ambiente virtual para que seja executado corretamente, com as devidas dependências.

![cmd](/uploads/77ab2f3809e8becb51850c076fe362ae/cmd.png)

#### Realizar testes com o BD Postgres
```batchfile
> robot -d ./result -v BD:postgres test/TestesBD.robot
```
#### Realizar testes com o BD SQL Server
```batchfile
> robot -d ./result -v BD:sql test/TestesBD.robot
```
