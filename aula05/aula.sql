use Empresa;


-- listar funcionarios que sao gerentes de algum departamento
-- com EXISTS
select 
	f.Pnome as nomeFuncionario, 
	f.Unome as sobrenomeFuncionario 
from 
	funcionario as f
Where 
	 exists (select 1 from DEPARTAMENTO as d where d.Cpf_gerente = f.Cpf)

-- com EXISTS
select f.Pnome as nomeFunc, f.Unome as sobreNomeFunc
from funcionario as f 
inner join departamento as d on d.Cpf_gerente = f.Cpf

------------------------------------------------------------------------------------------------

-- listar departamentos que possuem projetos associados
-- com JOIN
select 
	d.Dnome as NomeDepartamento 
from 
	departamento as d
inner join projeto as p on p.Dnum = d.Dnumero
group by d.Dnome

-- com EXISTS
select d.Dnome as nomeDepartamento
from departamento as d
where exists (select 1 from projeto as p where p.Dnum = d.Dnumero)


--- revisar
-- encontrar funcionários cujo salário seja maior que pelo menos um salário dos funcionários do departamento de Administração
select Pnome, Salario from FUNCIONARIO where salario > any (
select 
	f.Salario as Salario
from
	FUNCIONARIO as f
inner join DEPARTAMENTO as d on d.Dnumero = f.Dnr
where 
	d.Dnome = 'Administração'
)
select
	Pnr, sum(Horas) as totalHoras
from 
	TRABALHA_EM 
group by
	Pnr
having
	sum(Horas) > 100


select 
	sum(te.Horas)
from 
	TRABALHA_EM as te
inner join projeto as p on p.Projnumero = te.Pnr
where p.Projnome = 'Itu'
group by(te.Horas)





select
	Pnr, sum(Horas) as totalHoras
from 
	TRABALHA_EM 
group by
	Pnr
having
	sum(Horas) > 100



SELECT * FROM FUNCIONARIO
select * from projeto
select * from DEPARTAMENTO
select * from TRABALHA_EM

