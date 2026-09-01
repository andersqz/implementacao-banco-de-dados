use EMPRESA

--- exemplo 1
declare @novoSalario decimal(10,2)
select 
	@novoSalario = f.Salario * 1.10
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'
select 
	@novoSalario as NovoSalario


-- exemplo 2
declare @idade int
select 
	@idade = datediff(year, f.Datanasc, getdate())
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'
select 
	@idade as Idade



-- exemplo 3
select 
	'A funcionaria ' + f.Pnome + ' ' + f.Unome + ' tem um salario de: ' + cast(f.Salario as varchar(20)) as Info
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'



-- exemplo 4
select 
	'A funcionaria ' + f.Pnome + ' ' + f.Unome + ' tem um salaroio de: ' + convert(varchar(20), f.Salario) as Info
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'


-- exemplo 5
select 
	convert(varchar(10), f.Datanasc, 103) as DataNascimento
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'


-- exercicio 1 slide
declare @salarioFuncionario decimal(10,2), @mediaSalarial decimal(10,2)
select 
	@salarioFuncionario = f.Salario
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'
select 
	@mediaSalarial = avg(f.Salario)
from 
	FUNCIONARIO as f
if @salarioFuncionario < @mediaSalarial
begin
	print 'O funcionário recebe abaixo da media salarial'
end
else
begin
	print 'O funcionário recebe acima ou igual a media salarial'
end



-- exercicio 2 slide
declare @idadeFuncionario int
select 
	@idadeFuncionario = datediff(year, f.Datanasc, getdate())
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432168'

if @idadeFuncionario >= 60
begin
	print 'O funcionario esta proximo ou ja com 60'
end
else
begin
	print 'O funcionario ainda nao esta proximo'
end


-- exercicio 3 slide
declare @bonusFuncionario decimal(10,2), @anoAdmissao int
select 
	@bonusFuncionario = f.Bonus, @anoAdmissao = year(f.Data_Admissao)
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432100'

if @bonusFuncionario > 0 and @anoAdmissao = year(getdate())
begin
	print 'O funcionário ja recebeu este ano'
end
else
begin
	print 'O funcionário nao recebeu este ano'
end


-- exercicio 4 slide
declare @mesesAdmissao int
select 
	@mesesAdmissao = datediff(month, f.Data_Admissao, getdate())
from 
	FUNCIONARIO as f
where 
	f.Cpf = '98765432100'

if @mesesAdmissao <= 6
begin
	print 'O funcionário é um novo contratado'
end
else
begin
	print 'O funcionário nao é um novo contratado'
end


-- exercicio 5 slide
declare @qtdFuncionarios int
select 
	@qtdFuncionarios = count(*)
from 
	FUNCIONARIO as f
where 
	f.Dnr = 5

if @qtdFuncionarios <= 1
begin
	print 'Departamento pequeno'
end
else if @qtdFuncionarios between 2 and 3
begin
	print 'Departamento médio'
end
else
begin
	print 'Departamento grande'
end


-- exercicio 6 slide
while (select f.Salario from FUNCIONARIO as f where f.Cpf = '45345345376') < 30000
begin
	update FUNCIONARIO
	set Salario = Salario * 1.05
	where Cpf = '45345345376'
end
select 
	f.Pnome, f.Salario
from 
	FUNCIONARIO as f
where 
	f.Cpf = '45345345376'