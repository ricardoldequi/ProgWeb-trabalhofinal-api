-- Database: produtosefornecedores

-- DROP DATABASE IF EXISTS produtosefornecedores;
/*
CREATE DATABASE produtosefornecedores
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	*/
	
	
		CREATE TABLE FORNECEDORES (
		 fornecedor_id SERIAL NOT NULL,
   		 nome VARCHAR(60) NOT NULL UNIQUE,
    	 email VARCHAR(50) NOT NULL UNIQUE,
    	 cnpj VARCHAR(20) NOT NULL UNIQUE,
		 endereco VARCHAR (100) NOT NULL,
         telefone VARCHAR(15) DEFAULT '00 00000-0000',
				 CONSTRAINT PK_fornecedor_id PRIMARY KEY (fornecedor_id)

		);
		
		CREATE TABLE PRODUTOS (
		 produto_id SERIAL NOT NULL,
		 fornecedor_id INT NOT NULL,
   		 nome VARCHAR(60) NOT NULL UNIQUE,
    	 descricao VARCHAR(100) NOT NULL UNIQUE,
    	 quantidade INT NOT NULL,
		 preco MONEY NOT NULL,
		 observacao VARCHAR (200), 
			    CONSTRAINT PK_produto_id PRIMARY KEY (produto_id),
			         CONSTRAINT FK_fornecedor_id FOREIGN KEY (fornecedor_id) REFERENCES FORNECEDORES(fornecedor_id)


		
		);



-- inserções basicas 

INSERT INTO FORNECEDORES (nome, email, cnpj, endereco, telefone) VALUES
('Raca Negra', 'florzinhadosilvio@sbt.com', '12.345.678/0001-90', 'Rua Pedro ma oe, 123, São Paulo, SP', '11 12345-6789'),
('Octopus LTDA', 'olokopeter@fausto.com', '98.765.432/0001-10', 'Brooklin, 1993, New York , NY', '21 98765-4321'),
('Dako', 'oofogao@brasileiro.com', '56.789.012/0001-34', 'Rua Cavaliere, 789, Belo Horizonte, MG', '31 56789-0123');


INSERT INTO PRODUTOS (fornecedor_id, nome, descricao, quantidade, preco, observacao) VALUES
(1, 'Doce Paixão', 'Porque seu corpo sedutor passou a ser o meu costume', 50, 10.00, 'Onde viajo toda noite pra outra dimensão'),
(1, 'Doce Paixão 2', 'Uôh-uôh-uôh, ôuh', 100, 20.00, 'Uh, uôh-uôh'),
(2, 'Fogao 5 bocas', 'fogao de acendimento automatico', 150, 30.00, 'Porque Dako é excelente');