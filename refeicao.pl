entrada(sopa).
entrada(salada).
pratoprincipal(P):-
	peixe(P).
pratoprincipal(P):-
	carne(P).
pratoprincipal(P):-
	aves(P).

sobremesa(sorvete).
sobremesa(frutas).

carne(bife).
carne(cupim).
peixe(dourado).
peixe(pintado).
aves(frango).
aves(perdiz).



refeicao(Ent,Prin,Sobr):-
	entrada(Ent),
	pratoprincipal(Prin),
	sobremesa(Sobr).

