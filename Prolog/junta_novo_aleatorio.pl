:- [membro].

:- [insere_ordenado].

junta_novo_aleatorio(L1,INF,SUP,L2) :- random_between(INF, SUP, N),
                                       nao_membro(N,L1),
                                       insere_ordenado(N,L1,L2).

junta_novo_aleatorio_ite(L1,INF,SUP,L2) :- random_between(INF, SUP, N),
                                           nao_membro(N,L1),
                                           insere_ordenado_ite(N,L1,L2).

