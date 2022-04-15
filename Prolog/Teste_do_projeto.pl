espaco_fila(F,Result) :- espaco_fila(F,[],Result).

espaco_fila([],Acc,Acc).


espaco_fila([R|Rs],Acc,Result) :-
   R \== #,
   !,
   append(Acc,[R],NextAcc),
   espaco_fila(Rs,NextAcc,Result).


espaco_fila([#|_],Acc,Acc) :-
   length(Acc,L),
   L >= 3.

espaco_fila([#|R],_,Result) :-
   espaco_fila(R,[],Result).
