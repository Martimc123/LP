:- [junta_novo_aleatorio].

:- [membro].

:- [insere_ordenado].


n_aleatorios(N, Lim_Inf, Lim_Sup, Lst) :- n_aleatorios(N, Lim_Inf, Lim_Sup, Lst, []).

n_aleatorios(N, _, _, Lst, Lst) :- length(Lst, N).

n_aleatorios(N, Lim_Inf, Lim_Sup, Lst, Temp) :- junta_novo_aleatorio(Temp, Lim_Inf, Lim_Sup, N_Temp), n_aleatorios(N, Lim_Inf, Lim_Sup, Lst, N_Temp).





