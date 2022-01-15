:-dynamic(pai/2).

menu:-
    consult('dados.pl'),
    repeat,
    nl,
    write('1. listar'),nl,
    write('2. adicionar'),nl,
    write('3. remover'),nl,
    write('4. sair'),nl,
    ler(Op),
    ( Op = 4, write('fim...'),nl,!;executa(Op) ),fail.

verifica(1):-!.
verifica(2):-!.
verifica(3):-!.
verifica(4):-!.

ler(Op):-
    le_atomo(Op),
    verifica(Op),!.
ler(Op):-
    nl,
    write('opção inválida'),nl,
    menu,
    ler(Op).

executa(1):-
    listing(pai/2).
executa(2):-
    nl,
    write('Nome do pai: '),
    le_atomo(P),
    write('Nome do filho: '),
    le_atomo(F),
    assertz(pai(P,F)),
    tell('dados.pl'),
    listing(pai/2),
    told.
executa(3):-
    nl,
    write('Nome do pai: '),
    le_atomo(P),
    write('Nome do filho: '),
    le_atomo(F),
    retract(pai(P,F)),
    tell('dados.pl'),
    listing(pai/2),
    told.

le_atomo(A):-
    le_str(String),
    name(A,String).
le_str(String):-
    get0(Char),
    le_str_aux(Char,String).
le_str_aux(-1,[]):-!.
le_str_aux(10,[]):-!.
le_str_aux(13,[]):-!.
le_str_aux(Char,[Char|Resto]):-
    le_str(Resto).

