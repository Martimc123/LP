agrupa(L1,L2,L3) :- agrupa(L1,L2,L3,[]).

agrupa([],[],L3,L3).

agrupa([P1|R1],[P2|R2],L3,Ac) :- P1 > P2,!,
                                 append(Ac,[[P2,P1]],NAC),
                                 agrupa(R1,R2,L3,NAC).

agrupa([P1|R1],[P2|R2],L3,Ac) :- P2 > P1,!,
                                 append(Ac,[[P1,P2]],NAC),
                                 agrupa(R1,R2,L3,NAC).
