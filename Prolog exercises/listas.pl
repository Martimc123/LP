dif_listas([], [],[]) :- !.

dif_listas([N|R1], [E|R2], L3) :-  N == E,!,
                                       dif_listas(R1,R2,L3).

dif_listas([P|R], L2, [P|L3]) :- !,dif_listas(R,L2,L3).

