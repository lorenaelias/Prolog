% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

le_atomo(Atomo) :-
	le_str(String),
	name(Atomo, String).

le_str(String) :-
	get0(Char),
	le_str_aux(Char, String).

le_str_aux(-1, []) :- !. % EOF
le_str_aux(10, []) :- !. % EOL(UNIX)
le_str_aux(13, []) :- !. % EOL (DOS)

le_str_aux(Char, [Char|Resto]) :-
	le_str(Resto).

menu:-
      write('a -  Listar atores'), nl,
      write('b -  Adicionar atores'), nl,
      write('c -  Remover ator'), nl,
      write('d -  sair'), nl,
      exec(Op).

exec(a):-
	['C:/Usuários/Lola/Área de Trabalho/atores.pl'], %% consult('atores.pl'),
	forall(ator(X,_,_,_), writeln(X)),
	go.

exec(b):-
	write('Nome do ator?'),
	le_atomo(Nome),
	write('Nome do filme?'),
	le_atomo(Filme),
	write('Ano de lancamento?'),
	le_atomo(Ano),
	write('Rank imbd ?'),
	le_atomo(Rank),
	assertz(ator(Nome, Filme, Ano, Rank)),
	tell('C:/Users/a11711BCC011/Desktop/atores.pl'),
	listing(ator),
	told,
	go.

exec(c):-
	write('Nome do ator?'),
	le_atomo(Nome),
	forall(ator(Nome, _, _, _), retract(ator(Nome, _, _, _))),
	tell('C:/Users/a11711BCC011/Desktop/atores.pl'),
	listing(ator),
	told,
	go.
