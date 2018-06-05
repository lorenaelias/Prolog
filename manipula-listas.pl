%01.-----------------------------------------------------------

n_esimo_cc(1,A1,_,A1).
n_esimo_cc(N,A1,R,AN):-
    N>1,
    A2 is A1 + R,
    N1 is N-1,
    n_esimo_cc(N1,A2,R,AN).

n_esimo_pa(1,A1,_,A1).
n_esimo_pa(N,A1,R,AN):-
    N1 is N-1,
    n_esimo_pa(N1,A1,R,AN1),
    AN is R+AN1.

%02.-----------------------------------------------------------

soma_pa_cc(N, A1, R, ANS):-
    n_esimo_cc(N,A1,R,AN),
    ANS is ((A1+AN)*N)/2,!.

soma_pa(1,A1,_,A1).
soma_pa(N,A1,R,ANS):-
    N > 1,
    n_esimo(N,A1,R,AN),
    N1 is N - 1,
    soma_pa(N1,A1,R,ANS1),
    ANS is AN + ANS1,!.

%03. ----------------------------------------------------------

%	1. X = a.
%	2. X = [ ].
%	3. false.
%	4. X = [a].
%	5. false.
%	6. X = a,
%          Y = b.
%	7. false.
%	8. X = a,
%	   Y = b,
%	   Z = c.
%	9. false.
%	10. X = a,
%	    Y = b.
%	11. X = a,
%	    Y = [ ].
%	12. false.
%	13. X = a,
%	    Y = [b,c].
%	14. X = a,
%	    Y = b,
%	    Z = [c].
%	15. X = a,
%	    Y = b,
%	    Z = [ ].
%	16. false.
%	17. X = a,
%	    Y = b,
%	    Z = [c,d].
%	18. X = a,
%	    Y = b,
%	    Z = [a].
%	19. X = Z, 
%	    Z = [a],
%	    Y = b.

%04. ----------------------------------------------------------

n_esimo(1,E,[E|_]).
n_esimo(N,E,[_|Y]):-
    N>1,
    N1 is N-1,
    n_esimo(N1,E,Y),!.
    
%05.-----------------------------------------------------------

no_elementos([],0).
no_elementos([_|L],N) :-
	no_elementos(L,N1),
	N is N1+1.

%06.07.-------------------------------------------------------

tire_elemento(X,[X|Y],Y).
tire_elemento(X,[Y|C],[Y|D]):-
	X\=Y,
	tire_elemento(X,C,D).

%08.09.--------------------------------------------------------

remove_ocor([],_,[]).
remove_ocor([X|Y],X,R):-
	remove_ocor(Y,X,R).
remove_ocor([X|Y],Z,R):-
	X\=Z,
	remove_ocor(Y,Z,R1),
	R = [X|R1].

insere1(R,X,[X|R]).

%10.-----------------------------------------------------------

elimina_rep([],[]).
elimina_rep([X|Y],L):-
    elimina_rep(Y,L2),
    remove_ocor(L2,X,L1),
    inserir_cabeca(L1,X,L).

%11.-----------------------------------------------------------

concat1([],A,A).
concat1([X|Y],L,[X|R]):-
    concat1(Y,L,R).

%12.-----------------------------------------------------------

maior([X],X).
maior([X|[Y|Z]],L):-
    (X>Y),
    maior([X|Z],L).

maior([X|[Y|Z]],L):-
    (Y>=X),
    maior([Y|Z],L).

%13.-----------------------------------------------------------

menor([X],X).
menor([X|[Y|Z]],L):-
    (X<Y),
    menor([X|Z],L).

menor([X|[Y|Z]],L):-
    (X>=Y),
    menor([Y|Z],L).

%14.------------------------------------------------------------

posicao(1,[X|_],X).
posicao(N,[_|Y],R):-
    N1 is N-1,
    posicao(N1,Y,R).


ex14([],_,[]).
ex14([X|Y],[Z|W],R):-
    ex14(Y,[Z|W],R1),
    posicao(X,[Z|W],Elem),
    insere1(R1,Elem,R).

%15.------------------------------------------------------------

inserir_cabeca(R,X,[X|R]).

%16.------------------------------------------------------------

inseren(X,1,A,[A|X]).
inseren([X|Y],N,A,R):-
    N1 is N-1,
    inseren(Y,N1,A,R1),
    inserir_cabeca(R1,X,R).

%17.-----------------------------------------------------------

inverter([],[]).
inverter([X|Y],R):-
    inverter(Y,R1),
    append(R1,[X],R).

%18.----------------------------------------------------------

substitui(A,B,[A|Y],[B|Y]).
substitui(A,B,[X|Y],R):-
    substitui(A,B,Y,R1),
    insere1(R1,X,R).

%19.----------------------------------------------------------

%concat1([],A,A).
%concat1([X|Y],L,[X|R]):-
 %   concat1(Y,L,R).
aux(_,0,[]).
aux(X,Y,[X|R1]):-
	Y1 is Y-1,
	Y>0,
	aux(X,Y1,R1).

nplica(_,[],[]).
nplica(N,[X|Y],R):-
	nplica(N,Y,R2),
	aux(X,N,R1),
	concat1(R1,R2,R).

%%%% OU %%%%

duplica([],[]).
duplica([X|Y],R):-
	duplica(Y,Y1),
	X1 is X*2,
	R = [X1|Y1].

%20.----------------------------------------------------------

%%dando o elemento
ex20(A,[X|Y],R):-
    B is 2*A,
    substitui(A,B,[X|Y],R).

%% dando a posição
ex20_2(1,[X|Y],[A|Y]):-
    A is 2*X.
ex20_2(N,[X|Y],R):-
    N1 is N-1,
    ex20_2(N1,Y,R1),
    insere1(R1,X,R).

%21.----------------------------------------------------------

nao_vazia([X|Y],[Z|W]):-
    not(disjuntos([X|Y],[Z|W])).

%22.----------------------------------------------------------

uniao_completo(A, B, R):-
    uni(A, B, R1),
    elimina_rep(R1, R).

uni([],L, L).
uni([X|Y], L, R):-
    not(pertence(L, X)),
    uni(Y, [X|L], R).

uni([X|Y], L, R):-
    pertence(L,X),
    uni(Y, L, R).

%23.----------------------------------------------------------

disjuntos(_,[]).
disjuntos([],_).
disjuntos([X|Y],[Z|W]):-
    disjuntos(Y,[Z|W]),
    not(pertence([Z|W],X)).

pertence([X|_],Z):-
	Z=X,!.
pertence([_|Y],Z):-
	pertence(Y,Z).

%24.----------------------------------------------------------

igual([X],[X]):-
	!.
igual([X|Y],[X|Z]):-
igual(Y,Z).
