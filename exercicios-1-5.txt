

use EMPRESA

-- somar salario total
declare @salarioBase decimal(10,2),
		@bonus decimal(10,2),
		@salarioTotal decimal(10,2)

set @salarioBase = 5000.00
set @bonus = 800.00
set @salarioTotal = (@salarioBase + @bonus)

select @salarioTotal


-----

-- converte int para decimal e vice versa
declare @n1 int,
		@n2 decimal(10,2)

set @n1 = 5
set @n2 = 7.4

select cast(@n1 as decimal(10,2))
select cast(@n2 as int)


---

-- converte data em string para data formal com date 103
declare @dataNascimento varchar(10)
set @dataNascimento = '15/08/1990'

select convert(date, @dataNascimento, 103)


---

-- verifica nota final de aluno
declare @notaFinal decimal(10,2)
set @notaFinal = 91

if @notaFinal >= 90.0
	begin
		select 'Aprovado com excelência'
	end
else if @notaFinal >= 70.0 and @notaFinal <90.0
	begin
		select 'Aprovado'
	end
else if @notaFinal >= 50.0 and @notaFinal < 70.0
	begin
		select 'Em recuperação'
	end
else if @notaFinal < 50.0
	begin
		select 'Reprovado'
	end


----

--- loop ate 10 usando while
declare @contador int
set @contador = 0

while @contador <= 10
	begin
		select @contador
		set @contador = @contador + 1
	end

----


-- incrementa numero dobrando a cada iteração
declare @numero int
set @numero = 2

while @numero <= 1024
	begin
		select @numero
		set @numero = @numero * 2
	end