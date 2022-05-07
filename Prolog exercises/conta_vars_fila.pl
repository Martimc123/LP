conta_vars_fila(F,N) :- conta_vars_fila(F,N,0).

conta_vars_fila([],C,C) :- !.

conta_vars_fila([P|R],N,C) :- var(P),!,
                              NC is C+1,
                              conta_vars_fila(R,N,NC).

conta_vars_fila([_|R],N,C) :- !,conta_vars_fila(R,N,C).

conta_0_1_fila(N,F,R) :- conta_0_1_fila(N,F,R,0).

conta_0_1_fila(_,[],R,R) :- !.

conta_0_1_fila(N,[P|RES],R,C) :- P == N,!,
                              NC is C+1,
                              conta_0_1_fila(N,RES,R,NC).

conta_0_1_fila(N,[_|RES],R,C) :- !,conta_0_1_fila(N,RES,R,C).

conta_vars_uns_Puzzle([],[],[]).

conta_vars_uns_Puzzle([P|R],[NVARS|Vars],[N1|Uns]) :-
                                       conta_vars_fila(P,NVARS),
                                       conta_0_1_fila(1,P,N1),
                                       conta_vars_uns_Puzzle(R,Vars,Uns).
