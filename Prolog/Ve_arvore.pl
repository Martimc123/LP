prolog(true) :- !.
prolog((X,Y)) :- !, prolog(X), prolog(Y).
prolog(H) :- clause(H,Body), prolog(Body).
