
use empresa



--- use se o salario da jennifer esta acima ou abaixo da media
declare @salarioJennifer decimal(10, 3),
		@media decimal(10, 3)

set @media = (select avg(Salario) as media from FUNCIONARIO)
set @salarioJennifer = (select Salario from FUNCIONARIO where Pnome = 'Jennifer')

if (@salarioJennifer < @media)
	begin
		print 'media: ' + cast(@media as varchar(10))
		print 'salario da jennifer: ' + cast(@salarioJennifer as varchar(10))
		print 'o salario esta abaixo da media'
	end
else
	begin	
		print 'media: ' + cast(@media as varchar(10))
		print 'salario da jennifer: ' + cast(@salarioJennifer as varchar(10))
		print 'o salario esta acima da media'
	end
----------------------------------------------------------------------------------------


-- verifica alguma coisa
declare @data_nascimento date,
		@idade int,
		@dia_nascimento int,
		@hoje int,
		@mes_nascimento int,
		@mes int

set @data_nascimento = (select Datanasc from FUNCIONARIO where Pnome = 'Pedro')
set @mes_nascimento = month(@data_nascimento)
set @mes = month(getdate())
set @dia_nascimento = day(@data_nascimento)
set @hoje = day(getdate())

if (@mes_nascimento > @mes or (@mes_nascimento = @mes and @dia_nascimento > @hoje))
	set @idade = datediff(year, YEAR(@data_nascimento), year(getdate())) - 1
else
	set @idade = datediff(year, YEAR(@data_nascimento), year(getdate()))
----------------------------------------------------------------------------------------
		
