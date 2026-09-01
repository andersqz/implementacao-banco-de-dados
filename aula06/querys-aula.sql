
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



