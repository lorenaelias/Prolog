inicio :-
        repeat,
	menu,
	read(Resp),
	(Resp = 5, write('Fim...'),nl,!;executa(Resp)),
        fail.

executa(1):-
    nl,
    write('Digite uma opção a seguir'),nl,
    write('1 - Característica que ele possui :'),nl,
    write('2 - Característica que nao ele possui :'),nl,
    read(X),
    novo(X).
executa(2):-
        listing(sim),nl,
        listing(nao).
executa(3):-
        advinha.
executa(4):-
        removeRespostas.


novo(1):-
    write('Digite a evidência :'),nl,
    write('Exemplo : tem_manchas_escuras'),nl,
    read(String),
    assert(sim(String)).
novo(2):-
    write('Digite a evidência :'),nl,
    write('Exemplo : come_carne'),nl,
    read(String),
    assert(nao(String)).


menu:-
	write('Escolha umas das opções a seguir'),nl,
	write('1 - Especificar Evidência'),nl,
	write('2 - Vizualiza Evidência'),nl,
	write('3 - Advinhe'),nl,
	write('4 - Remover Respostas'),nl,
	write('5 - Sair'),nl.


advinha:-
    hipotetiza(Animal),
    write('O animal eh: '),
    write(Animal),nl, nl.


/* hipoteses a serem testadas*/
hipotetiza(leopardo) :- leopardo, !.
hipotetiza(tigre) :- tigre, !.
hipotetiza(girafa) :- girafa, !.
hipotetiza(zebra) :- zebra, !.
hipotetiza(avestruz) :- avestruz, !.
hipotetiza(pinguim) :- pinguim, !.
hipotetiza(albatroz) :- albatroz, !.
hipotetiza(desconhecido). /* nao diagnosticado */

/* regras de identificação do animal */
leopardo :-
	mamifero,
	carnivoro,
	verifica(tem_manchas_escuras).
tigre :-
	mamifero,
	carnivoro,
	verifica(tem_listras_pretas).
girafa :-
	ungulado,
	verifica(tem_pescoco_grande),
	verifica(tem_pernas_grandes).
zebra :-
	ungulado,
	verifica(tem_listras_pretas).
avestruz :-
	passaro,
	verifica(nao_voa),
	verifica(tem_pescoco_grande).
pinguim :-
	passaro,
	verifica(nao_voa),
	verifica(nada),
	verifica(branco_e_preto).
albatroz :-
	passaro,
	verifica(aparece_em_estoria_de_marinheiro),
	verifica(voa).

/* regras de classificação */

mamifero :-
	verifica(tem_pelo), !.
mamifero :-
	verifica(amamenta).
passaro :-
	verifica(tem_penas), !.
passaro :-
	verifica(voa),
	verifica(poe_ovos).
carnivoro :-
	verifica(come_carne), !.
carnivoro :-
	verifica(tem_dentes_pontiagudos),
	verifica(tem_garras).
ungulado :-
	mamifero,
	verifica(tem_cascos), !.
ungulado :-
	mamifero,
	verifica(rumina).

/* formulando perguntas */
pergunta(Pergunta) :-
	write('O animal tem a seguinte caracteristica: '),
	write(Pergunta),
	write('? '),
	le_opção(Resposta),
	nl,
	trate(Pergunta,Resposta).

trate(Pergunta,Resposta) :-
	Resposta == s,
	assert(sim(Pergunta)),!.
trate(Pergunta,_) :-
	assert(nao(Pergunta)),fail.

:- dynamic sim/1,nao/1.

/* verificando */

verifica(S) :- sim(S),!.
verifica(S) :- nao(S),!, fail.
verifica(S) :- pergunta(S).

/* remove todas as assercoes de sim e nao */

removeRespostas :-
	retractall(sim(_)).
removeRespostas :-
	retractall(nao(_)).

% removeRespostas :- abolish(sim/1), abolish(nao/1),dynamic(sim/1),dynamic(nao/1).

le_opção(Op):-
	nl,
	write('Favor digitar s ou n: '),
	read(Op),
	verifica2(Op),!.
le_opção(Op):-
	nl, write('Opção inexistente!'),nl,
	le_opção(Op).

verifica2(s):-!.
verifica2(n):-!.

