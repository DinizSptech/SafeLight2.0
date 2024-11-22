CREATE DATABASE Safelight;

USE Safelight;

CREATE TABLE empresa(
idEmpresa int primary key auto_increment,
nome varchar(90),
CNPJ char (14),
codigoAcesso char(6) UNIQUE
);

INSERT INTO empresa(nome,CNPJ, codigoAcesso) VALUES
('Coca-cola','02219482000109', 'ABC123'),
('Pepsi','37555384000119'),
('Safra','27570297000187'),
('Itau','84391627000100'),
('Bradesco','43614289000141'),
('Google','43614289000141');

CREATE TABLE funcionario(
idFuncionario int auto_increment,
fkEmpresa int,
constraint pkComposta primary key (idFuncionario, fkEmpresa),
constraint fkEmpresaFunc foreign key (fkEmpresa) references empresa(idEmpresa),
nome varchar(45),
cpf char(11),
celular char(11),
email varchar(255),
senha varchar(255),
cargo varchar(70)
);

SELECT * FROM empresa;

INSERT INTO funcionario (fkEmpresa, nome, cpf, celular, email, senha, cargo) VALUES
(1, 'João Silva', '89190680030', '11934164723', 'joao.silva@email.com', 'Urubu10@', 'Supervisor'),
(1, 'Maria Oliveira', '57875337046', '11921345642', 'maria.oliveira@email.com', 'B@tatinha123', 'Estagiario'),
(2, 'Carlos Pereira', '31309693064', '21921145654', 'carlos.pereira@email.com', 'M@ndioca456', 'Supervisor'),
(2, 'Ana Santos', '95660572022', '21912345186', 'ana.santos@email.com', 'Tubercul#789', 'Gerente'),
(3, 'Fernanda Costa', '58725501038', '31921356758', 'fernanda.costa@email.com', 'Ga!vota99', 'Estagiario'),
(3, 'Ricardo Lima', '02983657078', '31921784920', 'ricardo.lima@email.com', 'M!kewaz4usky', 'Gerente'),
(4, 'Juliana Almeida', '10093639058', '41927184561', 'juliana.almeida@email.com', '$Ullivan888', 'Analista'),
(4, 'Paulo Sousa', '68231042016', '41979261734', 'paulo.sousa@email.com', 'C@britopunk999', 'Supervisor'),
(5, 'Tatiane Rocha', '11517377048', '51991923718', 'tatiane.rocha@email.com', 'R0b3rt0Carl0$Ess3C4r4S0u3u', 'Gerente'),
(5, 'Marcos Ferreira', '59017622075', '51992783510', 'marcos.ferreira@email.com', 'Ca$ADeFerreiroEspetoDePau','Supervisor'),
(6, 'Bruna Martins', '38671737020', '61956718953', 'bruna.martins@email.com', '2345m#ia78', 'Estagiario'),
(6, 'Eduardo Nunes', '92300983028', '61921834895', 'eduardo.nunes@email.com', '1JtTT$Jj8iuGyyf', 'Estagiario');

create table endereco(
idEndereco int primary key auto_increment,
logradouro varchar(45),
numero char(5),
bairro varchar(45),
cidade varchar(45),
estado char(2),
complemento varchar(45),
fkEmpresa int,
constraint fkEnderecoEmpresa foreign key (fkEmpresa)
references empresa(idEmpresa)
);

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, complemento, fkEmpresa) VALUES 
('Rua dos Alfeneiros', '101', 'Centro', 'São Paulo', 'SP', 'Apto 1', 1),
('Avenida das Nações', '202', 'Vila Nova', 'São Paulo', 'SP', 'Apto 2', 1),
('Praça dos Bandeirantes', '303', 'Jardim Paulista', 'São Paulo', 'SP', 'Apto 3', 1),
('Rua da Paz', '404', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Casa', 2),
('Avenida Atlântica', '505', 'Ipanema', 'Rio de Janeiro', 'RJ', 'Casa', 2),
('Rua 7 de Março', '873', 'Zona Sul', 'Belo Horizonte', 'MG', 'Loja', 3),
('Rua Doutor Engenheiro Guilherme', '43', 'Centro', 'Curitiba', 'PR', 'Sala 2', 4),
('Rua Senhor dos Passos', '654', 'Norte', 'Porto Alegre', 'RS', 'Cobertura', 5),
('Rua Albuquerque', '987', 'Sul', 'Brasília', 'DF', 'Apto 2', 6);

CREATE TABLE sensor(
idSensor int primary key auto_increment,
fkEndereco int,
constraint fkEnderecoSensor foreign key (fkEndereco) references endereco(idEndereco),
andar char(3),
local varchar(30)
);

INSERT INTO sensor (fkEndereco, andar, local) VALUES 
(1, '1', 'Recepção'),
(1, 'SS', 'Depósito'),
(2, '1', 'Recepção'),
(2, 'SS', 'Depósito'),
(3, '1', 'Recepção'),
(3, 'SS', 'Depósito'),
(4, '2', 'Sala de reunião pequena'),
(4, '1', 'Escritório 1'),
(5, '2', 'Sala de reunião pequena'),
(5, '1', 'Escritório 1'),
(6, '1', 'Sala de assistencia técnica'),
(6, '2', 'Sala de Reunião média'),
(7, '5', 'Sala Supervisor'),
(7, '4', 'Sala de reunião grande'),
(8, '5', 'Sala supervisor back-end'),
(8, '5', 'Sala supervisor BD'),
(9, '6', 'Servidores'),
(9, '7', 'Sala CEO'),
(1, '2', 'Sala descanso'),
(4, '3', 'Escritório 2'),
(6, '3', 'Arquivos'),
(7, '2', 'Escritório 3'),
(8, '6', 'Administrativo'),
(9, '5', 'Financeiro');


CREATE TABLE dados(
idDado int auto_increment,
fkSensor int,
constraint pkSensorDados primary key (idDado, fkSensor),
constraint fkSensorDados foreign key (fkSensor) references sensor(idSensor),
luminosidade int,
momento datetime
);

INSERT INTO dados (fkSensor, luminosidade, momento) VALUES 
(1, 850, '2024-10-21 08:00:00'),
(2, 720, '2024-10-21 09:15:00'),
(3, 900, '2024-10-21 10:30:00'),
(4, 750, '2024-10-21 11:45:00'),
(5, 600, '2024-10-21 12:00:00'),
(6, 830, '2024-10-21 13:30:00'),
(7, 780, '2024-10-21 14:00:00'),
(8, 810, '2024-10-21 14:15:00'),
(9, 670, '2024-10-21 14:30:00'),
(10, 850, '2024-10-21 14:45:00'),
(11, 900, '2024-10-21 15:00:00'),
(12, 720, '2024-10-21 15:15:00'),
(13, 790, '2024-10-21 15:30:00'),
(14, 740, '2024-10-21 15:45:00'),
(15, 880, '2024-10-21 16:00:00'),
(16, 610, '2024-10-21 16:15:00'),
(17, 730, '2024-10-21 16:30:00'),
(18, 820, '2024-10-21 16:45:00');


#TOPICO A ABORDAR
SELECT  concat(end.logradouro, ' ', end.numero) as endereço,
	e.nome as Empresa,
	f.nome as Funcionário
	FROM endereco as end
	JOIN empresa as e
	ON end.fkEMpresa = e.idEmpresa
	JOIN funcionario as f
	ON f.fkEmpresa = e.idEmpresa;


SELECT * FROM EMPRESA;

SELECT e.nome as Empresa,
  CONCAT(end.logradouro, ' ', end.numero) AS endereço,
  COUNT(s.idSensor) AS sensores,
	GROUP_CONCAT(s.andar) as Andares
	FROM endereco AS end
	JOIN  sensor AS s 
	ON s.fkEndereco = end.idEndereco
	JOIN empresa as e
	ON end.fkEmpresa = e.idEmpresa
	GROUP BY e.nome, end.logradouro, end.numero
	having e.nome = 'Coca-cola';

# antigo select's downside;
SELECT e.nome as Empresa,
concat(end.logradouro, ' ', end.numero) as endereço,
f.nome as "Nome funcionário",
f.email as "Login do usuário",
f.senha as "Senha do usuário",
f.cargo as Cargo
FROM empresa as e
JOIN endereco as end ON idEmpresa = end.fkEmpresa
JOIN funcionario as f ON idEmpresa = f.fkEmpresa
WHERE e.idEmpresa = 1;

SELECT e.nome as Empresa,
concat("Andar: ", s.andar, ", Local: ", s.local, ", Luminosidade: ", d.luminosidade, " as " , d.momento) as Informações
FROM empresa as e
JOIN sensor as s ON e.idEmpresa = endereco.fkEmpresa
JOIN dados as d ON s.idSensor = d.fkSensor
ORDER BY e.nome, s.andar;

SELECT s.andar as Andar,
s.local as Local, 
       CASE 
	WHEN d.luminosidade > 800 THEN 'Alta'
	WHEN d.luminosidade BETWEEN 500 AND 800 THEN 'Média'
	ELSE 'Baixa'
	END AS 'Grau de luminosidade'
from sensor as s
JOIN dados as d ON s.idSensor = d.fkSensor
JOIN empresa as e ON s.fkEmpresa = e.idEmpresa 
WHERE e.nome = 'Sofra'
ORDER by s.andar;

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, complemento, fkEmpresa) VALUES 
('Rua 2', '217', 'Diadema bairro', 'Diadema', 'SP', null, 1);

SELECT * FROM endereco;

SELECT * FROM sensor;
SELECT * FROM endereco;

SELECT * FROM sensor as s 
JOIN endereco 
ON s.fkEndereco = endereco.idEndereco 
JOIN empresa as emp
ON emp.idEmpresa = endereco.fkEmpresa 
WHERE endereco.fkEmpresa = 1
ORDER by s.andar;

Select * from sensor join endereco on sensor.fkEndereco = idEndereco;


