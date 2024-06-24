# Projeto de CRUD de Produtos e Fornecedores

Este projeto foi desenvolvido como trabalho final para a disciplina de Programação Web. Consiste em um CRUD simples de Produtos e Fornecedores, utilizando Ruby on Rails como framework para o backend e PostgreSQL como banco de dados.

## Configuração do projeto:
### Ruby e Rails
Certifique-se de ter a versão correta do Ruby e do Rails instalada em sua máquina:
* Ruby version:  3.2.4 - [Download](https://rubyinstaller.org/downloads/)
* Rails version: 7.1.3.2

Para instalar o Rails, execute o seguinte comando no terminal:

```
gem install rails -v 7.1.3.2
```

### Banco de Dados PostgreSQL
Certifique-se de ter o PostgreSQL instalado em sua máquina. A versão utilizada neste projeto é a 15.2-2. Você pode baixá-la em [postgresql.org](https://www.postgresql.org/download/).

Para criar o banco de dados, execute o script localizado na pasta produtosefornecedores_api/scripts/create.sql. Certifique-se também de ajustar o arquivo database.yml conforme as configurações de acesso ao banco.

Deixe o banco de dados aberto enquanto rodar a aplicação.

### Instalação de Dependências
Após configurar o ambiente, instale as gems do projeto. Execute o seguinte comando no terminal, com permissões de administrador:

```
bundle install
```

### Iniciar a API
Para iniciar a API, execute o seguinte comando no terminal:

```
rails s
```

### Atualização do Schema do Banco de Dados
Sempre que houver alterações no script do banco de dados, lembre-se de dar um dump nos schemas para ajustar com o que está salvo. Execute o seguinte comando:

```
rails db:schema:dump
```
