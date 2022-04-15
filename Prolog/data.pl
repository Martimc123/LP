faz_data(A, M, D, data(A, M, D)).

ano_de(data(A,_,_), A).
mes_de(data(_,M,_), M).
dia_de(data(_,_,D), D).

muda_ano(A, data(_,M,D), data(A, M, D)).
muda_mes(M, data(A,_,D), data(A, M, D)).
muda_dia(D, data(A,M,_), data(A, M, D)).

prox_ano(Hoje, Futuro) :- ano_de(Hoje, A), Prox_ano is A + 1, muda_ano(Prox_ano, Hoje, Futuro).

datas_iguais(D1,D2) :- ano_de(D1,A1) == ano_de(D2, A1),
                       mes_de(D1,M1) == mes_de(D2, M1),
                       dia_de(D1,Dia1) == dia_de(D2, Dia1).


