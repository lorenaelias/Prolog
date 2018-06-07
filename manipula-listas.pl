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
no_elementos([_|Y],N):-
    no_elementos(Y,N1),
    N is N1 + 1.

%06.07.-------------------------------------------------------

tire_elemento(X,[X|Y],Y).
tire_elemento(X,[Y|C],[Y|D]):-
	X\=Y,
	tire_elemento(X,C,D).

%08.09.--------------------------------------------------------

retirar_ocor(_,[],[]).
retirar_ocor(X,[X|Y],R):-
    retirar_ocor(X,Y,R).
retirar_ocor(X,[Z|Y],R):-
    X\=Z,
    retirar_ocor(X,Y,R1),
    R = [Z|R1],!.

%10.-----------------------------------------------------------

retire_repet([],[]).
retire_repet([X|Y],R):-
    retire_repet(Y,R2),
    retirar_ocor(X,R2,R1),
    inserir_cabeca(X,R1,R),!.

%11.-----------------------------------------------------------

concatenar([],L2,L2).
concatenar([X|Y],L,[X|W]):-
    concatenar(Y,L,W).

%12.-----------------------------------------------------------

maior([X],X).
maior([X|[Y|Z]],M):-
    X>Y,
    maior([X|Z],M).
maior([X|[Y|Z]],M):-
    Y>=X,
    maior([Y|Z],M),!.

%13.-----------------------------------------------------------

menor([X],X).
menor([X|[Y|Z]],M):-
    X<Y,
    menor([X|Z],M).
menor([X|[Y|Z]],M):-
    Y=<X,
    menor([Y|Z],M),!.

%14.------------------------------------------------------------

pegar([],_,[]).
pegar([X|Y],[Z|W],P):-
    pegar(Y,[Z|W],P1),
    posicao(X,[Z|W],ELEM),
    inserir_cabeca(ELEM,P1,P),!.

posicao(1,[X|_],X).
posicao(N,[_|Y],P):-
    N1 is N-1,
    posicao(N1,Y,P).

%15.------------------------------------------------------------

inserir_cabeca(X,L,[X|L]).

%16.------------------------------------------------------------

inserir_N(E,1,L,[E|L]).
inserir_N(E,N,[X|Y],R):-
   N1 is N-1,
   inserir_cabeca(X,R1,R),
   inserir_N(E,N1,Y,R1),!.

%17.-----------------------------------------------------------

inverter([],[]).
inverter([X|Y],R):-
    inverter(Y,R1),
    append(R1,[X],R).

%18.----------------------------------------------------------

substitui(A,B,[A|Y],[B|Y]):-!.
substitui(A,B,[X|Y],R):-
    substitui(A,B,Y,R1),
    inserir_cabeca(X,R1,R),!.

%19.----------------------------------------------------------

duplica_todos([],[]).
duplica_todos([X|Y],R):-
	duplica(Y,Y1),
	X1 is X*2,
        R = [X1|Y1].

%20.----------------------------------------------------------

duplica_um(A,[X|Y],R):-
    B is 2*A,
    substitui(A,B,[X|Y],R).

%21.----------------------------------------------------------

nao_vazia([X|Y],[Z|W]):-
    not(disjuntos([X|Y],[Z|W])).

%22.----------------------------------------------------------

uniao(A,B,U):-
	concatenar(A,B,C),
	retire_repet(C,U).

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

iguais([X],[X]):- !.
iguais([X|Y],[X|Z]):-
	iguais(Y,Z).
