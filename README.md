# Cinepiece
### Desafio para vaga de BackEnd - Foco em Ruby On Rails:


#### Descrição:
Cinepiece é uma plataforma online para aficionados por filmes que desejam explorar, avaliar e compartilhar suas experiências cinematográficas.


## Pre-requisitos (Versão Windows 10+)
- Ruby (versão 3.1.4)
- sqlite3
- Yarn
- Node.js 
- [Redis (6.2+)](https://www.alura.com.br/artigos/redis-instalacao-primeiros-comandos)


## Instalação (Versão Windows 10+)
1. Clone o repositório:
```ruby
git clone https://github.com/junior-sampaio/cinepiece.git
```

2. Instale as dependências
```ruby
bundle install
```

3. Execute as migrações do banco de dados
```ruby
rails db:migrate
rails db:seed
bundle exec rails db:migrate
bundle exec rails db:migrate RAILS_ENV=test
```


## Iniciando os Servidores

Antes de começar a usar a aplicação, é necessário iniciar o Redis, Sidekiq e a aplicação Rails. Siga as instruções abaixo para cada serviço:

### Iniciar Redis

1. Abra um prompt de comando como administrador.
2. Execute o comando `wsl` para acessar o subsistema Windows Subsystem for Linux (WSL).
3. Em seguida, inicie o servidor Redis com o comando `redis-server`.

### Iniciar Sidekiq
1. Abra um prompt de comando como administrador na pasta do projeto.
2. Execute o comando `bundle exec sidekiq` para iniciar o Sidekiq.

### Iniciar Aplicação Rails
1. Abra um prompt de comando como administrador na pasta do projeto.
2. Execute o comando `rails s` para iniciar a aplicação Rails.

#### Acesso a Aplicação
Link Local da Aplicação: [Clique aqui](http://127.0.0.1:3000)
- Usuário: cine@admin
- Senha: password


## Testes Automatizados
Para garantir o funcionamento correto das funcionalidades de cadastro de filmes e importação de filmes CSV, foram desenvolvidos testes automatizados utilizando a estrutura RSpec.

### Cadastro de Filmes
Os testes para o cadastro de filmes verificam se é possível adicionar um novo filme com sucesso no banco de dados.
Todos os testes relacionados ao cadastro de filmes foram executados com sucesso, garantindo que os filmes podem ser cadastrados sem problemas.

### Importação de Filmes CSV
Os testes para a importação de filmes CSV verificam se é possível importar corretamente os filmes de um arquivo CSV para o banco de dados.
Todos os testes relacionados à importação de filmes CSV foram executados com sucesso, garantindo que os filmes sejam importados corretamente, incluindo a validação das informações e a criação de registros no banco de dados.


### Como Executar os Testes
Para executar os testes automatizados, siga os passos abaixo:

1. Clone o repositório para o seu ambiente local.
2. Certifique-se de ter todas as dependências instaladas.
3. Sem a aplicação estar iniciada, execute o comando `bundle exec rspec` para executar todos os testes.


## Visão Geral
Com uma vasta biblioteca de filmes, os usuários podem descobrir novos títulos, ver avaliações e dar suas próprias notas, individualmente ou em grupo. Apenas os administradores têm permissão para criar contas de usuário e importar listas de filmes no formato CSV. Com uma interface intuitiva e recursos robustos, cinepiece simplifica a busca e a avaliação dos melhores filmes para assistir.


## Contato
Se você tiver alguma dúvida ou sugestão, entre em contato através do email: gilsonsampaiojr@gmail.com 


## Licença
Este projeto foi criado pela Oxeanbits e aprimorado por Júnior Sampaio no desafio para vaga de Desenvolvedor Back-end.
