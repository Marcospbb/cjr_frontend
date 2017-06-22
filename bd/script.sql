-- Crie um database e execute e crie os seguintes objetos
CREATE TABLE empresa.empregado (
        codEmp INTEGER NOT NULL,
        nome VARCHAR(45),
        dataNasc DATE,
        endereco VARCHAR(90),
        sexo CHAR(1),
        salario NUMERIC(10,2),
        codSuperv INTEGER,
        codDepto INTEGER,
        PRIMARY KEY (codEmp)
);

CREATE TABLE empresa.departamento (
        codDepto INTEGER NOT NULL,
        nome VARCHAR(45),
        gerente INTEGER,
        dataGerente DATE,
        PRIMARY KEY (codDepto)
);

CREATE TABLE empresa.projeto (
        codProj INTEGER NOT NULL,
        titulo VARCHAR(45),
        codDepto INTEGER,
        PRIMARY KEY (codProj)
);

CREATE TABLE empresa.trabalhaEm (
        codEmp INTEGER NOT NULL,
        codProj INTEGER NOT NULL,
        horas INTEGER,
        PRIMARY KEY (codEmp,codProj)
);

CREATE TABLE empresa.dependente (
        codEmp INTEGER NOT NULL,
        nome VARCHAR(45),
        sexo CHAR(1),
        dataNasc DATE,
        relacao VARCHAR(20),
        PRIMARY KEY (codEmp,nome)

);


ALTER TABLE empresa.empregado ADD CONSTRAINT empregado_depto_fk FOREIGN KEY 
(codDepto) REFERENCES empresa.departamento(codDepto);
ALTER TABLE empresa.projeto ADD CONSTRAINT projeto_depto_fk FOREIGN KEY 
(codDepto) REFERENCES empresa.departamento(codDepto);
ALTER TABLE empresa.dependente ADD CONSTRAINT dependente_empregado_fk 
FOREIGN KEY (codEmp) REFERENCES empresa.empregado(codEmp);


INSERT INTO empresa.departamento VALUES (5,'Pesquisa',2,'1988-05-22');
INSERT INTO empresa.departamento VALUES (4,'Administracao',4,'1985-01-01');
INSERT INTO empresa.departamento VALUES (1,'Direcao',7,'1981-06-19');


INSERT INTO empresa.empregado VALUES (1,'Joao da Silva','1955-01-09',
'Rua dos Camelos, 23','M',30000,2,5);
INSERT INTO empresa.empregado VALUES (2,'Horacio Bagual','1970-10-10',
'Av. dos Tapejaras, 90','M',40000,7,5);
INSERT INTO empresa.empregado VALUES (3,'Ana Bacana','1980-06-20',
'Av. Atacama, 10 apto 22','F',25000,4,4);
INSERT INTO empresa.empregado VALUES (4,'Antonio Pestana','1990-04-13',
'Rod. Imigrantes, 1940','M',45000,7,4);
INSERT INTO empresa.empregado VALUES (5,'Maria Antonia Real','1982-11-14',
'Rua Petropolis, 13','F',38000,2,5);
INSERT INTO empresa.empregado VALUES (6,'Ada Maria Lovelace','1965-10-15',
'Rua dos Ingleses, 1020','F',25000,2,5);
INSERT INTO empresa.empregado VALUES (8,'Joaquina Pasqualini','1968-08-17',
'Rua dos Ingleses, 1010','F',25000,4,4);
INSERT INTO empresa.empregado VALUES (7,'Jaime Bonde','1958-01-01',
'Rua dos Ingleses, 1010','M',70000,null,1);


INSERT INTO empresa.projeto VALUES (1,'Transmogrifador',5);
INSERT INTO empresa.projeto VALUES (2,'Cama Hiperbarica',5);
INSERT INTO empresa.projeto VALUES (3,'Emissor de Raios Z',5);
INSERT INTO empresa.projeto VALUES (10,'Gestao dos 80/20',4);
INSERT INTO empresa.projeto VALUES (20,'Business Inteligence',1);
INSERT INTO empresa.projeto VALUES (30,'Bonus para Inventores',4);

INSERT INTO empresa.trabalhaEm VALUES (1,1,32.5);
INSERT INTO empresa.trabalhaEm VALUES (1,2,7.5);
INSERT INTO empresa.trabalhaEm VALUES (5,3,40);
INSERT INTO empresa.trabalhaEm VALUES (6,1,20);
INSERT INTO empresa.trabalhaEm VALUES (6,2,20);
INSERT INTO empresa.trabalhaEm VALUES (2,2,10);
INSERT INTO empresa.trabalhaEm VALUES (2,3,10);
INSERT INTO empresa.trabalhaEm VALUES (2,10,10);
INSERT INTO empresa.trabalhaEm VALUES (2,20,10);
INSERT INTO empresa.trabalhaEm VALUES (3,30,30);
INSERT INTO empresa.trabalhaEm VALUES (3,10,10);
INSERT INTO empresa.trabalhaEm VALUES (8,10,35);
INSERT INTO empresa.trabalhaEm VALUES (8,30,5);
INSERT INTO empresa.trabalhaEm VALUES (4,30,20);
INSERT INTO empresa.trabalhaEm VALUES (4,20,15);
INSERT INTO empresa.trabalhaEm VALUES (7,20,0);
INSERT INTO empresa.trabalhaEm VALUES (1,3,15);

INSERT INTO empresa.dependente VALUES (2,'Joana Bagual','F',
'1986-05-05','Filha');
INSERT INTO empresa.dependente VALUES (2,'Pedro Bagual','M',
'1983-10-25','Filho');
INSERT INTO empresa.dependente VALUES (2,'Alice Bagual','F',
'1958-05-03','Esposa');
INSERT INTO empresa.dependente VALUES (3,'Maximo Bacana','M',
'1942-02-28','Esposo');
INSERT INTO empresa.dependente VALUES (1,'Jagunco da Silva','M',
'1978-01-01','Filho');
INSERT INTO empresa.dependente VALUES (1,'Jaqueline da Silva','F',
'1978-12-31','Filha');
INSERT INTO empresa.dependente VALUES (1,'Joana da Silva','F',
'1957-05-05','Esposa');