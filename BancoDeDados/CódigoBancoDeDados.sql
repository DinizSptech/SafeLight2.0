USE SafeLight;

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
senha varchar(255),
gerente varchar(20),
constraint chkAdmin check (gerente in (0,1))
);

INSERT INTO funcionario (fkEmpresa, nome, cpf, celular, email, senha, gerente) VALUES
(1, 'João Silva', '89190680030', '11934164723', 'joao.silva@email.com', 'Urubu10@', '0'),
(1, 'Maria Oliveira', '57875337046', '11921345642', 'maria.oliveira@email.com', 'B@tatinha123', '1'),
(2, 'Carlos Pereira', '31309693064', '21921145654', 'carlos.pereira@email.com', 'M@ndioca456', '0'),
(2, 'Ana Santos', '95660572022', '21912345186', 'ana.santos@email.com', 'Tubercul#789', '1'),
(3, 'Fernanda Costa', '58725501038', '31921356758', 'fernanda.costa@email.com', 'Ga!vota99', '1'),
(3, 'Ricardo Lima', '02983657078', '31921784920', 'ricardo.lima@email.com', 'M!kewaz4usky', '0'),
(4, 'Juliana Almeida', '10093639058', '41927184561', 'juliana.almeida@email.com', '$Ullivan888', '1'),
(4, 'Paulo Sousa', '68231042016', '41979261734', 'paulo.sousa@email.com', 'C@britopunk999', '1'),
(5, 'Tatiane Rocha', '11517377048', '51991923718', 'tatiane.rocha@email.com', 'R0b3rt0Carl0$Ess3C4r4S0u3u', '0'),
(5, 'Marcos Ferreira', '59017622075', '51992783510', 'marcos.ferreira@email.com', 'Ca$ADeFerreiroEspetoDePau','0'),
(6, 'Bruna Martins', '38671737020', '61956718953', 'bruna.martins@email.com', '2345m#ia78', '1'),
(6, 'Eduardo Nunes', '92300983028', '61921834895', 'eduardo.nunes@email.com', '1JtTT$Jj8iuGyyf', '1');

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
references	empresa(idEmpresa)
);

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, complemento, fkEmpresa) VALUES 
('Rua Haddock Lobo', '371', 'Centro', 'São Paulo', 'SP', 'Apto 1', 1),
('Rua Malabar', '4561', 'Jardim', 'Rio de Janeiro', 'RJ', 'Casa', 2),
('Rua 7 de Março', '873', 'Zona Sul', 'Belo Horizonte', 'MG', 'Loja', 3),
('Rua Doutor Engenheiro Guilherme', '43', 'Centro', 'Curitiba', 'PR', 'Sala 2', 4),
('Rua Senhor dos Passos', '654', 'Norte', 'Porto Alegre', 'RS', 'Cobertura', 5),
('Rua Albuquerque', '987', 'Sul', 'Brasília', 'DF', 'Apto 2', 6);

CREATE TABLE sensor(
idSensor int primary key auto_increment,
fkEmpresa int,
constraint fkEmpSensor foreign key (fkEmpresa) references empresa(idEmpresa),
andar char(3),
local varchar(30)
);

INSERT INTO sensor (fkEmpresa, andar, local) VALUES 
(1, '1', 'Recepção'),
(1, 'SS', 'Depósito'),
(2, '2', 'Sala de reunião pequena'),
(2, '1', 'Escritório 1'),
(3, '1', 'Sala de assistencia técnica'),
(3, '2', 'Sala de Reunião média'),
(4, '5', 'Sala Supervisor'),
(4, '4', 'Sala de reunião grande'),
(5, '5', 'Sala supervisor back-end'),
(5, '5', 'Sala supervisor BD'),
(6, '6', 'Servidores'),
(6, '7', 'Sala CEO'),
(1, '2', 'Sala descanso'),
(2, '3', 'Escritório 2'),
(3, '3', 'Arquivos'),
(4, '2', 'Escritório 3'),
(5, '6', 'Administrativo'),
(6, '5', 'Financeiro');


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

SELECT e.nome as Empresa,
concat(end.logradouro, ' ', end.numero) as endereço,
f.nome as "Nome funcionário",
f.email as "Login do usuário",
f.senha as "Senha do usuário",
CASE WHEN f.gerente = 1 THEN 'Usuário gerente'
ELSE 'Usuário comum'
END as 'Tipo de usuário'
FROM empresa as e
JOIN endereco as end ON idEmpresa = end.fkEmpresa
JOIN funcionario as f ON idEmpresa = f.fkEmpresa;

SELECT e.nome as Empresa,
concat("Andar: ", s.andar, ", Local: ", s.local, ", Luminosidade: ", d.luminosidade, " as " , d.momento) as Informações
FROM empresa as e
JOIN sensor as s ON idEmpresa = fkEmpresa
JOIN dados as d ON idSensor = fkSensor
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