use loja


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

select * from categoria

-- adiciona select e insert pro usuario juca na tabela produto
grant select, insert on [dbo].[PRODUTO] to Juca;


-- proibe o usuario juca de insert na tabela produto
deny insert on [dbo].[PRODUTO] to Juca;


-- revoke remove a restrição grant ou deny do usuario, Juca pode fazer insert novamente que foi feito o deny acima
revoke insert on [dbo].[PRODUTO] to Juca;



--Query para retonar as permissões que são dadas a nível de objetos
SELECT	state_desc, prmsn.permission_name as [Permission], sp.type_desc, sp.name,
		grantor_principal.name AS [Grantor], grantee_principal.name as [Grantee]
FROM sys.all_objects AS sp
	INNER JOIN sys.database_permissions AS prmsn 
	ON prmsn.major_id = sp.object_id AND prmsn.minor_id=0 AND prmsn.class = 1
	INNER JOIN sys.database_principals AS grantor_principal
	ON grantor_principal.principal_id = prmsn.grantor_principal_id
	INNER JOIN sys.database_principals AS grantee_principal 
	ON grantee_principal.principal_id = prmsn.grantee_principal_id
WHERE grantee_principal.name = 'Juca'