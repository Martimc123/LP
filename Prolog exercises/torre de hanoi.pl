hanoi :- write("Quantos discos quer considerar? "),nl,read(N),number(N),inicio(N),move(N,e,d,c).

inicio(N) :- write("A solução da torre de Hanoi para "),write(N),write(" discos: "),nl.

move(1,Origem,Destino,_) :-  write(Origem),write(" -> "),write(Destino),nl.

move(N,Origem,Destino,Aux) :- N > 1, M is N-1,move(M,Origem,Aux,Destino),move(1,Origem,Destino,_),move(M,Aux,Destino,Origem).
