ad(marge, bart).
ad(srB, marge).
ant(X, Y) :- ad(X, Y).
ant(X, Z) :- ant(Y, Z), ad(X, Y).