:- [membro].

common_elements(L1,L2) :- common_elements(L1,L2,[]).

common_elements([],_,AC) :- length(AC,C),
                            C >= 1.

common_elements([P|_],L2,AC) :- membro(P,L2),!,
                                append(AC,[P],NAC),
                                common_elements([],L2,NAC).

common_elements([P|R],L2,AC) :- nao_membro(P,L2),!,
                                common_elements(R,L2,AC).
