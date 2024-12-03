CREATE DATABASE Safelight;
USE Safelight;
-- drop database safelight;
CREATE TABLE empresa(
idEmpresa int primary key auto_increment,
nome varchar(90),
CNPJ char (14)
);

INSERT INTO empresa(nome,CNPJ) VALUES
('Coca-cola','02219482000109'),
('Pepsi','37555384000119'),
('Safra','27570297000187'),
('Itau','84391627000100'),
('Bradesco','43614289000141'),
('Google','43614289000141');

CREATE TABLE endereco (
  idEndereco INT PRIMARY KEY AUTO_INCREMENT,
  logradouro VARCHAR(45),
  numero CHAR(5),
  bairro VARCHAR(45),
  cidade VARCHAR(45),
  estado CHAR(2),
  complemento VARCHAR(45),
  fkEmpresa INT,
  codigoAcesso CHAR(6) UNIQUE,
  CONSTRAINT fkEnderecoEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, complemento, fkEmpresa, codigoAcesso) VALUES
('Rua dos Alfeneiros', '101', 'Centro', 'São Paulo', 'SP', 'Apto 1', 1, 'ABC123'),
('Avenida das Nações', '202', 'Vila Nova', 'São Paulo', 'SP', 'Apto 2', 1, 'X7L2QK'),
('Praça dos Bandeirantes', '303', 'Jardim Paulista', 'São Paulo', 'SP', 'Apto 3', 1, 'A3PT9M'),
('Rua da Paz', '404', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Casa', 2, 'WQ4J8Z'),
('Avenida Atlântica', '505', 'Ipanema', 'Rio de Janeiro', 'RJ', 'Casa', 2, 'N5YKC2'),
('Rua 7 de Março', '873', 'Zona Sul', 'Belo Horizonte', 'MG', 'Loja', 3, 'L9RT3F'),
('Rua Doutor Engenheiro Guilherme', '43', 'Centro', 'Curitiba', 'PR', 'Sala 2', 4, 'B2G8Y3'),
('Rua Senhor dos Passos', '654', 'Norte', 'Porto Alegre', 'RS', 'Cobertura', 5, 'F1D2V8'),
('Rua Albuquerque', '987', 'Sul', 'Brasília', 'DF', 'Apto 2', 6, 'T5P7K9');


CREATE TABLE gerenciadores (
    idGerenciadores INT AUTO_INCREMENT PRIMARY KEY,
    fkEndereco INT,
    nome VARCHAR(45),
    cpf CHAR(11),
    celular CHAR(11),
    email VARCHAR(255),
    senha VARCHAR(255),
    CONSTRAINT fkEnderecoGerenciadores FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

select * from gerenciadores;

INSERT INTO gerenciadores (fkEndereco, nome, cpf, celular, email, senha) VALUES
(1, 'João Silva', '89190680030', '11934164723', 'joao.silva@email.com', 'Urubu10@'),
(2, 'Maria Oliveira', '57875337046', '11921345642', 'maria.oliveira@email.com', 'B@tatinha123'),
(4, 'Carlos Pereira', '31309693064', '21921145654', 'carlos.pereira@email.com', 'M@ndioca456'),
(5, 'Ana Santos', '95660572022', '21912345186', 'ana.santos@email.com', 'Tubercul#789'),
(6, 'Fernanda Costa', '58725501038', '31921356758', 'fernanda.costa@email.com', 'Ga!vota99'),
(7, 'Ricardo Lima', '02983657078', '31921784920', 'ricardo.lima@email.com', 'M!kewaz4usky'),
(8, 'Juliana Almeida', '10093639058', '41927184561', 'juliana.almeida@email.com', '$Ullivan888'),
(9, 'Paulo Sousa', '68231042016', '41979261734', 'paulo.sousa@email.com', 'C@britopunk999');

select * from gerenciadores;

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
(18, 820, '2024-10-21 16:45:00'),
(12, 500, '2024-12-02 10:00:00'),
(12, 450, '2024-12-02 10:05:00'),
(12, 600, '2024-12-02 10:10:00'),
(12, 550, '2024-12-02 10:15:00'),
(12, 470, '2024-12-02 10:20:00'),
(12, 520, '2024-12-02 10:25:00'),
(12, 480, '2024-12-02 10:30:00'),
(12, 560, '2024-12-02 10:35:00'),
(12, 530, '2024-12-02 10:40:00'),
(12, 490, '2024-12-02 10:45:00'),
(12, 510, '2024-12-02 10:50:00'),
(12, 540, '2024-12-02 10:55:00'),
(12, 580, '2024-12-02 11:00:00'),
(12, 570, '2024-12-02 11:05:00'),
(12, 550, '2024-12-02 11:10:00'),
(12, 620, '2024-12-02 11:15:00'),
(12, 600, '2024-12-02 11:20:00'),
(12, 630, '2024-12-02 11:25:00'),
(12, 590, '2024-12-02 11:30:00'),
(12, 560, '2024-12-02 11:35:00');



#TOPICO A ABORDAR
SELECT  concat(end.logradouro, ' ', end.numero) as endereço,
	e.nome as Empresa,
	f.nome as Funcionário
	FROM endereco as end
	JOIN empresa as e
	ON end.fkEMpresa = e.idEmpresa
	JOIN gerenciadores as f
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
JOIN gerenciadores as f ON idEmpresa = f.fkEmpresa
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
SELECT * FROM gerenciadores;

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

SELECT idSensor, max(luminosidade), min(luminosidade), avg(luminosidade) 
FROM dados 
LEFT JOIN sensor ON idSensor = fkSensor 
GROUP BY idSensor;

SELECT idSensor, concat(andar, ' - ', local) as ambiente,
 andar, max(luminosidade) as max, min(luminosidade), avg(luminosidade) FROM sensor 
JOIN dados ON idSensor = fkSensor 
WHERE fkEndereco = 6
GROUP BY idSensor;

SELECT * from gerenciadores JOIN endereco on fkEndereco = idEndereco JOIN empresa on fkEmpresa = idEmpresa;

select * from dados JOIN sensor on fkSensor = idSensor JOIN endereco on fkEndereco = idEndereco JOIN empresa on fkEmpresa = idEmpresa;

    SELECT andar, avg(luminosidade)
	FROM dados as d 
	JOIN sensor as s
	ON d.fkSensor = s.idSensor WHERE s.fkEndereco = 1
    GROUP BY andar;
    
        SELECT avg(luminosidade) as avg, max(luminosidade) as max, min(luminosidade) as min
	FROM dados as d 
	JOIN sensor as s
	ON d.fkSensor = s.idSensor WHERE s.fkEndereco = '1'
    AND momento like '%2024-12-02%';