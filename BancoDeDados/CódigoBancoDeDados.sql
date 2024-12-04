CREATE DATABASE Safelight;
USE Safelight;
-- drop database safelight;
CREATE TABLE empresa(
idEmpresa int primary key auto_increment,
nome varchar(90),
CNPJ char(14) UNIQUE
);

INSERT INTO empresa(nome,CNPJ) VALUES
('Coca-cola','02219482000109'),
('Pepsi','37555384000119'),
('Safra','27570297000187'),
('Itau','84391627000100'),
('Bradesco','43614289000141'),
('Google','43614289000142');

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
    cpf CHAR(11) UNIQUE,
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
momento datetime default CURRENT_TIMESTAMP()
);

-- DADOS DE TESTE
INSERT INTO dados (fkSensor, luminosidade, momento) VALUES
(1, 450, '2024-12-03 08:00:00'),
(1, 500, '2024-12-03 09:00:00'),
(1, 550, '2024-12-03 10:00:00'),
(1, 600, '2024-12-03 11:00:00'),
(1, 620, '2024-12-03 12:00:00'),
(1, 610, '2024-12-03 13:00:00'),
(1, 580, '2024-12-03 14:00:00'),
(1, 540, '2024-12-03 15:00:00'),
(1, 500, '2024-12-03 16:00:00'),
(1, 460, '2024-12-03 17:00:00'),
(1, 420, '2024-12-03 18:00:00'),
(1, 380, '2024-12-03 19:00:00'),
(1, 350, '2024-12-03 20:00:00'),
(1, 300, '2024-12-03 21:00:00'),
(1, 250, '2024-12-03 22:00:00'),
(2, 650, '2024-12-03 08:00:00'),
(2, 700, '2024-12-03 09:00:00'),
(2, 750, '2024-12-03 10:00:00'),
(2, 720, '2024-12-03 11:00:00'),
(2, 680, '2024-12-03 12:00:00'),
(2, 670, '2024-12-03 13:00:00'),
(2, 690, '2024-12-03 14:00:00'),
(2, 740, '2024-12-03 15:00:00'),
(2, 760, '2024-12-03 16:00:00'),
(2, 800, '2024-12-03 17:00:00'),
(2, 760, '2024-12-04 08:00:00'),
(2, 710, '2024-12-04 09:00:00'),
(2, 730, '2024-12-04 10:00:00'),
(2, 740, '2024-12-04 11:00:00'),
(2, 720, '2024-12-04 12:00:00'),
(2, 680, '2024-12-04 13:00:00'),
(2, 690, '2024-12-04 14:00:00'),
(2, 740, '2024-12-04 15:00:00'),
(2, 750, '2024-12-04 16:00:00'),
(2, 780, '2024-12-04 17:00:00'),
(3, 600, '2024-12-03 08:00:00'),
(3, 640, '2024-12-03 09:00:00'),
(3, 680, '2024-12-03 10:00:00'),
(3, 700, '2024-12-03 11:00:00'),
(3, 710, '2024-12-03 12:00:00'),
(3, 730, '2024-12-03 13:00:00'),
(3, 760, '2024-12-03 14:00:00'),
(3, 780, '2024-12-03 15:00:00'),
(3, 800, '2024-12-03 16:00:00'),
(3, 820, '2024-12-03 17:00:00'),
(4, 550, '2024-12-03 08:00:00'),
(4, 600, '2024-12-03 09:00:00'),
(4, 650, '2024-12-03 10:00:00'),
(4, 670, '2024-12-03 11:00:00'),
(4, 690, '2024-12-03 12:00:00'),
(4, 710, '2024-12-03 13:00:00'),
(4, 740, '2024-12-03 14:00:00'),
(4, 750, '2024-12-03 15:00:00'),
(4, 780, '2024-12-03 16:00:00'),
(4, 800, '2024-12-03 17:00:00'),
(5, 590, '2024-12-03 08:00:00'),
(5, 640, '2024-12-03 09:00:00'),
(5, 680, '2024-12-03 10:00:00'),
(5, 700, '2024-12-03 11:00:00'),
(5, 720, '2024-12-03 12:00:00'),
(5, 740, '2024-12-03 13:00:00'),
(5, 760, '2024-12-03 14:00:00'),
(5, 780, '2024-12-03 15:00:00'),
(5, 800, '2024-12-03 16:00:00'),
(5, 820, '2024-12-03 17:00:00'),
(6, 560, '2024-12-03 08:00:00'),
(6, 590, '2024-12-03 09:00:00'),
(6, 620, '2024-12-03 10:00:00'),
(6, 640, '2024-12-03 11:00:00'),
(6, 660, '2024-12-03 12:00:00'),
(6, 680, '2024-12-03 13:00:00'),
(6, 700, '2024-12-03 14:00:00'),
(6, 730, '2024-12-03 15:00:00'),
(6, 750, '2024-12-03 16:00:00'),
(6, 770, '2024-12-03 17:00:00'),
(7, 630, '2024-12-03 08:00:00'),
(7, 670, '2024-12-03 09:00:00'),
(7, 710, '2024-12-03 10:00:00'),
(7, 740, '2024-12-03 11:00:00'),
(7, 760, '2024-12-03 12:00:00'),
(7, 780, '2024-12-03 13:00:00'),
(7, 800, '2024-12-03 14:00:00'),
(7, 820, '2024-12-03 15:00:00'),
(7, 840, '2024-12-03 16:00:00'),
(7, 860, '2024-12-03 17:00:00'),
(8, 600, '2024-12-03 08:00:00'),
(8, 640, '2024-12-03 09:00:00'),
(8, 680, '2024-12-03 10:00:00'),
(8, 700, '2024-12-03 11:00:00'),
(8, 720, '2024-12-03 12:00:00'),
(8, 740, '2024-12-03 13:00:00'),
(8, 760, '2024-12-03 14:00:00'),
(8, 780, '2024-12-03 15:00:00'),
(8, 800, '2024-12-03 16:00:00'),
(8, 820, '2024-12-03 17:00:00'),
(9, 620, '2024-12-03 08:00:00'),
(9, 650, '2024-12-03 09:00:00'),
(9, 690, '2024-12-03 10:00:00'),
(9, 710, '2024-12-03 11:00:00'),
(9, 740, '2024-12-03 12:00:00'),
(9, 770, '2024-12-03 13:00:00'),
(9, 790, '2024-12-03 14:00:00'),
(9, 810, '2024-12-03 15:00:00'),
(9, 830, '2024-12-03 16:00:00'),
(9, 850, '2024-12-03 17:00:00'),
(10, 600, '2024-12-03 08:00:00'),
(10, 630, '2024-12-03 09:00:00'),
(10, 670, '2024-12-03 10:00:00'),
(10, 690, '2024-12-03 11:00:00'),
(10, 710, '2024-12-03 12:00:00'),
(10, 740, '2024-12-03 13:00:00'),
(10, 760, '2024-12-03 14:00:00'),
(10, 780, '2024-12-03 15:00:00'),
(10, 800, '2024-12-03 16:00:00'),
(10, 820, '2024-12-03 17:00:00'),
(11, 590, '2024-12-03 08:00:00'),
(11, 620, '2024-12-03 09:00:00'),
(11, 650, '2024-12-03 10:00:00'),
(11, 670, '2024-12-03 11:00:00'),
(11, 690, '2024-12-03 12:00:00'),
(11, 710, '2024-12-03 13:00:00'),
(11, 740, '2024-12-03 14:00:00'),
(11, 760, '2024-12-03 15:00:00'),
(11, 780, '2024-12-03 16:00:00'),
(11, 800, '2024-12-03 17:00:00'),
(12, 580, '2024-12-03 08:00:00'),
(12, 600, '2024-12-03 09:00:00'),
(12, 630, '2024-12-03 10:00:00'),
(12, 650, '2024-12-03 11:00:00'),
(12, 670, '2024-12-03 12:00:00'),
(12, 690, '2024-12-03 13:00:00'),
(12, 710, '2024-12-03 14:00:00'),
(12, 740, '2024-12-03 15:00:00'),
(12, 760, '2024-12-03 16:00:00'),
(12, 780, '2024-12-03 17:00:00'),
(13, 570, '2024-12-03 08:00:00'),
(13, 590, '2024-12-03 09:00:00'),
(13, 620, '2024-12-03 10:00:00'),
(13, 640, '2024-12-03 11:00:00'),
(13, 660, '2024-12-03 12:00:00'),
(13, 680, '2024-12-03 13:00:00'),
(13, 700, '2024-12-03 14:00:00'),
(13, 720, '2024-12-03 15:00:00'),
(13, 740, '2024-12-03 16:00:00'),
(13, 760, '2024-12-03 17:00:00'),
(14, 560, '2024-12-03 08:00:00'),
(14, 580, '2024-12-03 09:00:00'),
(14, 610, '2024-12-03 10:00:00'),
(14, 630, '2024-12-03 11:00:00'),
(14, 650, '2024-12-03 12:00:00'),
(14, 670, '2024-12-03 13:00:00'),
(14, 690, '2024-12-03 14:00:00'),
(14, 710, '2024-12-03 15:00:00'),
(14, 730, '2024-12-03 16:00:00'),
(14, 750, '2024-12-03 17:00:00'),
(15, 550, '2024-12-03 08:00:00'),
(15, 570, '2024-12-03 09:00:00'),
(15, 590, '2024-12-03 10:00:00'),
(15, 610, '2024-12-03 11:00:00'),
(15, 630, '2024-12-03 12:00:00'),
(15, 650, '2024-12-03 13:00:00'),
(15, 670, '2024-12-03 14:00:00'),
(15, 690, '2024-12-03 15:00:00'),
(15, 710, '2024-12-03 16:00:00'),
(15, 730, '2024-12-03 17:00:00'),
(16, 540, '2024-12-03 08:00:00'),
(16, 560, '2024-12-03 09:00:00'),
(16, 580, '2024-12-03 10:00:00'),
(16, 600, '2024-12-03 11:00:00'),
(16, 620, '2024-12-03 12:00:00'),
(16, 640, '2024-12-03 13:00:00'),
(16, 660, '2024-12-03 14:00:00'),
(16, 680, '2024-12-03 15:00:00'),
(16, 700, '2024-12-03 16:00:00'),
(16, 720, '2024-12-03 17:00:00'),
(17, 530, '2024-12-03 08:00:00'),
(17, 550, '2024-12-03 09:00:00'),
(17, 570, '2024-12-03 10:00:00'),
(17, 590, '2024-12-03 11:00:00'),
(17, 610, '2024-12-03 12:00:00'),
(17, 630, '2024-12-03 13:00:00'),
(17, 650, '2024-12-03 14:00:00'),
(17, 670, '2024-12-03 15:00:00'),
(17, 690, '2024-12-03 16:00:00'),
(17, 710, '2024-12-03 17:00:00'),
(18, 520, '2024-12-03 08:00:00'),
(18, 540, '2024-12-03 09:00:00'),
(18, 560, '2024-12-03 10:00:00'),
(18, 580, '2024-12-03 11:00:00'),
(18, 600, '2024-12-03 12:00:00'),
(18, 620, '2024-12-03 13:00:00'),
(18, 640, '2024-12-03 14:00:00'),
(18, 660, '2024-12-03 15:00:00'),
(18, 680, '2024-12-03 16:00:00'),
(18, 700, '2024-12-03 17:00:00'),
(19, 510, '2024-12-03 08:00:00'),
(19, 530, '2024-12-03 09:00:00'),
(19, 550, '2024-12-03 10:00:00'),
(19, 570, '2024-12-03 11:00:00'),
(19, 590, '2024-12-03 12:00:00'),
(19, 610, '2024-12-03 13:00:00'),
(19, 630, '2024-12-03 14:00:00'),
(19, 650, '2024-12-03 15:00:00'),
(19, 670, '2024-12-03 16:00:00'),
(19, 690, '2024-12-03 17:00:00'),
(20, 500, '2024-12-03 08:00:00'),
(20, 520, '2024-12-03 09:00:00'),
(20, 540, '2024-12-03 10:00:00'),
(20, 560, '2024-12-03 11:00:00'),
(20, 580, '2024-12-03 12:00:00'),
(20, 600, '2024-12-03 13:00:00'),
(20, 620, '2024-12-03 14:00:00'),
(20, 640, '2024-12-03 15:00:00'),
(20, 660, '2024-12-03 16:00:00'),
(20, 680, '2024-12-03 17:00:00'),
(21, 490, '2024-12-03 08:00:00'),
(21, 510, '2024-12-03 09:00:00'),
(21, 530, '2024-12-03 10:00:00'),
(21, 550, '2024-12-03 11:00:00'),
(21, 570, '2024-12-03 12:00:00'),
(21, 590, '2024-12-03 13:00:00'),
(21, 610, '2024-12-03 14:00:00'),
(21, 630, '2024-12-03 15:00:00'),
(21, 650, '2024-12-03 16:00:00'),
(21, 670, '2024-12-03 17:00:00'),
(22, 480, '2024-12-03 08:00:00'),
(22, 500, '2024-12-03 09:00:00'),
(22, 520, '2024-12-03 10:00:00'),
(22, 540, '2024-12-03 11:00:00'),
(22, 560, '2024-12-03 12:00:00'),
(22, 580, '2024-12-03 13:00:00'),
(22, 600, '2024-12-03 14:00:00'),
(22, 620, '2024-12-03 15:00:00'),
(22, 640, '2024-12-03 16:00:00'),
(22, 660, '2024-12-03 17:00:00'),
(23, 470, '2024-12-03 08:00:00'),
(23, 490, '2024-12-03 09:00:00'),
(23, 510, '2024-12-03 10:00:00'),
(23, 530, '2024-12-03 11:00:00'),
(23, 550, '2024-12-03 12:00:00'),
(23, 570, '2024-12-03 13:00:00'),
(23, 590, '2024-12-03 14:00:00'),
(23, 610, '2024-12-03 15:00:00'),
(23, 630, '2024-12-03 16:00:00'),
(23, 650, '2024-12-03 17:00:00'),
(24, 460, '2024-12-03 08:00:00'),
(24, 480, '2024-12-03 09:00:00'),
(24, 500, '2024-12-03 10:00:00'),
(24, 520, '2024-12-03 11:00:00'),
(24, 540, '2024-12-03 12:00:00'),
(24, 560, '2024-12-03 13:00:00'),
(24, 580, '2024-12-03 14:00:00'),
(24, 600, '2024-12-03 15:00:00'),
(24, 620, '2024-12-03 16:00:00'),
(24, 640, '2024-12-03 17:00:00'),
(22, 470, '2024-12-04 08:00:00'),
(22, 490, '2024-12-04 09:00:00'),
(22, 510, '2024-12-04 10:00:00'),
(22, 530, '2024-12-04 11:00:00'),
(22, 550, '2024-12-04 12:00:00'),
(22, 570, '2024-12-04 13:00:00'),
(22, 590, '2024-12-04 14:00:00'),
(22, 610, '2024-12-04 15:00:00'),
(22, 630, '2024-12-04 16:00:00'),
(22, 650, '2024-12-04 17:00:00'),
(23, 460, '2024-12-04 08:00:00'),
(23, 480, '2024-12-04 09:00:00'),
(23, 500, '2024-12-04 10:00:00'),
(23, 520, '2024-12-04 11:00:00'),
(23, 540, '2024-12-04 12:00:00'),
(23, 560, '2024-12-04 13:00:00'),
(23, 580, '2024-12-04 14:00:00'),
(23, 600, '2024-12-04 15:00:00'),
(23, 620, '2024-12-04 16:00:00'),
(23, 640, '2024-12-04 17:00:00'),
(24, 450, '2024-12-04 08:00:00'),
(24, 470, '2024-12-04 09:00:00'),
(24, 490, '2024-12-04 10:00:00'),
(24, 510, '2024-12-04 11:00:00'),
(24, 530, '2024-12-04 12:00:00'),
(24, 550, '2024-12-04 13:00:00'),
(24, 570, '2024-12-04 14:00:00'),
(24, 590, '2024-12-04 15:00:00'),
(24, 610, '2024-12-04 16:00:00'),
(24, 630, '2024-12-04 17:00:00');


#TOPICO A ABORDAR
SELECT  concat(end.logradouro, ' ', end.numero) as endereço,
	e.nome as Empresa,
	f.nome as Funcionário
	FROM endereco as end
	JOIN empresa as e
	ON end.fkEMpresa = e.idEmpresa
	JOIN gerenciadores as f
	ON f.fkEndereco = end.fkEmpresa;


SELECT * FROM empresa;

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

select * from gerenciadores where idgerenciadores = 4;
SELECT * from sensor join dados on dados.fksensor = sensor.idsensor where fkendereco = 4;

select * from dados;

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
    AND momento like '%2024-12-03%';
    
    SELECT idSensor, luminosidade, momento
        FROM dados as d
        JOIN sensor as s
        ON d.fkSensor = s.idSensor
        WHERE s.fkEndereco = 1 and s.idSensor = 1 and d.momento like '%2024-12-03%'
    ORDER BY momento;
    
    CREATE VIEW vw_geral AS
SELECT 
    AVG(d.luminosidade) as luminosidade,  
    s.local, 
    s.andar,
    g.idGerenciadores
FROM 
    dados as d
JOIN 
    sensor as s ON d.fkSensor = s.idSensor
JOIN 
    endereco as e ON s.fkEndereco = e.idEndereco
JOIN 
    gerenciadores as g ON e.idEndereco = g.fkEndereco
GROUP BY 
    s.local, s.andar, g.idGerenciadores;
    
    select * from vw_geral;