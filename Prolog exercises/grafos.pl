liga(a,h).
liga(a,b).
liga(b,c).
liga(b,d).
liga(d,e).
liga(f,c).
liga(h,i).
liga(i,g).

liga_ind(X,Y) :- liga(X,Y).

liga_ind(X,Z) :- liga(X,Y), liga_ind(Y,Z).
