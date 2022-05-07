suc(0,1) :- !.

suc(N,M) :- M is N+1.

ant(0,-1).

ant(1,0).

ant(N,M) :- M is N-1.
