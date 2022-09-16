/*create schema brh2;*/



/*CRIANDO AS TABELAS */
CREATE TABLE pessoa (
	cpf INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email_pessoal VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (cpf)
);

CREATE TABLE projeto (
	id_projeto INT NOT NULL,
    nome_projeto VARCHAR(20) NOT NULL,
    cpf_responsavel INT NOT NULL,
    inicio DATE NOT NULL,
    fim DATE NOT NULL,
    
    PRIMARY KEY(id_projeto)
);

CREATE TABLE colaborador (
	matricula INT NOT NULL,
    cpf INT NOT NULL,
    email_corporativo VARCHAR(50) NOT NULL,
    salario INT NOT NULL,
    estado VARCHAR(25) NOT NULL,
    cidade VARCHAR (50) NOT NULL,
    bairro VARCHAR (50) NOT NULL,
    logradouro VARCHAR (50) NOT NULL,
    complemento VARCHAR (50) NOT NULL,
    cep INT NOT NULL,
    sigla_departamento VARCHAR(10) NOT NULL,
    
    PRIMARY KEY(matricula)
);

CREATE TABLE departamento (
	sigla VARCHAR(10) NOT NULL,
    nome_departamento VARCHAR(50),
    chefe INT NOT NULL,
    departamento_superior VARCHAR(10),
    
    PRIMARY KEY(sigla)
);

CREATE TABLE atribuicao (
	colaborador_matricula INT NOT NULL,
    id_projeto INT NOT NULL,
    papel VARCHAR(20) NOT NULL,
    
    PRIMARY KEY(colaborador_matricula, id_projeto, papel)
);

CREATE TABLE papel (
	id_papel INT NOT NULL,
	nome_papel VARCHAR(20) NOT NULL,
    
    PRIMARY KEY(id_papel)
);

CREATE TABLE dependente (
	cpf_dependente INT NOT NULL,
	matricula_colaborador INT NOT NULL,
	nome_dependente VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    parentesco_colaborador VARCHAR(20) NOT NULL,
    
    PRIMARY KEY(cpf_dependente)
);

CREATE TABLE telefone (
	numero_telefone INT NOT NULL,
	numero_matricula INT NOT NULL,

   PRIMARY KEY(numero_telefone)
);
/* ATRIBUINDO AS FOREIGN KEY*/ 

ALTER TABLE colaborador ADD CONSTRAINT CE_COLABORADOR_PESSOA /* fk colaborador pessoa*/
	foreign key (cpf)
	REFERENCES PESSOA (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE atribuicao ADD CONSTRAINT CE_ATRIBUICAO_COLABORADOR /*fk atribuicao colaborador*/
	foreign key (colaborador_matricula)
	REFERENCES colaborador (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

alter table papel modify column id_papel varchar(20);  /* Precisei alterar o tipo da coluna papel pois estava diferente*/

ALTER TABLE atribuicao ADD CONSTRAINT CE_ATRIBUICAO_PAPEL /* fk atribuicao papel*/
	foreign key (papel)
	REFERENCES papel (id_papel)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE atribuicao ADD CONSTRAINT CE_ATRIBUICAO_PROJETO /* fk atribuicao projeto*/
	foreign key (id_projeto)
	REFERENCES projeto (id_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE telefone ADD CONSTRAINT CE_TELEFONE_COLABORADOR /*fk telefone colaborador */
	foreign key (numero_matricula)
	REFERENCES colaborador (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamento ADD CONSTRAINT CE_DEPARTAMENTO_COLABORADOR /* fk departamento colaborador*/
	foreign key (chefe)
	REFERENCES colaborador (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE dependente ADD CONSTRAINT CE_DEPENDENTE_COLABORADOR /*fk departamento superior*/
	foreign key (matricula_colaborador)
	REFERENCES colaborador (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION;