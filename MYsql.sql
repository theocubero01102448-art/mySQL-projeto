create database if not exists sistema_hospitalar;
use sistema_hospitalar;
create table especialidades (
id int auto_increment primary key,
nome varchar(100) not null,
descricao varchar(255)
);
create table hospitais (
id int auto_increment primary key,
nome varchar(150) not null,
cidade varchar(100),
estado char(2),
tipo varchar(30),
capacidade_de_leitos int,
telefone varchar(20)
);
create table convenios (
id int auto_increment primary key,
nome varchar(100) not null,
tipo varchar(50),
cobertura_percentual int,
telefone varchar(20)
);
create table medicos (
id int auto_increment primary key,
nome varchar(100) not null,
crm varchar(20) not null,
especialidade_id int,
hospital_id int,
telefone varchar(20),
email varchar(100),
salario decimal(10,2),
data_contratacao date,
sexo char(1)
);
create table pacientes (
id int auto_increment primary key,
nome varchar(150) not null,
cpf varchar(20) not null unique,
data_nascimento date,
sexo char(1),
telefone varchar(20),
endereco varchar(200),
cidade varchar(100),
estado char(2),
email varchar(100),
tipo_sanguinio char(3),
convenio_id int,
data_cadastro date
);
create table medicamentos (
id int auto_increment primary key,
nome varchar(150) not null,
principio_ativo varchar(100),
fabricante varchar(100),
tipo varchar(50),
preco decimal(8,2),
controlado tinyint(1)
);
create table consultas (
id int auto_increment primary key,
paciente_id int not null,
medico_id int not null,
hospital_id int,
convenio_id int,
data_consulta date,
hora_consulta time,
tipo_consulta varchar(40),
status varchar(20),
valor decimal(8,2)
);
create table exames (
id int auto_increment primary key,
paciente_id int not null,
data_exame date,
resultado varchar(30),
valor decimal(8,2),
status varchar(20)
);
create table prescricoes (
id int auto_increment primary key,
consulta_id int not null,
medicamento_id int not null,
dosagem varchar(50),
frequencia varchar(50),
duracao_dias int
);
create table internacoes (
id int auto_increment primary key,
paciente_id int not null,
medico_id int,
hospital_id int,
data_entrada date,
data_saida date,
motivo varchar(100),
quarto varchar(10),
valor_diaria decimal(8,2),
status varchar(20)
);