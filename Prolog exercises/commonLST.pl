membereq(X, [H|_]) :-
    X == H,!.
membereq(X, [_|T]) :-
    membereq(X, T),!.

common_elements([H|_], L2) :-
    membereq(H, L2),!.
common_elements([_|T], L2) :-
    common_elements(T, L2),!.

non_common_elements(L1,L2) :- \+ common_elements(L1,L2).
