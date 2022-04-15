p(2, 3).
p(X,Y) :- q(X),r(Y).
q(1).
q(2) :- !.
q(3).
r(1).
r(3).

classe(0,zero) :- !.
classe(N,positivo) :- N >0,!.
classe(N,negativo) :- N < 0.

intersecao([],_,[]) :- !.
intersecao(_,[],[]) :- !.

intersecao([P1|R1],L2,[P1|N]) :- member(P1,L2),!,
                                      intersecao(R1,L2,N).

intersecao([_|R1],L2,N) :- intersecao(R1,L2,N).

disjuntas1([],_) :- !.
disjuntas1(_,[]) :- !.

disjuntas1([P|_],L2) :- member(P,L2),!,
                        fail.

disjuntas1([_|R],L2) :- disjuntas1(R,L2).

disjuntas2(L1,L2) :- \+ (member(E,L1),member(E,L2)).

trabalha(P, D) :- pessoa(P),
                  diaUtil(D),
                  \+ temJust(P, D).

temJust(P, D) :- doente(P, D),
                 \+ constipado(P, D).

diaUtil(D) :- member(D, [seg, ter, qua, qui, sex]).

pessoa(rui).
pessoa(jaime).
pessoa(joana).
doente(rui, seg).
doente(jaime, qua).
constipado(jaime, qua).

% ?- trabalha(P,qua),writeln(trabalha(P,qua)),fail.

% ?- trabalha(P,seg),\+ temJust(P, seg).
