
use EMPRESA

SELECT * FROM DEPARTAMENTO
SELECT * FROM DEPENDENTE
SELECT * FROM FUNCIONARIO
SELECT * FROM PROJETO
SELECT * FROM LOCALIZACAO_DEP
SELECT * FROM TRABALHA_EM

------------------------------------------------------------------------------------
-- calcula a idade de um funcionario
declare @idade int,
		@nascimento date,
		@hoje date

set @nascimento = (select Datanasc from FUNCIONARIO where Pnome = 'Pedro')
set @hoje = getdate()
set @idade = year(@hoje) - year(@nascimento)
select @idade
------------------------------------------------------------------------------------


-- CAST
select 
	'o funcionario '
	+ Pnome
	+ ' tem o salário de: R$'
	+ cast(Salario as varchar(10)) as 'nome e salario dos funcionarios'
from
	FUNCIONARIO
------------------------------------------------------------------------------------


-- CONVERT SALARIO PARA STRING
select 
	'o funcionario '
	+ Pnome
	+ ' tem o salário de: R$'
	+ convert(varchar(10), Salario) as 'nome e salario dos funcionarios'
from
	FUNCIONARIO
------------------------------------------------------------------------------------


-- CONVERT FORMATO DATA
select 
	'o funcionario '
	+ Pnome
	+ ' nasceu em '
	+ convert(nvarchar(10), Datanasc, 109) as 'nome e nascimento dos funcionarios'
from
	FUNCIONARIO
------------------------------------------------------------------------------------


-- CONVERT formato data de nascimento usando variaveis
declare @date date;
set @date = (select Datanasc from FUNCIONARIO where Pnome = 'Jennifer')
print convert(nvarchar(10), @date, 103)
------------------------------------------------------------------------------------

