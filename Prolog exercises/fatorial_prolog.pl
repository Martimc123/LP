fatorial(1,1).

fatorial(N,F) :- N > 1, N_menos_1 is N-1, fatorial(N_menos_1,F_N_menos_1),
 F is N * F_N_menos_1.
