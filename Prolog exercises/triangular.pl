tri_succ(P, T) :- tri_succ(0, 0, P, T).

tri_succ(N, Tn, L, S) :-
    N1 is N+1,
    Ts is Tn+N1,
    (   L = Tn
    ->  S = Ts
    ;   L > Tn
    ->  tri_succ(N1, Ts, L, S)
    ).

triangular(N) :- N >0,
                 tri_succ(N,T).
