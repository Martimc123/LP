:- [codigo_comum].
:- [espacos_fila].

espacos_puzzle(G,E) :- mat_transposta(G,TG),
                       append(G,TG,NG),
                       espacos_puzzle(NG,E,[]).

espacos_puzzle([],AC,AC).

espacos_puzzle([P|R],E,AC) :- espacos_fila(P,NP),
                              append(AC,NP,NAC),
                              espacos_puzzle(R,E,NAC).
