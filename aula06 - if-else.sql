
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