% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

my_last([X],X):- !.
my_last([_|Y],X):-
    my_last(Y,X).

last_but_one([X,_],X):- !.
last_but_one([_,Y|Ys],X) :-
    last_but_one([Y|Ys],X).

element_at(1,[X|_],X):- !.
element_at(N,[_|T],X):-
    N1 is N - 1,
    element_at(N1,T,X).

cont_elem([],0).
cont_elem([_|Y],N):-
    cont_elem(Y,N1),
    N is N1 + 1.


my_reverse(L1,L2):-
    my_rev(L1,L2,[]).

my_rev([],L2,L2).
my_rev([X|Y],L2,ACC):-
    my_rev(Y,L2,[X|ACC]).


palind(X):- my_reverse(X,X).

retira_repet([],[]).
retira_repet([X],[X]).

retira_repet([X,X|Xs],Zs):-
    retira_repet([X|Xs],Zs),!.

retira_repet([X,Y|Ys],[X|Zs]):-
    X \= Y,
    retira_repet([Y|Ys],Zs).


remove_at(X,1,[X|Xs],Xs):-!.
remove_at(X,N,[Y|Xs],[Y|Ys]):-
    N > 1,
    N1 is N -1,
    remove_at(X,N1,Xs,Ys).

insert_at(X,N,L,R):-
    remove_at(X,N,R,L).
