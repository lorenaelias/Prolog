% exercicio 2.1

concatena
[] e L gera L.

:-op(80,xfx,gera).
:-op(60,fx,concatena).
:-op(50,xfx,e).
%:-op(40,xfx,existe_em).


% exercicio 1

:-op(100,xfx,eh_pai_de).

pedro eh_pai_de maria.

% exercicio 2.2

:-op(500,fx,se).
:-op(600,xfx,entao).

se a entao b.
se a e b entao c.

% exercicio 2.3

:-op(800,xfx,<===>).

:-op(700,xfy,ou).

:-op(500,xfy,e).

:-op(400,fy,~).

~(a e b) <===> ~a ou ~b.



% exercicio 2.4

t(0+1, 1+0).
t(X+0+1, X+1+0).

t(X+1+1, Z) :­
    t(X+1, X1),
    t(X1+1, Z).




