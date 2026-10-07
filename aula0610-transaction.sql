use FACULDADE_2

CREATE TABLE CONTA(
	id INT PRIMARY KEY,
	Nome VARCHAR(50),
	Saldo DECIMAL(10,2)
)

INSERT INTO CONTA
VALUES
(10,'Joao',50000),
(20,'Maria',500)


select * from conta



Consulta 1:

BEGIN TRANSACTION
INSERT INTO DISCIPLINA
VALUES('SIG0217', 'Ola transaction', 4, 'SI')
SELECT * FROM DISCIPLINA;
ROLLBACK TRANSACTION

SELECT * FROM DISCIPLINA;

Consulta 2:

USE FACULDADE_2;

BEGIN TRANSACTION;

DECLARE @nome VARCHAR(100);
SET @nome = 'Banco de Dados I';

IF EXISTS (
    SELECT 1 
    FROM DISCIPLINA 
    WHERE Nome_disciplina = @nome
)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT('Não foi possível registrar a disciplina. Já existe uma disciplina com esse nome!');
END
ELSE
BEGIN
    INSERT INTO DISCIPLINA
    VALUES ('SIG0217', @nome, 4, 'SI');

    COMMIT TRANSACTION;

    PRINT('Disciplina inserida com sucesso!');
END

Consulta 3:
USE FACULDADE_2;

BEGIN TRANSACTION;

DECLARE @nome VARCHAR(100);
SET @nome = 'Projeto de Software';

IF EXISTS (
    SELECT 1 
    FROM DISCIPLINA 
    WHERE Nome_disciplina = @nome
)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT('Não foi possível registrar a disciplina. Já existe uma disciplina com esse nome!');
END
ELSE
BEGIN
    INSERT INTO DISCIPLINA
    VALUES ('SIG0217', @nome, 4, 'SI');

    COMMIT TRANSACTION;

    PRINT('Disciplina inserida com sucesso!');
	SELECT * FROM DISCIPLINA
END



go
-- exemplo 1 feito pelo professor 
create procedure usp_transferencias
	@origem int,
	@destino int,
	@valor decimal(10, 2)
as
begin
	begin transaction
		if ((select Saldo from conta where id = @origem) >= @valor)
			begin
				update conta set Saldo = Saldo - @valor where id = @origem
				update conta set Saldo = Saldo + @valor where id = @destino
				print 'saldo atualizado com sucesso!'
				commit transaction
			end
		else
			begin
				print 'saldo insuficiente'
				rollback transaction
			end
end
go
exec usp_transferencias 20, 10, 200.00





go
-- exemplo 2 feito pelo professor
begin transaction
update conta set saldo = saldo + 1000 where nome = 'Maria'
if (@@ROWCOUNT > 1)
	rollback transaction
else
	commit tran
go


-- SAVE POINT
begin tran

insert into conta values (150, 'Pedro', 550.00);
save tran insertOK

update conta set saldo = 500 where nome = 'Maria'
if @@rowcount  > 1
begin
	rollback tran insertOK
	commit tran
end
else
	commit tran

select * from conta

------------------------------------

begin try 
	print 'ola mundo try catch'
	select 1/0
	print 'nao cheguei aqui'
end try
begin catch
	print 'deu erro'
end catch



begin tran 
begin try
	insert into conta values (50, 'Paulo', 550.00);
	insert into conta values (60, 'Jose', 550.00);
	insert into conta values (70, 'Mateus', 550.00);
	insert into conta values (10, 'Judas', 500000.00);
	commit tran
end try
begin catch
	rollback tran
	print 'Numero: ' + cast(ERROR_NUMBER() AS VARCHAR(10)) 
	print 'Numero: ' + ERROR_MESSAGE()
end catch


SELECT * FROM CONTA

