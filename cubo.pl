cubo:-
    write('Pr�ximo valor: '),
    read(X),
    processa(X).

processa(fim):-!.
processa(N):-
    C is N*N*N,
    write('O cubo de '), write(N),write(' �: '), write(C),
    nl, cubo.



