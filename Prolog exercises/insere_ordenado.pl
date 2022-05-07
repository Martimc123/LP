% Versão Recursiva

insere_ordenado(El,[],[El]).

insere_ordenado(El,[P|R],[P|L2]) :- El >= P,
                                    insere_ordenado(El,R,L2).

insere_ordenado(El,[P|R],[El,P|R]) :- El < P.

% Versão Iterativa

:- [maximo_lista].

insere_ordenado_ite(El,L1,L2) :-  insere_ordenado_ite(El,L1,L2,[]).

insere_ordenado_ite(El,[],L2,L2) :- !.

insere_ordenado_ite(El,[P|R],L2,AC) :- El >= P,
                                       maxlist(R,V),
                                       El < V,!,
                                       append(AC,[P],NAC),
                                       insere_ordenado_ite(El,R,L2,NAC).

insere_ordenado_ite(El,[P|R],L2,AC) :- El < P,
                                       maxlist(R,V),
                                       El < V,!,
                                       append(AC,[El,P],NAC),
                                       append(NAC,R,NNAC),
                                       insere_ordenado_ite(El,[],L2,NNAC).


insere_ordenado_ite(El,L1,L2,AC) :-    maxlist(L1,V),
                                       El >= V,
                                       append(AC,L1,NAC),
                                       append(NAC,[El],NNAC),
                                       insere_ordenado_ite(El,[],L2,NNAC).




