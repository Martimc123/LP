:- [commonLST].

membereq(X, [H|_]) :-
    X == H,!.
membereq(X, [_|T]) :-
    membereq(X, T),!.

common_elements([H|_], L2) :-
    membereq(H, L2),!.
common_elements([_|T], L2) :-
    common_elements(T, L2),!.

non_common_elements(L1,L2) :- \+ common_elements(L1,L2).


espacos_com_posicoes_comuns(E,EL,EC) :-  espacos_com_posicoes_comuns(E,EL,EC,[]).

espacos_com_posicoes_comuns([],_,AC,AC) :- !.

espacos_com_posicoes_comuns([P|R],E1,EC,AC) :- P == E1,!,
                        espacos_com_posicoes_comuns(R,E1,EC,AC).

espacos_com_posicoes_comuns([P|R],E1,EC,AC) :-
                        common_elements(P,E1), P \== E1,!,
                        append(AC,[P],NAC),
                        espacos_com_posicoes_comuns(R,E1,EC,NAC).

espacos_com_posicoes_comuns([P|R],E1,EC,AC) :-
                        non_common_elements(P,E1),!,
                        espacos_com_posicoes_comuns(R,E1,EC,AC).
