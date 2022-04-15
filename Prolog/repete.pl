repete_el(El,0,[]) :- !.

repete_el(El,N,[El|L]) :- N >= 1,
                          Num is N-1,
                          repete_el(El,Num,L).

repete_el2(El,N,L) :- findall(El, between(1,N,_), L).
