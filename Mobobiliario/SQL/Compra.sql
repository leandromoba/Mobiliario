Create database CompraVenda;
 -- DROP DATABASE CompraVenda;
 -- drop table Terreno;
 -- drop table venda;
-- use CompraVenda;

CREATE TABLE Proprietario(
	IdProprie int primary key auto_increment,
	NomeProprie varchar(40) not null,
    Nacionalidade varchar(40) default 'Angola',
    NuBI varchar(40) unique not null,
	Genero enum('M', 'F'),
    Tel1 varchar(15) not null,
    Tel2 varchar(15),
    Email varchar(40),
    DataVendedor  timestamp default current_timestamp
);
 -- ########################### 	Inserir Proprietario	###############################################
Insert into Proprietario (NomeProprie, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email) 
values 
('Alexandre Grande', 'EUA', '5463273277646LA32', 'M' ,'923908203',  '94030233223',  'alexandregarande@gmail'),
('Elon Musk', 'EUA', '12345678LA90', 'M', '923456789', '912345678', 'elonmusk@yahoo.mail'),
('Bill Gates', 'EUA', '22345678LA90', 'M', '923456780', '912345679', 'billgates@email.com'),
('Mark Zuckerberg', 'EUA', '323456LA7890', 'M', '923456781', '912345670', 'markzuck@yahoo.mail'),
('Jack Chan', 'China', 'BI10234567890', 'M', '923456788', '912345677', 'jack.ma@icloud.com'),
('Adolf hitler', 'Alemao', '202345678LA90', 'M', '923456788', '912345677', 'adolf@email.yahoo.mail'),
('Neymar Jr.', 'Brasil', '3834567LA890', 'M', '923456786', '912345675', 'neymarjr@icloud.com'),
('Angelina Jolie', 'EUA', '32345678LA90', 'F', '923456780', '912345679', 'angelinajolie@email.com'),
('Tom Cruise', 'EUA', '35345678LA90', 'M', '923456783', '912345672', 'tom.cruise@email.com'),
('Cristiano Ronaldo', 'Portugal', '33345678LA90', 'M', '923456781', '912345670', 'cristianoronaldo@email.com'),
('Lionel Messi', 'Argentina', '34345678LA90', 'M', '923456782', '912345671', 'lionel.messi@yahoo.mail'),
('Eminem', 'EUA', '65345678LA90', 'M', '923456783', '912345672', 'eminem@email.com'),
('Snoop Dogg', 'EUA', '66345678LA90', 'M', '923456784', '912345673', 'snoop@email.com'),
('Nicki Minaj', 'Trindade e Tobago', '67345678LA90', 'F', '923456785', '912345674', 'nicki@email.com'),
('Cristóvão Colombo', 'Itália', '71345678LA90', 'M', '923456789', '912345678', 'colombo@yahoo.mail'),
('Vasco da Gama', 'Portugal', '73345678LA90', 'M', '923456781', '912345670', 'vasco@email.com'),
('Albert Einstein', 'Alemanha', '81345678LA90', 'M', '923456789', '912345678', 'einstein@icloud.com'),
('Isaac Newton', 'Reino Unido', '82345678LA90', 'M', '923456780', '912345679', 'newton@email.com'),
('Marie Curie', 'Polônia', '83345678LA90', 'F', '923456781', '912345670', 'curie@email.com'),
('Donald Trump', 'EUA', '97345678LA90', 'M', '923456785', '912345674', 'trump@email.com');

-- ######################################  Formatando data 	#################################
Insert into Proprietario (NomeProprie, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email, DataVendedor) 
values
('Joe Biden', 'EUA', '98345678LA90', 'M', '923456786', '912345675', 'biden@yahoo.mail', '2018-10-18 10:06:54'),
('Nelson Mandela', 'África do Sul', '99345678LA90', 'M', '923456787', '912345676', 'mandela@icloud.com', '2019-06-28 18:58:34'),
('Lula da Silva', 'Brasil', '100345678LA90', 'M', '923456788', '912345677', 'lula@gmail.com', '2015-12-28 08:06:54'),
('João Lourenço', 'Angola', '25356262634LA75', 'M', '932233452', '987364554', 'joao@icluod.com', '2014-11-30 08:06:54');
-- ####################################		Fim do comando		#############################


CREATE TABLE Terreno(
	IdTerreno int primary key auto_increment,
	Tamanho varchar(40) not null,
    Preco decimal(10,2) not null,
    Descricao varchar(40),
	DataTerreno  timestamp default current_timestamp,
    IdProprie int not null,
	foreign key(IdProprie) references Proprietario(IdProprie)
);
  -- #########################	 Inserir valor  na tabela Terreno 	#########################
Insert into Terreno(Tamanho, Preco, Descricao,IdProprie)
Values
-- ('20mˆ2', '5000000.00', 'ainda nao esta construida', '1');
('20m2', 5000000.00, 'Ainda não está construída', 1),
('35m2', 7500000.00, 'Ja contruido com sucesso', 2),
('50m2', 12000000.00, 'O terreno ja foi constrida uma boa parte', 3),
('15m2', 3000000.00, 'Ainda nao foi contruda ', 4),
('10m2', 25000000.00, 'Ainda nao foi contruda', 5),
('25m2', 6000000.00, 'Ainda nao foi contruda', 6),
('40m2', 8500000.00, 'Ainda nao foi contruda', 7),
('10m2', 2000000.00, 'O terreno ja foi constrida uma boa parte', 8),
('75m2', 19000000.00, 'Ainda nao foi contruda', 9),
('40m2', 21000000.00, 'Ainda nao foi contruda', 10),
('60m2', 15000000.00, 'Ja contruido com sucesso', 11),
('30m2', 7000000.00, 'Ja contruido com sucesso', 12),
('80m2', 20000000.00, 'O terreno ja foi constrida uma boa parte', 13),
('45m2', 9500000.00, 'O terreno ja foi constrida uma boa parte', 14),
('120m2', 30000000.00, 'O terreno ja foi constrida uma boa parte', 15),
('55m2', 13000000.00, 'Ja contruido com sucesso', 16),
('65m2', 16000000.00, 'Ja contruido com sucesso', 17),
('85m2', 22000000.00, 'Ainda nao foi contruda', 18),
('95m2', 24000000.00, 'Ainda nao foi contruda', 19),
('70m2', 17000000.00, 'Ainda nao foi contruda', 20);
Insert into Terreno(Tamanho, Preco, Descricao,IdProprie, DataTerreno)
Values
-- ########## formatando data  ##############################
('50m2', 12000000.00, 'Ja contruido com sucesso', 21, '2018-10-18 10:06:54'),
('25m2', 6000000.00, 'Ja contruido com sucesso', 22, '2019-06-28 18:58:34'),
('35m2', 8000000.00, 'Ja contruido com sucesso', 23, '2015-12-28 08:06:54'),
('100m2', 26000000.00, 'Ja contruido com sucesso', 24, '2014-11-30 08:06:54');
-- ##########################		fim do comando #################################### 

--
CREATE TABLE Endereco(
	IdEndereco int primary key auto_increment,
    Pais varchar(40) default 'Angola',
    Provincia varchar(40),
    Municipio varchar(40),
    Bairro varchar(40),
    Descri varchar(40),
    IdTerreno int not null,
    foreign key(IdTerreno) references Terreno(IdTerreno)
);


-- ################# inseeir dadso na tabela  endereco ##############################
insert into Endereco(Pais, Provincia, Municipio, Bairro, Descri, IdTerreno)
values
 ('Angola', 'Luanda',  ' Cacuaco',  ' Nova urbanizacao',  ' Ao lado da escola 4027' , 1),
('Angola', 'Luanda', 'Cacuaco', 'Nova urbanizacao', 'Ao lado da escola 4027', 1),
('Angola', 'Luanda', 'Viana', 'Zango', 'Perto do mercado', 2),
('Angola', 'Benguela', 'Lobito', 'Restinga', 'Próximo à praia', 3),
('Angola', 'Benguela', 'Catumbela', 'Zona industrial', 'Ao lado do posto de gasolina', 4),
('Angola', 'Huambo', 'Caála', 'São João', 'Próximo à praça central', 5),
('Angola', 'Huambo', 'Bailundo', 'Santa Ana', 'Atrás da escola primária', 6),
('Angola', 'Huila', 'Lubango', 'Cristo Rei', 'Perto do estádio', 7),
('Angola', 'Huila', 'Matala', 'Kimbambi', 'Ao lado do hospital', 8),
('Angola', 'Malanje', 'Cangandala', 'São José', 'Próximo ao mercado municipal', 9),
('Angola', 'Malanje', 'Kiwaba Nzoji', 'Centro', 'Ao lado da igreja matriz', 10),
('Angola', 'Namibe', 'Moçâmedes', 'Praia Amélia', 'Perto do porto', 11),
('Angola', 'Namibe', 'Tômbwa', 'Nova centralidade', 'Próximo à escola secundária', 12),
('Angola', 'Zaire', 'Mbanza Congo', 'Zona Histórica', 'Ao lado do museu', 13),
('Angola', 'Zaire', 'Soyo', 'Kintambi', 'Próximo ao aeroporto', 14),
('Angola', 'Kwanza Norte', 'Ndalatando', 'São Paulo', 'Atrás do mercado central', 15),
('Angola', 'Kwanza Norte', 'Lucala', 'Centro', 'Ao lado do banco', 16),
('Angola', 'Uíge', 'Uíge', 'Bairro Popular', 'Próximo ao hospital geral', 17),
('Angola', 'Uíge', 'Negage', 'Bairro Novo', 'Ao lado da praça pública', 18),
('Angola', 'Bengo', 'Caxito', 'Bairro Azul', 'Próximo à estação de comboios', 19),
('Angola', 'Bengo', 'Ambriz', 'Zona Norte', 'Perto do cais', 20),
('Angola', 'Cunene', 'Ondjiva', 'Bairro 11 de Novembro', 'Atrás do supermercado', 21),
('Angola', 'Cunene', 'Cahama', 'Zona Leste', 'Próximo à escola técnica', 22),
('Angola', 'Lunda Sul', 'Saurimo', 'Bairro Sassamba', 'Ao lado da fábrica', 23),
('Angola', 'Lunda Sul', 'Cacolo', 'Nova Esperança', 'Próximo ao centro comunitário', 24);
-- #############################################################################



CREATE TABLE Cliente(
	IdCliente int primary key auto_increment,
	NomeCliente varchar(40) not null,
    Nacionalidade varchar(40) default 'Angola',
    NuBI varchar(40) unique not null,
	Genero enum('M', 'F'),
    Tel1 varchar(15) not null,
    Tel2 varchar(15),
    Email varchar(40),
    DataVendedor  timestamp default current_timestamp
);
-- #####################################		Inserir tabela cliente		##################################
Insert into Cliente (NomeCliente, Nacionalidade, NuBI, Genero, Tel1, Tel2, Email) 
values 
 ('Leandro Moba', 'Angolano',  '020019935LA159','M', '931144655', '9334436650', 'leandromoba@gmail.com'),
('Barack Obama', 'EUA', '11345678LA90', 'M', '923456781', '912345670', 'obama@email.com'),
('Michael Jackson', 'EUA', '13345678LA90', 'M', '923456783', '912345672', 'mj@icloud.com'),
('Pelé', 'Brasil', '18345678LA90', 'M', '923456788', '912345677', 'pele@soccer.com'),
('Zinedine Zidane', 'França', '19345678LA90', 'M', '923456789', '912345678', 'zidane@email.com'),
('Leonardo da Vinci', 'Itália', '21345678LA90', 'M', '923456781', '912345670', 'davinci@email.com'),
('Napoleão Bonaparte', 'França', '27345678LA90', 'M', '923456787', '912345676', 'napoleao@gmail.com'),
('William Shakespeare', 'Reino Unido', '20345678LA90', 'M', '923456780', '912345679', 'shakespeare@gmail.com'),
('Galileo Galilei', 'Itália', '35345678LA90', 'M', '923456785', '912345674', 'galileo@science.com'),
('Martin Luther King Jr.', 'EUA', '39345678LA90', 'M', '923456789', '912345678', 'mlk@activism.com');
-- 	#####################################	Fim do Comando  ######################################
CREATE TABLE Venda(
	IdVenda int primary key auto_increment,
    ValorPago decimal(10,2),
    Intereces varchar(60),
    Descricao varchar(60),
    DatVenda timestamp default current_timestamp,
    IdProprie int,
    IdTerreno int,
    IdCliente int,
	foreign key(IdProprie) references Proprietario(IdProprie),
    foreign key(IdTerreno) references Terreno(IdTerreno),
	foreign key(IdCliente) references Cliente(IdCliente)
);

INSERT INTO Venda(ValorPago, Intereces, Descricao, IdProprie, IdTerreno, IdCliente)
VALUES
 ('60000000.00', 'Pretendo construir uma farmacia', 'A venda foi passiva e com a colaboracao dos dois sujeitos', '1', '1', '1'),
(7000000.00, 'Pretende construir uma clinica', 'Vendida com sucesso', 2, 2, 2),
(80000000.00, ' pretende construi uma escola', ' Venda bem sucedida',3, 3, 2),
(2800000.00, 'Pretende construir uma farmacia', 'Vendida com sucesso', 4,4,1),
(2000000.00, 'Pretende construir uma casa de renda', ' venda bem sucedida', 5, 5,7),
(1800000.00, 'Pretende costruir uma farmacia', 'Vendidada com sucesso', 8, 7, 9);

-- ####################		tabela venda
SELECT*FROM Venda;

-- ##################################

-- ##### Mostra o nome data cliente e proprietario#####################
SELECT 
    Proprietario.NomeProprie AS DonoTerreno,
    Terreno.IdTerreno,
    Terreno.Preco,
    Cliente.NomeCliente,
    Venda.DatVenda,
    Venda.ValorPago
FROM Venda
JOIN Cliente ON Venda.IdCliente = Cliente.IdCliente
JOIN Terreno ON Venda.IdTerreno = Terreno.IdTerreno
JOIN Proprietario ON Venda.IdProprie = Proprietario.IdProprie;
-- ################# Fim ################

-- ###### mostra o endereco tambem ######################
SELECT 
    Proprietario.NomeProprie AS DonoTerreno, 
    Terreno.IdTerreno, 
    Terreno.Preco, 
    Cliente.NomeCliente, 
    Venda.DatVenda, 
    Venda.ValorPago, 
    Endereco.Pais, 
    Endereco.Provincia, 
    Endereco.Municipio, 
    Endereco.Bairro, 
    Endereco.Descri AS EnderecoTerreno
FROM Venda
JOIN Cliente ON Venda.IdCliente = Cliente.IdCliente
JOIN Terreno ON Venda.IdTerreno = Terreno.IdTerreno
JOIN Proprietario ON Venda.IdProprie = Proprietario.IdProprie
JOIN Endereco ON Terreno.IdTerreno = Endereco.IdTerreno;
-- ################ fim ########################################


-- ######################		data da ultma insecao
SELECT DataTerreno
FROM Terreno
WHERE DataTerreno < '2020-01-01'
ORDER BY DataTerreno DESC
LIMIT 1;
-- ###########################


-- ################# terrenos nao vendidas #########################
SELECT Terreno.IdTerreno, Terreno.Descricao, Terreno.Preco
FROM Terreno
LEFT JOIN Venda ON Terreno.IdTerreno = Venda.IdTerreno
WHERE Venda.IdTerreno IS NULL;
-- #####################################################


-- ################  Pequisa ##############################
SELECT IdCliente, NomeCliente, Email
FROM Cliente
WHERE NomeCliente LIKE '%Moba%';
-- ###########################################################
