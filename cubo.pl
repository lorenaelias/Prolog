cubo:-
    write('Próximo valor: '),
    read(X),
    processa(X).

processa(fim):-!.
processa(N):-
    C is N*N*N,
    write('O cubo de '), write(N),write(' é: '), write(C),
    nl, cubo.



