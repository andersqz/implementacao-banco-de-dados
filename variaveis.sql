use EMPRESA

go
--
declare @Nome VARCHAR(10),
		@Idade INT,
		@Salario DECIMAL(10,2),
		@Data DATETIME,
		@NomeDepartamento4 VARCHAR(40)

set @Nome = 'Juca';
set @Idade = 22;
set @Salario = 2200.056
set @Data = GETUTCDATE();
set @NomeDepartamento4 = (select Dnome from DEPARTAMENTO as d where d.Dnumero = 4)


select @Nome as Nome;
select @Idade as Idade;
select @Salario as Salario;
select @Data as Hoje;

print 'Departamento: ' + @NomeDepartamento4;
--
go

go
-- calculando o novo salario com um aumento de 10% para a jennifer
declare @novoSalario decimal(10,2)
select 
	@novoSalario = f.Salario * 1.10
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'
select 
	@novoSalario as NovoSalario
go



