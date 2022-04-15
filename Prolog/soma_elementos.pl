soma_elementos([],0).

soma_elementos([P|R],NP) :- integer(P),!,
                           soma_elementos(R,N),
                           NP is N+P.

soma_elementos([_|R],N) :- soma_elementos(R,N).

