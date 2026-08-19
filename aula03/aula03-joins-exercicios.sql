use EMPRESA

-- exercicio 1 do slide
select 
	f.Pnome as Nome, f.Unome as UltimoNome, f.Endereco 
from 
	FUNCIONARIO as f
inner join DEPARTAMENTO as d on f.Dnr = d.Dnumero
where 
	d.Dnome = 'Pesquisa'


-- exercicio 2 slide
select 
	f.Pnome
from 
	FUNCIONARIO as f
inner join TRABALHA_EM as te on te.Fcpf = f.Cpf
inner join PROJETO as p on te.Pnr = p.Projnumero
where
	p.Projnome = 'ProdutoX'


-- exercicio 3 slide
select 
	p.Projnumero as NumeroProjeto, p.Dnum as NumeroDepartamento, f.Unome as Sobrenome, f.Endereco as Endereco, f.Datanasc as Nascimento
from 
	PROJETO as p
inner join LOCALIZACAO_DEP as ld on ld.Dlocal = p.Projlocal
inner join DEPARTAMENTO as d on p.Dnum = d.Dnumero
inner join FUNCIONARIO as f on f.Cpf = d.Cpf_gerente
where
	p.Projlocal = 'Mauá'


-- exercicio 4 slide
select 
	f.Unome as UltimoNomeFuncionario, s.Unome as UltimoNomeGerente
from FUNCIONARIO as f
left join FUNCIONARIO as s on f.Cpf = s.Cpf


-- exercicio 5 slide
select 
	d.Dnome, f.Pnome
from 
	DEPARTAMENTO as d
left join FUNCIONARIO as f on d.Dnumero = f.Dnr
where 
	f.Cpf is null;


-- exercicio 6 slide
select 
	f.Pnome, d.Dnome
from
	FUNCIONARIO as f
left join DEPARTAMENTO as d on f.Dnr = d.Dnumero
where
	f.Dnr is null


-- exercicio 7 slide
select 
	f.Pnome, d.Dnome
from 
	FUNCIONARIO as f
right join DEPARTAMENTO as d on f.Dnr = d.Dnumero
where
	f.Dnr is null


-- exercicio 7 slide
select 
	*
from
	FUNCIONARIO
cross join DEPARTAMENTO


-- exercicio 8 slide
select 
    f1.Pnome as Funcionario, f2.Pnome as Supervisor
from
	FUNCIONARIO as f1
INNER JOIN FUNCIONARIO as f2 on f1.Cpf_supervisor = f2.Cpf;


-- exercicio 9 slide
select 
	f.Pnome as NomeFuncionario, f.Sexo as Sexo, f.Datanasc as Nascimento
from 
	FUNCIONARIO as f
union
select 
	d.Nome_dependente as NomeDependente, d.Sexo as Sexo, d.Datanasc as Nascimento
from
	DEPENDENTE as d


-- exercicio 10 slide
select 
	p.Projlocal as 'cidade'
from 
	PROJETO as p
union all 
select 
	l.Dlocal
from 
	LOCALIZACAO_DEP as l


-- exercicio 11 slide
select
	f.Pnome as Nome, f.Unome as Sobrenome, f.Cpf
from 
	FUNCIONARIO as f
where 
	f.Cpf in (select f.cpf from FUNCIONARIO as f except select dp.Cpf_gerente from DEPARTAMENTO as dp)


-- exercicio 12
select 
	f.Pnome, f.Unome, f.Cpf
from
	FUNCIONARIO as f
where f.cpf in (select f.Cpf from FUNCIONARIO as f except select f.Cpf_supervisor from FUNCIONARIO as f)


-- exercicio 13 slide
select 
	f.Cpf
from 
	FUNCIONARIO as f
intersect
select 
	dp.Cpf_gerente
from
	DEPARTAMENTO as dp


-- exercicio 14 slide
select
	D.Dnome as nomeDP, count(f.Cpf) as qtdFuncionariosPorDP
from 
	FUNCIONARIO as f
right join DEPARTAMENTO as d on f.Dnr = d.Dnumero
group by
	d.Dnome

-- exercicio 15 slide
select 
	d.Dnome as nomeDP, Sum(f.Salario) as somaTdsSalarios
from 
	FUNCIONARIO as f
right join DEPARTAMENTO as d on f.Dnr = d.Dnumero
group by
	d.Dnome

-- exercicio 16 slide
select
	p.Projnome as nomeProjeto, avg(te.Horas) as mediaHorasPorProjeto
from 
	PROJETO as p
join TRABALHA_EM as te on te.Pnr = p.Projnumero
group by
	p.Projnome


-- exercicio 17 slide
select 
	f.Sexo as sexo, count(f.Sexo) as qtdPerSexo
from 
	FUNCIONARIO as f
group by
	f.Sexo

-- exercicio 18 slide
select 
	d.Dnome as nomeDP, max(f.salario) as MaiorSalario
from 
	FUNCIONARIO as f
right join DEPARTAMENTO as d on f.Dnr = d.Dnumero
group by
	d.Dnome
	
-- exercicio 19 slide
select 
	p.Projlocal as nome, count(p.Projlocal) as qtdProjetoPorLocal
from
	PROJETO as p
group by
	p.Projlocal, p.Projlocal
	
-- exercicio 20 slide
select 
	d.Dnome as nomeDp, count(f.Pnome) as qtdFuncionariosPorDp
from
	FUNCIONARIO as f
join DEPARTAMENTO as d on f.Dnr = d.Dnumero
group by
	d.Dnome
having count(f.Pnome) >= 3


-- exercicio 21 slide
select
	Pnr, sum(Horas) as totalHoras
from 
	TRABALHA_EM 
group by
	Pnr
having
	sum(Horas) > 100

