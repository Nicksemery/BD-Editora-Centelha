create database Editora_Centelha;

create table Colaboradores (
	id serial PRIMARY KEY,
    nome varchar(100),
    tipo_colaborador varchar(50),
    CPF varchar(14),
    CNPJ varchar(18),
    id_parceria varchar(50)
);

insert into Colaboradores (nome, tipo_colaborador, CPF, CNPJ, id_parceria) values ('João Pereira', 'entregador', '123.456.789-01', '12.345.678/0001-90', 'ENT-001');
insert into Colaboradores (nome, tipo_colaborador, CPF, CNPJ, id_parceria) values ('Maria Souza', 'fornecedor', '987.654.321-00', '98.765.432/0001-01', 'FOR-001');
insert into Colaboradores (nome, tipo_colaborador, CPF, CNPJ, id_parceria) values ('Carlos Lima', 'escritor', '234.567.890-12', '23.456.789/0001-23', 'ESCR-001');
insert into Colaboradores (nome, tipo_colaborador, CPF, CNPJ, id_parceria) values ('Rogério Oliveira','entregador','831.957.341-86','84.369.752/0001-26','ENT-002');
insert into Colaboradores (nome, tipo_colaborador, CPF, CNPJ, id_parceria) values ('Felipe Castilho','escritor','357.159.628-46','93.846.246/0001-08','ESCR-002');
 
select * from colaboradores 

create table Clientes (
	id serial primary key,
	nome varchar(100),
	email varchar(100),
	endereco varchar(255),
	CPF varchar (14)
);

insert into clientes (nome, email, endereco, CPF) values ('João Pimenta','pimentaJhon@gmail.com','São Paulo - Rua das Flores, 123', '543.846.824-98');
insert into clientes (nome, email, endereco, CPF) values ('Ana Silva', 'anasilva@ig.com.br','Macapá - Avenida General Rondon, 789', '984.546.678-12');
insert into clientes (nome, email, endereco, CPF) values ('Mariana Souza de Lima','marianasouza@hotmail.com','Curitiba - Rua das Palmeiras. 876', '615.841.678-93');
insert into clientes (nome, email, endereco, CPF) values ('Cleber Martins','martinscle@gmail.com','Porto Alegre - Rua dos Três Pinheiros, 318','318.789.954-45');
insert into clientes (nome, email, endereco, CPF) values ('Felipe Almeida', 'lipalma@gmail.com','Manaus - Avenida Mário Cruz, 204','484.654.321-11');

select * from clientes

create table Funcionario(
	id serial primary key,
	CPF varchar (14),
	CNPJ varchar(18),
	nome varchar (100),
	email varchar(100)
);

insert into Funcionario (CPF, CNPJ,nome, email) values ('123.456.789-01', '12.345.678/0001-90', 'Carlos Silva', 'carlos.silva@empresa.com');
insert into funcionario (CPF, CNPJ,nome, email) values ('987.654.321-00', '98.765.432/0001-01', 'Fernanda Costa', 'fernanda.costa@empresa.com');
insert into funcionario (CPF, CNPJ,nome, email) values ('234.567.890-12', '23.456.789/0001-23', 'Marcos Almeida', 'marcos.almeida@empresa.com');
insert into funcionario (CPF, CNPJ,nome, email) values ('345.678.901-23', '34.567.890/0001-34', 'Luana Oliveira', 'luana.oliveira@empresa.com');
insert into funcionario (CPF, CNPJ,nome, email) values ('456.789.012-34', '45.678.901/0001-45', 'Ricardo Souza', 'ricardo.souza@empresa.com');

select * from funcionario

create table Servicos (
	id serial primary key,
	id_Funcionario int references Funcionario(id) on delete cascade,
	tipo_servico varchar (255)
)


insert into servicos (id_funcionario, tipo_servico) values (1,'Revisão ortográfica');
insert into servicos (id_funcionario, tipo_servico) values (2,'Diagramação e Revisão');
insert into servicos (id_funcionario, tipo_servico) values (3,'Ilustração');
insert into servicos (id_funcionario, tipo_servico) values (4,'Catalogação');
insert into servicos (id_funcionario, tipo_servico) values (5,'Publicação');

select * from servicos;

create table Produto (
	id serial primary key,
	ISBN varchar(20),
	titulo varchar (100),
	autor varchar (100),
	id_clientes int references Clientes(id) on delete cascade,
	id_Colaboradores int references Colaboradores(id) on delete cascade,
	id_Funcionario int references Funcionario(id) on delete cascade
);

insert into Produto (ISBN, id_clientes, id_colaboradores, id_funcionario, titulo, autor) values ('978-3-16-148410-0', 1, 1, 1,'Jardins da Lua','Steven Erikson');
insert into Produto (ISBN, id_clientes, id_colaboradores, id_funcionario, titulo, autor) values ('978-1-86197-876-9',2,2,2,'Filhos da Degradação','Felipe Castilho');
insert into Produto (ISBN, id_clientes, id_colaboradores, id_funcionario, titulo, autor) values ('978-0-7432-7356-5',3,3,3,'Neuromancer','William Gibson');
insert into Produto (ISBN, id_clientes, id_colaboradores, id_funcionario, titulo, autor) values ('978-0-307-27729-2',4,4,4,'Fahrenheit 451','Ray Bradbury');
insert into Produto (ISBN, id_clientes, id_colaboradores, id_funcionario, titulo, autor) values ('978-1-59184-643-8',5,5,5,'A Bússola de ouro','Philip Pullman');


select * from produto;

select 
	f.nome,
	f.cnpj,
	f.email,
	s.tipo_servico,
	p.titulo,
	p.isbn
from
	funcionario f 
join
	servicos s on f.id = s.id_funcionario
join
	produto p on f.id = p.id_funcionario 
	
	
select 
	c.nome,
	c.cpf,
	c.endereco,
	p.titulo,
	p.isbn
from
	clientes c 
join
	produto p on c.id = p.id_clientes 
	

