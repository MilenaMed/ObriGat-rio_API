# Obrigatório (Back-end)

Este projeto é o back-end de um sistema de cadastro e gerenciamento de perfis para ongs que oferecem trabalho de gatos de apoio. A aplicação foi desenvolvida como parte do Desafio Técnico e utiliza tecnologias como Node.js, Express, Joi, Bcrypt, e PostgreSQL.

## Demo
https://api-obrigatorio.onrender.com

## Funcionalidades

O projeto oferece endpoints para:

- Cadastro de ongs.
- Autenticação de usuários.
- Cadastro e gerenciamento de pets de apoio.
- Consulta de ajudantes disponíveis.

## Entidades

*Ong:*

json
{
  "id": 1,
  "ongName": "Nome da ong",
  "email": "usuario@email.com",
  "password": "senha",
  "city": "cidade",
  "contact": "(99) 99999-9999",
  "createdAt": "2023-12-01T12:00:00.000Z",
}

*Gato*

json
{
  "id": 1,
  "catName": "Nome do Pet",
  "description": "Descrição do Pet",
  "photo": "https://example.com/pet.jpg",
  "ongId": 1,
  "available": true,
  "forAdoption": true,
  "ongContact": "(99) 99999-9999",
}

*Sessão*

json
{
  "id": 1,
  "token": 11111s1a7daddeaasdda44sd48aw,
  "ongId": 1,
}

## Rotas

*A API oferece os seguintes endpoints:*

- POST /signup: Cadastra uma nova ong.

- POST /signin: Autentica um usuário.

- POST /addService: Adiciona novo gato de apoio.

- GET /home: Obtém todos os animais disponíveis.

- GET /myCats: Obtém os gatos cadastrados pelo usuário autenticado.

- GET /myCats/:id: Obtém informações detalhadas sobre um gato específico e edita disponibilidade do gato escolhido.


## Tecnologias utilizadas

*Para esse projeto, foram utilizadas:*

- Node.js (versão 18.17.0)
- Express
- PostgreSQL
- Bcrypt
- Joi

## Como Rodar em Desenvolvimento

1. Clone o repositório.

2. Instale as dependências com o comando: npm install.

3. Crie o arquivo .env com base no .env.example e configure as variáveis necessárias.

4. Execute o comando para criar o banco de dados e as tabelas necessárias: npx sequelize db:migrate.

5. Execute o comando para rodar o projeto em desenvolvimento: npm start.

6. A API estará disponível em http://localhost:5000.

## Testes Manuais

Testes manuais podem ser feitos através de ferramentas como Thunder Client.
