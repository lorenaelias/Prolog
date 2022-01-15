startwith(A,C):-
    atom_chars(A,[C|_]).


fazFrase(Lista) :-
    get0(C),
    fazResto(C, Lista).

fazResto(46, []) :-
    !.
fazResto(32, Lista) :-
    !,
    fazFrase(Lista).

fazResto(Let, [Pal | Lista]) :-
    fazLetras(Let, Lets, Prox),
    name(Pal, Lets),
    fazResto(Prox, Lista).

fazLetras(46, [], 46) :-
    !.
fazLetras(32, [], 32) :-
    !.
fazLetras(Let, [Let | Lets], Prox) :-
    get0(C),
    fazLetras(C, Lets, Prox).

