
nthel(1,[P|_], P) :- !.

nthel(Pos, [_|Tail], Elem) :-
                      Pos_1 is Pos - 1,
                      nthel(Pos_1, Tail, Elem).

total_linha(L,P,T) :- total_linha(L,P,T,0).

total_linha(_,[],T,T) :- !.

total_linha(L,[(X,_)|R],T,C) :-  X =:= L,!,
                                 NC is C+1,
                                 total_linha(L,R,T,NC).

total_linha(L,[_|R],T,C) :- !,total_linha(L,R,T,C).
