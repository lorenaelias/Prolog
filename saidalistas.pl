escreveLista([]).
escreveLista([L| L1]):-
    imprime(L),nl,escreveLista(L1).

imprime([]).
imprime([X|L]):-
    write(X),tab(1),imprime(L).

barras([]).
barras([N|L]):-
    quadrinho(N),nl,barras(L).
quadrinho(N):-
    N>0,
    write('@'),
    N1 is N-1,
    quadrinho(N1).
quadrinho(N):-
    N =< 0, !.
