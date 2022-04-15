menor(L,M) :- menor(L,M,0).

menor([],M,M).

menor([P|R],M,N) :- P > N,!,
                    menor(R,M,N).

menor([P|R],M,_) :- NP = P,
    menor(R,M,NP).


menorque(N, L, Menor) :- menor(L, M), M < N, !, Menor is M.
menorque(N, _, N).

