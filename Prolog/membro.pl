membro(X, [X | _]) :- !.
membro(X, [_ | R]) :- membro(X, R).

nao_membro(X, L) :- \+ membro(X,L).

n_member(A,B) :- \+ member(A,B).
