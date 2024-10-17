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

CREATE TABLE sensor(
idSensor int primary key auto_increment,
fkEmpresa int,
constraint fkEmpSensor foreign key (fkEmpresa) references empresa(idEmpresa),
Andar char(3),
Quadrante char(4)
);		

CREATE TABLE dados(
idDado int auto_increment,
fkSensor int,
constraint pkSensorDados primary key (idDado, fkSensor),
constraint fkSensorDados foreign key (fkSensor) references sensor(idSensor),
luminosidade int,
momento datetime
);

CREATE TABLE dimmer(
idDimmer int auto_increment,
fkSensor int,
constraint pkSensorDimmer primary key (idDimmer, fkSensor),
constraint fkSensorDimmer foreign key (fkSensor) references sensor(idSensor),
percetual int,
momento datetime
);
