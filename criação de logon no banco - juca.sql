USE [master]
GO
CREATE LOGIN [Juca] WITH PASSWORD=N'juca123', DEFAULT_DATABASE=[LOJA], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
use [master];
GO
USE [LOJA]
GO
CREATE USER [Juca] FOR LOGIN [Juca]
GO

---- querys com juca abaixo

select * from produto;
go

delete from produto where IdProduto = 1001
go

insert into produto (IdProduto, Nome, Preco, IdCategoria) values (69, 'dildo', 5, 3)


