USE safelight;

CREATE TABLE empresa(
idEmpresa int primary key auto_increment,
nome varchar(90),
CNPJ char (14)
);

INSERT INTO empresa(nome,CNPJ) VALUES
('Coca-Loca','02219482000109'),
('Pieps','37555384000119'),
('Sofra','27570297000187'),
('Itua','84391627000100'),
('Brodesco','43614289000141'),
('Guugol','43614289000141');

CREATE TABLE funcionario(
idFuncionario int auto_increment,
fkEmpresa int,
constraint pkEmpresa primary key (idFuncionario, fkEmpresa),
constraint fkFuncEmpresa foreign key (fkEmpresa) references empresa(idEmpresa),
nome varchar(45),
cpf char(11),
celular char(11),
email varchar(255),
senha varchar(255)
);

INSERT INTO funcionario (fkEmpresa, nome, cpf, celular, email, senha) VALUES
(1, 'João Silva', '89190680030', '11934164723', 'joao.silva@email.com', 'urubu100'),
(1, 'Maria Oliveira', '57875337046', '11921345642', 'maria.oliveira@email.com', 'batatinha123'),
(2, 'Carlos Pereira', '31309693064', '21921145654', 'carlos.pereira@email.com', 'madioca456'),
(2, 'Ana Santos', '95660572022', '21912345186', 'ana.santos@email.com', 'tuberculo789'),
(3, 'Fernanda Costa', '58725501038', '31921356758', 'fernanda.costa@email.com', 'gaivota99'),
(3, 'Ricardo Lima', '02983657078', '31921784920', 'ricardo.lima@email.com', 'mikewazausky'),
(4, 'Juliana Almeida', '10093639058', '41927184561', 'juliana.almeida@email.com', 'sullivan888'),
(4, 'Paulo Sousa', '68231042016', '41979261734', 'paulo.sousa@email.com', 'cabritopunk999'),
(5, 'Tatiane Rocha', '11517377048', '51991923718', 'tatiane.rocha@email.com', 'R0b3r0o4arl0s3ss3C4r4S0u3u'),
(5, 'Marcos Ferreira', '59017622075', '51992783510', 'marcos.ferreira@email.com', 'CasaDeFerreiroEspetoDePau'),
(6, 'Bruna Martins', '38671737020', '61956718953', 'bruna.martins@email.com', '2345meia78'),
(6, 'Eduardo Nunes', '92300983028', '61921834895', 'eduardo.nunes@email.com', '1JtTTSJj8iuGyyf');

create table endereco(
	idEndereco int primary key auto_increment,
    logradouro varchar(45),
    numero char(5),
    bairro varchar(45),
    cidade varchar(45),
    estado char(2),
    complemento varchar(45),
    fkEmpresa int,
    constraint fkEmpresaEndereco foreign key (fkEmpresa)
		references	empresa(idEmpresa));

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, complemento, fkEmpresa) VALUES 
('Rua A', '123', 'Centro', 'São Paulo', 'SP', 'Apto 1', 1),
('Rua B', '456', 'Jardim', 'Rio de Janeiro', 'RJ', 'Casa', 2),
('Rua C', '789', 'Zona Sul', 'Belo Horizonte', 'MG', 'Loja', 3),
('Rua D', '321', 'Centro', 'Curitiba', 'PR', 'Sala 2', 4),
('Rua E', '654', 'Norte', 'Porto Alegre', 'RS', 'Cobertura', 5),
('Rua F', '987', 'Sul', 'Brasília', 'DF', 'Apto 2', 6);

CREATE TABLE sensor(
idSensor int primary key auto_increment,
fkEmpresa int,
constraint fkEmpSensor foreign key (fkEmpresa) references empresa(idEmpresa),
andar char(3),
quadrante char(4)
);		

INSERT INTO sensor (fkEmpresa, andar, quadrante) VALUES 
(1, '1', 'A4'),
(1, '1', 'D7'),
(2, '2', 'B2'),
(2, '2', 'C5'),
(3, '3', 'D4'),
(3, '3', 'F6'),
(4, '4', 'C3'),
(4, '4', 'A7'),
(5, '5', 'E3'),
(5, '5', 'G5'),
(6, '6', 'B4'),
(6, '6', 'F6'),
(1, '1', 'H5'),
(2, '2', 'N4'),
(3, '3', 'F11'),
(4, '4', 'I6'),
(5, '5', 'B8'),
(6, '6', 'C4');


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


CREATE TABLE dimmer(
idDimmer int auto_increment,
fkSensor int,
constraint pkSensorDimmer primary key (idDimmer, fkSensor),
constraint fkSensorDimmer foreign key (fkSensor) references sensor(idSensor),
percentual int,
momento datetime
);

INSERT INTO dimmer (fkSensor, percentual, momento) VALUES 
(1, 75, '2024-10-21 08:05:00'),
(2, 60, '2024-10-21 09:20:00'),
(3, 85, '2024-10-21 10:35:00'),
(4, 90, '2024-10-21 11:50:00'),
(5, 50, '2024-10-21 12:05:00'),
(6, 70, '2024-10-21 13:50:00'),
(7, 80, '2024-10-21 14:10:00'),
(8, 65, '2024-10-21 14:25:00'),
(9, 55, '2024-10-21 14:40:00'),
(10, 95, '2024-10-21 14:55:00'),
(11, 40, '2024-10-21 15:10:00'),
(12, 85, '2024-10-21 15:25:00'),
(13, 75, '2024-10-21 15:40:00'),
(14, 60, '2024-10-21 15:55:00'),
(15, 90, '2024-10-21 16:10:00'),
(16, 50, '2024-10-21 16:25:00'),
(17, 70, '2024-10-21 16:40:00'),
(18, 80, '2024-10-21 16:55:00');

SELECT * FROM dimmer;

SELECT e.nome as Empresa,
concat(end.logradouro, ' ', end.numero) as endereço,
f.nome as "Nome funcionário",
f.email as "Login do usuário",
f.senha as "Senha do usuário"
FROM empresa as e
JOIN endereco as end ON idEmpresa = end.fkEmpresa
JOIN funcionario as f ON idEmpresa = f.fkEmpresa;

SELECT e.nome as Empresa,
concat("Andar: ", s.andar, " Quadrante: ", s.quadrante, " Luminosidade: ", d.luminosidade, " as " , d.momento) as Informações
FROM empresa as e
JOIN sensor as s ON idEmpresa = fkEmpresa
JOIN dados as d ON idSensor = fkSensor;

SELECT s.andar as Andar,
s.quadrante as Quadrante,
di.idDimmer, 
di.percentual, 
       CASE 
	WHEN d.luminosidade > 800 THEN 'Alta'
	WHEN d.luminosidade BETWEEN 500 AND 800 THEN 'Média'
	ELSE 'Baixa'
	END AS 'Grau de luminosidade'
FROM dimmer as di
JOIN sensor as s ON di.fkSensor = idSensor
JOIN dados as d ON di.fkSensor = d.fkSensor
