# README

O presente projeto foi desenvolvido como trabalho final para a matéria de Programação Web. Consiste em um CRUD simples de Produtos e Fornecedores.
 As tecnologias utilizadas para o backend foi o Ruby com o framework Rails e o PostgreSQL para banco de dados 

Configuração do projeto:

* Ruby version:  3.2.4 - https://rubyinstaller.org/downloads/
* Rails version: 7.1.3.2
  - para instalar o Rails:
 ```
gem install rails -v 7.1.3.2
 ```

* Database:
  - postgresql:15.2-2 - https://www.postgresql.org/download/
  - creation: view folder produtosefornecedores_api/scripts/create.sql
  - ajustar o arquivo database.yml conforme acesso ao banco

* Instalar as gems do projeto (Lembrar de executar o terminal como Administrador)
 ```
 bundle install
 ```
* Iniciar a API 
```
rails s
```
#quando alterado script do banco, lembrar de dar um dump nos schemas para ajustar com o que se tem salvo
```
rails db:schema:dump #quando alterado script do banco, lembrar de dar um dump nos schemas para ajustar com o que se tem salvo
```