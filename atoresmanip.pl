menu:-
    consult('atores.pl'),
    repeat,
    write('1. listar atores'),nl,
    write('2. adicionar ator'),nl,
    write('3. remover ator'),nl,
    write('4. verificar quantidade de filmes'),nl,
    write('5. sair'),nl,
    read(Op),
    ( Op = 5, write('Fim'),nl,!;verifica(Op)), fail.


%verifica(end_of_file):-!.
verifica(1):-
   see('atores.pl'),
   listing(ator),nl,
   seen.

verifica(2):-
   tell('atores.pl'),
   write('Nome: '), nl, read(Nome),
   write('Filme: '), nl, read(Filme),
   write('Data: '), nl, read(Data),
   write('Rank: '), nl, read(Rank),
   assertz(ator(Nome,Filme,Data,Rank)),
   told.

verifica(3):-
   tell('atores.pl'),
   write('Nome do ator para remover: '),nl,read(Ator),
   retract(ator(Ator,_,_,_)),
   told.

verifica(4):-
   write('Ator: '),read(At),nl,
   write('Quantidade de filmes: '),
   count(At,ator(At,_,_,_),Q),
   write(Q),nl.

quantidade(N,Q):-
   see('atores.pl'),
   Q>1,
   Q is Q1+1,
   ator(N,_,_,_),
   quantidade(N,Q1),
   seen.

count(_,[],0).
count(Ator,X:Y, Q):-
    (Ator == X)-> count(Ator, Y,Q+1),
    (Ator =\= X)-> count(Ator, Y, Q).



le_atomo(A):-
    le_str(String),

