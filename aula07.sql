use [EMPRESA]
go

-- função
alter FUNCTION fn_Dobro(@Numero INT)
RETURNS decimal(10,2)
AS
BEGIN
	RETURN @Numero * 2
END
go

-- chama função
select dbo.fn_Dobro(10) as resultado;
go

--- retorna dobro do salario
select 
	f.Pnome,
	f.Unome,
	f.Salario as 'Salario atual',
	dbo.fn_Dobro(f.Salario) as 'Dobro'
from
	funcionario as f
go
------


--- cria função que calcula idade a partir da data de nascimento como parametro
create function fn_calculaIdade(@nascimento date)
	returns int
	as
	begin
		declare @idade int,
				@hoje date

		set @hoje = getdate()
		set @idade = datediff(year, @nascimento, @hoje)

		if (month(@nascimento) > month(getdate())
			or (month(@nascimento) = month(getdate())
				and day(@nascimento) > day(getdate())))
				set @idade = @idade - 1
		return @idade
	end
go


-- chama funcao que calcula idade
select 
	f.Pnome as nome,
	f.Unome as sobrenome,
	convert(varchar, f.Datanasc, 103) as nascimento,
	dbo.fn_calculaIdade(f.Datanasc) as idade
from	
	FUNCIONARIO as f
order by
		idade asc
go


-- funcao que retorna os funcionarios de um certo departamento passando o nome do DP como parametro
create or alter function fn_Nome(@nomeDp varchar(10))
	returns table
	as
	return
	(
		select 
			f.Pnome as nome, 
			f.Unome as sobrenome,
			d.Dnome as departamento
		from 
			FUNCIONARIO as f
			inner join DEPARTAMENTO as d on f.Dnr = d.Dnumero
		where
			d.Dnome = @nomeDp
	);
go

--- chama função que retorna tabela
select * from dbo.fn_Nome('Pesquisa')
go
 

 --- função que cria uma tabela em memoria com dados e retorna a propria
 create function fn_infos()
	returns @tabela table
	(
		nomeCompleto nvarchar(40),
		salarioAnual decimal(10,2),
		ferias decimal(10,2),
		decimoTerceiro decimal(10,2)
	)
	as
	begin
		insert into @tabela (nomeCompleto, salarioAnual, ferias, decimoTerceiro)
					values  ('Leonardo Jorge', 2500.00, 200.00, 1250.00),
							('Anderson Caralho', 3000.00, 300.00, 1500.00),
							('Messias', 4000.00, 400.00, 2000.00),
							('Luiz felipao', 800.00, 150.00, 50.00)
		return;
	end
go

--- chama a funcao que retorna uma tabela
	select * from fn_infos()
	go


----

-- função que calcula salario anual com bonus
create or alter function fn_salarioAnual(@salario decimal(10,2), @bonus decimal(5,2))
	returns decimal(10,2)
	as 
	begin
		declare @salarioAnual decimal(10,2)
		set @salarioAnual = (@salario * 12) * (1 + @bonus / 100)
		return @salarioAnual;
	end
	go


	--- chama função acima
	select
		Pnome,
		Unome,
		Salario,
		dbo.fn_salarioAnual(Salario, 10.0) as salarioAnualComBonus
	from
		FUNCIONARIO