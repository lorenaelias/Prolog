tira(_,[],[]):- !.
tira(X,[X|Y],Y):- !.
tira(X,[Y|Z],[Y|R]):-
     tira(X,Z,R).

maior(X,Y,X):-
     X>=Y.
maior(X,Y,Y).
