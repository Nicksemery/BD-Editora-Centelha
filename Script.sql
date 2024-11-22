create database Editora_Centelha;

create table Colaboradores (
	id serial primary key,
	entregadores varchar(100),
	fornecedores varchar(100),
	escritores varchar(100)
);



create table Clientes (
	id serial primary key,
	nome varchar(100),
	email varchar(100),
	endereco varchar(100),
	CPF varchar (100)
);

insert into clientes ();


create table Funcionario(
	id serial primary key,
	CPF varchar (100),
	CNPJ varchar(100),
	nome varchar (100),
	email varchar(100)
);

create table Servicos (
	id serial primary key,
	id_Funcionario int references Funcionario(id) on delete cascade,
	diagramacao varchar(100),
	registro varchar (100),
	publicacao varchar(100),
	ilustracao varchar(100),
	catalogacao varchar(100)
)

create table Produto (
	ISBN serial primary key,
	id_clientes int references Clientes(id) on delete cascade,
	id_Colaboradores int references Colaboradores(id) on delete cascade,
	id_Funcionario int references Funcionario(id) on delete cascade,
	titulo varchar (100),
	autor varchar (100)
);

select * from colaboradores 