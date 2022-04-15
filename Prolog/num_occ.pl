num_occ(L,El,N) :- num_occ(L,El,N,0).

num_occ([],El,N,N) :- !.

num_occ([P|R],El,N,Ac) :- P == El,!,
                          Nac is Ac+1,
                          num_occ(R,El,N,Nac).

num_occ([P|R],El,N,AC) :- P =\= El,!,
                          num_occ(R,El,N,AC).
