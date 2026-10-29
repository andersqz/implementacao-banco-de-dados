use BIBLIOTEca;





--exercicio 7
-- crie um trigger que calcule automaticamente o  numero total de 
--- livros escritos por um autor na tabela autor sempre que um novo livro e associado a esse autor na tabela
go
create or alter trigger trg_conta_livros
on LivroAutor
for insert
as 
begin
	declare @idAutor int, @qtd_livros int, @nome varchar(100);
	select @idAutor = i.fk_autor
	from inserted as i

	select @qtd_livros = count(fk_autor)
	from LivroAutor
	where fk_autor = @idAutor;

	select @nome = a.nome
	from Autor as a
	where a.id = @idAutor

	print 'o autor ' + @nome + ' escreveu: ' +  cast(@qtd_livros as varchar(10));

	select * from Livro as l
	join LivroAutor as la on l.isbn = la.fk_livro
	join Autor as a on la.fk_autor = a.id
	where a.id = @idAutor
end;
insert into Livro 
values ('666', 'Ocapeta 2026', 2026, 1, 2);
insert into LivroAutor values (1, '666');
go




-- exercicio 1
-- crie um trigger que impeça a inserção de livros com o mesmo titulo na tabela livro

create or alter trigger trg_valida_titulo_livro
on Livro
after insert
as
begin
	
	if exists (select 1 from Livro as L inner join inserted I on  L.titulo = i.titulo and L.isbn <> I.isbn)

	print 'Não pode inserir livros com o mesmo titulo'

	begin
		rollback tran
	end
end
go

go


-- exercicio 2
-- crie um trigger que atualize automaticamente o ano de publicação na tabela Livro para o ano atual quando um novo livro
-- é inserido
create or alter trigger trg_atualiza_ano_livro
on Livro
after insert
as
begin
	
	update Livro 
	set ano = year(getdate()) 
	where isbn in (select isbn from inserted);

end
go
select * from Livro
insert into Livro values ('54125633', 'livro teste', 2000, 1, 2);
go


-- exercicio 3
-- crie uma trigger que exclua automaticamente registros da table LivroAutor, quando um livro
-- correspondente é excluido da tabela Livro
create or alter trigger trg_deleta_livro_autor
on Livro
instead of delete
as
begin

	delete from LivroAutor
	where fk_livro in (select isbn from deleted);

	delete from Livro
	where isbn in (select isbn from deleted)

	print 'registro deletado da tabela LivroAutor tambem'

end
delete from Livro where isbn = '9788581742458'
GO


-- exercicio 5
-- crie uma trigger que restrinja a esclusão de uma categoria, caso haja livros relacionados a ela
go
create or alter trigger trg_cancela_delete_categoria
on Categoria
instead of delete
as
begin

	if exists (select 1 from Livro as l inner join deleted as d on d.id = l.fk_categoria)
	begin
	print 'nao pode excluir categoria que ja tenha livros associados'
		rollback tran
	end

	else
	begin
		delete from Categoria where id in (select id from deleted)
	end

end
go
select * from livro
select * from categoria

delete from categoria where id = 2

go
