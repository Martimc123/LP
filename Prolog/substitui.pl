substitui([],_,_,[]) :- !.

substitui([E1|R],E1,E2,[E2|L2]) :- substitui(R,E1,E2,L2),!.

substitui([P|R],E1,E2,[P|L2]) :- substitui(R,E1,E2,L2).
