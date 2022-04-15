soma_digitos_rec(N, N) :- N < 10,!.

soma_digitos_rec(N, S) :- N >= 10,!,
                     Novo_N is N // 10,
                     Digito is N mod 10,
                     soma_digitos_rec(Novo_N, Novo_S),
                     S is Novo_S + Digito.

soma_digitos_ite(N,S) :- soma_digitos_ite(N,S,0).

soma_digitos_ite(0,Res,Res) :- !.

soma_digitos_ite(N,S,Res) :- N =\= 0,!,
                             Digito is N mod 10,
                             Nres is Res + Digito,
                             NN is N // 10,
                             soma_digitos_ite(NN,S,Nres).
