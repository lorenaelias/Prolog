inicio :-
	repeat,
	menu,
	read(Op),
	( Op = 5, write('Fim..'),nl,!;executar(Op)),fail.
	%fail voltará para repeat

menu:-
       nl,
       write('[1] - Especificar Evidência'),nl,
       write('[2] - Visualizar Evidência'),nl,
       write('[3] - Adivinhar'),nl,
       write('[4] - Remover Respostas'),nl,
       write('[5] - Sair'),nl,!.

executar(1):-
	nl,
	write('Você deseja inserir uma: '),nl,
	write('[1] - Característica que ele possui :'),nl,
	write('[2] - Característica que ele não possui :'),nl,
	read(X),
	executaop(X).

executar(2):-
	listing(sim),nl,
	listing(nao),nl.
executar(3):-
	adivinhar.
executar(4):-
	removeRespostas.

executaop(1):-
	write('* Insira a Evidência(Espaços_escritos_assim) *'),
	nl,
	read(String),
	assert(sim(String)).
executaop(2):-
	write('* Insira a Evidência(Espaços_escritos_assim) *'),
	nl,
	read(String),
	assert(nao(String)).

adivinhar:-
	hipotetiza(Animal),
	write('O animal eh: '),
	write(Animal),
	nl.


leop(Op):-
    nl,
    le_atomo(Op),
    verificaresp(Op),!.
% cut nao deixa ir pro proximo leop se verificaresp for s ou n
leop(Op):-
    nl, write('Digite somente s ou n '),
    leop(Op).

verificaresp('s'):- !.
verificaresp('n'):- !.

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
	leop(Resposta),
	nl,
	trate(Pergunta,Resposta).

trate(Pergunta,Resposta) :-
	Resposta = 's',
	assert(sim(Pergunta)),!.
trate(Pergunta,_) :-
	assert(nao(Pergunta)),fail.

:- dynamic sim/1,nao/1.

/* verificando */

verifica(S) :- sim(S),!.
verifica(S) :- nao(S),!, fail.
verifica(S) :- pergunta(S).

/* remove todas as assercoes de sim e nao */

removeRespostas :- retractall(sim(_)),!.
removeRespostas :- retractall(nao(_)),!.
% retractall ja possui fail embutido

% removeRespostas :- abolish(sim/1),
% abolish(nao/1),dynamic(sim/1),dynamic(nao/1).


/* predicado para ler caracteres */
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
