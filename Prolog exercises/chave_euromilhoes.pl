:- [membro].
:- [insere_ordenado].
:- [junta_novo_aleatorio].
:- [n_aleatorios].

chave_euromilhoes(N,E) :- n_aleatorios(5,1,50,N),
                          n_aleatorios(2,1,12,E).

