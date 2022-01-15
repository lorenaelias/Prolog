menu:-
    consult('arqtermos.pl'),
    read(Termo),
    acha_termo(Termo),
    write('Termo: '), write(Termo),nl.

acha_termo(Termo):-
    batatao(Termo,_).
