teste:-
    append('out.pl'),
    read(X),
    write(X),write('.'),nl,
    told.

resposta(R):-
    nl,
    write('Insira s ou n'),
    get(Resp), get0(_),
    verifica(Resp,R),!.

resposta(R):-
    write('insira somente s ou n '),
    resposta(R).

verifica(115,s).
verifica(83,s).
verifica(110,n).
verifica(78,n).
