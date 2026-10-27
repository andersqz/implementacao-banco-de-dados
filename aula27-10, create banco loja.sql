use loja

create database LOJA;
go


create table CATEGORIA (
	IdCategoria int identity(100,1) not null primary key,
	Nome varchar(60) not null unique
);

create table FORNECEDOR (
	IdFornecedor int identity(100,1) not null primary key,
	Nome varchar(60) not null,
	Telefone VARCHAR(20) NULL
);
GO

create table PRODUTO (
	IdProduto int primary key not null,
	Nome varchar(80) not null,
	Preco decimal(10,2) not null,
	Quantidade int not null default 0,
	Situacao varchar(10) not null constraint df_prod_situacao default 'ATIVO',
	IdCategoria int not null,
	IdFornecedor int null,

	constraint ck_prod_preco check (Preco > 0),
	constraint ck_prod_qtd check (Quantidade >= 0),
	constraint ck_prod_situacao check (Situacao IN ('ATIVO', 'INATIVO')),

	constraint fk_produto_categoria
		foreign key(IdCategoria)
			references CATEGORIA(IdCategoria)
				on delete cascade  
				on update cascade
);

-- Exemplo de incluir restrição posterior, depois da criação da tabela
alter table PRODUTO
add constraint fk_produto_fornecedor 
	foreign key(IdFornecedor)
		references FORNECEDOR(IdFornecedor)
			on delete set null
			on update cascade
go


insert into CATEGORIA (Nome) values 
	('Informatica'),
	('Papelaria'),
	('Acessorios');
go


insert into FORNECEDOR (Nome, Telefone) values
	('Amazon', '5555-1111'),
	('Moura', null);
go



insert into PRODUTO 
	(IdProduto, Nome, Preco, Quantidade, Situacao, IdCategoria, IdFornecedor) 
values
	(1001, 'Mouse sem fio', 249.99, 15, 'ATIVO', 1, 100),
	(1002, 'Teclado', 419.80, 10, 'ATIVO', 1, 100),
	(1003, 'Caderno', 25.00, 100, 'ATIVO', 2, 100),
	(1004, 'Caneta', 2.50, 500, 'ATIVO', 2, 100),
	(1005, 'Bateria M60GD', 392.97,5, 'ATIVO', 3, 101)
go

insert into PRODUTO (IdProduto, Nome, Preco, IdCategoria)
values (1006, 'nobreak', 300, 3)

select * from CATEGORIA
SELECT * FROM FORNECEDOR
select * from produto


-- on update cascade (apenas copiando do professor, pq deixei categoria como identity)
update categoria set IdCategoria = 99 where IdCategoria = 3

-- on delete set null
delete from FORNECEDOR where IdFornecedor = 100

-- on delete cascade
delete from CATEGORIA where IdCategoria = 2