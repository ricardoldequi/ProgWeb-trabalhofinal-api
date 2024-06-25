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
     telefone VARCHAR(16) DEFAULT '00 00000-0000',
     CONSTRAINT PK_fornecedor_id PRIMARY KEY (fornecedor_id)
);

CREATE TABLE PRODUTOS (
     produto_id SERIAL NOT NULL,
     fornecedor_id INT NOT NULL,
     nome VARCHAR(60) NOT NULL UNIQUE,
     descricao VARCHAR(100) NOT NULL UNIQUE,
     quantidade INT NOT NULL,
     preco DECIMAL(10, 2) NOT NULL,
     observacao VARCHAR (200), 
     CONSTRAINT PK_produto_id PRIMARY KEY (produto_id),
     CONSTRAINT FK_fornecedor_id FOREIGN KEY (fornecedor_id) REFERENCES FORNECEDORES(fornecedor_id)
);


-- inserções básicas 

-- Inserções para fornecedores do ramo de produtos para gamers
INSERT INTO FORNECEDORES (nome, email, cnpj, endereco, telefone) VALUES
('GigaGames', 'contato@gigagames.com', '12.345.678/0001-91', 'Av. dos Jogadores, 123, São Paulo, SP', '(11) 12345-6789'),
('TechLoot', 'suporte@techloot.com', '98.765.432/0001-92', 'Rua dos Consoles, 789, Rio de Janeiro, RJ', '(21) 98765-4321'),
('PlayTech', 'atendimento@playtech.com', '56.789.012/0001-93', 'Av. das GPUs, 456, Belo Horizonte, MG', '(31) 56789-0123'),
('EpicGear', 'vendas@epicgear.com', '34.567.890/0001-94', 'Rua dos Headsets, 789, Porto Alegre, RS', '(51) 34567-8901'),
('TechPro', 'contato@techpro.com', '78.901.234/0001-95', 'Av. dos Joysticks, 234, Curitiba, PR', '(41) 89012-3456'),
('GameMaster', 'suporte@gamemaster.com', '23.456.789/0001-96', 'Rua dos Mouses, 890, Brasília, DF', '(61) 23456-7890'),
('GamerXtreme', 'atendimento@gamerxtreme.com', '90.123.456/0001-97', 'Av. dos Keyboards, 567, Salvador, BA', '(71) 90123-4567'),
('TechHub', 'vendas@techhub.com', '45.678.901/0001-98', 'Rua dos Notebooks, 123, Fortaleza, CE', '(85) 67890-1234'),
('GigaGamer', 'contato@gigagamer.com', '67.890.123/0001-99', 'Av. das GPUs, 678, Recife, PE', '(81) 78901-2345'),
('TechSphere', 'suporte@techsphere.com', '12.345.678/0001-00', 'Rua dos Joysticks, 234, Manaus, AM', '(92) 12345-6789'),
('GameZone', 'atendimento@gamezone.com', '98.765.432/0001-01', 'Av. dos Consoles, 890, Belém, PA', '(91) 98765-4321'),
('GamerHive', 'vendas@gamerhive.com', '56.789.012/0001-02', 'Rua dos Mousepads, 456, São Luís, MA', '(98) 56789-0123'),
('TechSpace', 'contato@techspace.com', '34.567.890/0001-03', 'Av. das Telas, 678, Natal, RN', '(84) 34567-8901'),
('GigaUniverse', 'suporte@gigauniverse.com', '78.901.234/0001-04', 'Rua dos Monitores, 123, João Pessoa, PB', '(83) 89012-3456'),
('GamePortal', 'atendimento@gameportal.com', '23.456.789/0001-05', 'Av. dos Joysticks, 234, Teresina, PI', '(86) 23456-7890');

-- Inserções para produtos de produtos para gamers
INSERT INTO PRODUTOS (fornecedor_id, nome, descricao, quantidade, preco, observacao) VALUES
(1, 'Mouse de Batalha', 'Mouse gamer com iluminação RGB personalizável', 100, 99.99, 'Possui 7 botões programáveis'),
(1, 'Teclado de Guerreiro', 'Teclado mecânico para jogos com switches Cherry MX', 150, 149.99, 'Layout ANSI e retroiluminação LED'),
(2, 'Monitor Titan', 'Monitor gamer curvo de 27 polegadas com taxa de atualização de 144Hz', 50, 399.99, 'Resolução Full HD e tempo de resposta de 1ms'),
(2, 'Headset Liberty', 'Headset gamer sem fio com som surround 7.1 e microfone retrátil', 80, 199.99, 'Conexão USB e bateria de longa duração'),
(3, 'Tapete de Combate', 'Mousepad extra grande para movimentos amplos e precisos', 120, 49.99, 'Base de borracha antiderrapante'),
(3, 'Trono Gamer', 'Cadeira gamer ergonômica com estofamento de couro sintético', 70, 299.99, 'Ajuste de altura e inclinação'),
(4, 'Laptop Supremo', 'Notebook gamer com processador Intel Core i7 e placa de vídeo NVIDIA GeForce RTX', 40, 1799.99, 'Tela de 15,6 polegadas e SSD de 512GB'),
(4, 'Fortress Case', 'Gabinete gamer com painel frontal de vidro temperado e iluminação RGB', 60, 129.99, 'Compatível com placas-mãe ATX e micro-ATX'),
(5, 'Titanium GPU', 'Placa de vídeo NVIDIA GeForce RTX 3080 com 10GB de memória GDDR6X', 30, 999.99, 'Arquitetura Ampere e suporte a ray tracing'),
(5, 'Battle Router', 'Roteador Wi-Fi 6 para jogos com tecnologia Tri-Band e QoS avançado', 90, 149.99, 'Velocidade de até 6Gbps'),
(6, 'Gamepad Wireless', 'Controle de jogo sem fio com conexão Bluetooth e bateria recarregável', 110, 39.99, 'Compatível com smartphones e tablets'),
(6, 'HD Cam', 'Webcam de alta definição com microfone embutido e correção automática de luz', 65, 79.99, 'Conexão USB plug-and-play'),
(7, 'Mouse Precision', 'Mouse gamer com sensor óptico de 16000 DPI e peso ajustável', 95, 69.99, 'Design ergonômico e deslizamento suave'),
(7, 'Dance Mat', 'Tapete de dança para jogos de ritmo com conexão USB e superfície antiderrapante', 25, 29.99, 'Compatível com PC e consoles'),
(8, 'Teclado Luminoso', 'Teclado gamer com iluminação LED ajustável e teclas programáveis', 85, 79.99, 'Layout ABNT2 e resistente a respingos'),
(8, 'Colorful Cooler', 'Cooler para gabinete com iluminação RGB e controle de velocidade', 55, 49.99, 'Compatível com sockets Intel e AMD'),
(9, 'Kit Overhaul', 'Kit de upgrade para PC com processador Ryzen 9 e placa-mãe B550', 20, 899.99, 'Inclui cooler Wraith Prism e memória RAM DDR4'),
(9, 'Broadcast Mic', 'Microfone condensador USB para transmissão ao vivo e gravação de áudio', 75, 59.99, 'Braço articulado e filtro pop'),
(10, 'Gaming Console', 'Console de jogos com capacidade de 1TB e suporte a jogos em 4K', 35, 399.99, 'Inclui controle sem fio e assinatura Xbox Game Pass'),
(10, 'PC Steering Wheel', 'Volante de corrida para PC com force feedback e pedais ajustáveis', 45, 199.99, 'Compatível com jogos de corrida populares'),
(11, 'Capture Card', 'Placa de captura de vídeo HDMI para streaming e gravação de gameplay', 105, 129.99, 'Suporte a resolução 4K e passagem HDMI'),
(11, 'Wireless Charger', 'Carregador de controle sem fio para Xbox e PlayStation com indicador LED', 115, 19.99, 'Carrega até dois controles simultaneamente'),
(12, 'Portable Console', 'Console portátil com tela de 7 polegadas e bateria de longa duração', 40, 149.99, 'Compatível com jogos de diversas plataformas'),
(12, 'Mouse Cable Manager', 'Mouse bungee para melhorar o desempenho do mouse e evitar emaranhados de fio', 50, 14.99, 'Base de borracha antiderrapante'),
(13, 'High-Speed HDMI Cable', 'Cabo HDMI de alta velocidade com suporte a resolução 8K e HDR', 80, 24.99, 'Conexões banhadas a ouro e blindagem tripla'),
(13, 'Bluetooth Dongle', 'Adaptador USB Bluetooth 5.0 para conexão sem fio de periféricos e dispositivos', 100, 9.99, 'Plug-and-play e alcance de até 20 metros'),
(14, 'RGB Gaming Kit', 'Kit gamer com teclado, mouse, headset e mousepad com iluminação RGB sincronizada', 65, 129.99, 'Compatível com PC e consoles'),
(14, 'Reclining Gamer Chair', 'Cadeira gamer reclinável com almofadas lombar e cervical e apoio de braço ajustável', 85, 299.99, 'Suporta até 150kg'),
(15, 'External Sound Card', 'Placa de som externa USB com áudio 7.1 surround e controle de volume independente', 70, 39.99, 'Compatível com PC e consoles'),
(15, 'USB Wi-Fi Adapter', 'Adaptador USB Wi-Fi 6 para conexão sem fio de alta velocidade em PC e notebooks', 60, 29.99, 'Velocidade de até 1200Mbps');
