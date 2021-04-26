# Desafio Técnico Ateliware
Um sistema responsável por listar os repositórios destaques das 5 principais linguagens de programação WEB.

### Tecnologias utilizadas:

* Roby versão 2.6.6
* Rails versão 5.2.5
* PostgreSQL versão 10.16

#### Pré-requisitos

- Ruby 2.6.x
- Rails 5.2.x
- PostgreSQL 10.x

#### Gems extras utilizadas

- devise
- bootstrap
- jquery-rails
- pg
- font-awesome-sass
- carrierwave
- jquery-ui-rails
- jquery-validation-rails
- rspec-rails (Grupo development)

### Lógica adotada
Este sistema faz uma pesquisa na API do GitHub em busca dos 30 repositórios de maior destaque das 5 principais
linguagens de programação existentes no mercado, que são:
 - Node JS
 - Django
 - Ruby-on-Rails
 - Dotnet
 - PHP

Após a realização da busca, os dados destes repositórios são armazenados no banco de dados. O SGBD escolhido foi
o PostgreSQL.
Na página principal, é mostrada uma lista com os 30 repositórios destaques de cada linguagem. Você pdoerá verificar
os detalhes de cada repositório, de forma individual, clicando no nome do repositório na lista, ou poderá verificar
os detalhes de todos os repositórios de uma determinada linguagem, clicando no botão "Detalhes".
Este sistema possuí uma rotina de login e de cadastro. Ao fazer login, você será redirecionado para a paǵina
inicial (listagem dos repositórios destaques).
Este sistema está hospedado na plataforma de hospedagem de serviços Heroku. Clique [aqui](https://desafio-tecnico-ateliware.herokuapp.com/) para poder acessar este sistema no Heroku.

### Executando o projeto
1. Para executar a api, faça o clone deste repositório;
2. Certifique-se de que as versões do Ruby, Rails e PostgreSQL atendem aos requisitos citados acima;
3. Entre na pasta ```desafio-tecnico-ateliware```;
4. Instale as dependências com o comando ```bundle install```;
5. Faça as migrações para o banco com o comando ```rake db:migrate```;
6. Execute a API com o comando ```rails s``` ou ```rails s -b <ip>```;

### Utilizando Docker

1. Entre na pasta ```desafio-tecnico-ateliware```;

2. Digite o comando ```docker-compose build```;

3. Para rodar o projeto digote o comando ```docker-compose up```;

### Fazendo testes na API

1. Para poder fazer testes na api, utilizando o rspec, basta executar o comando abaixo dentro da pasta ```desafio-tecnico-ateliware```;
```
rspec
```
