use BIBLIOTEca;



select count(fk_autor)
from LivroAutor
where fk_autor = 1


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

