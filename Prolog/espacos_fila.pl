espacos_fila(F,E) :- espacos_fila(F,E,[],[]).

espacos_fila([],E,ACL,ACE) :- length(ACE,C),
                                 C >= 3,
                                 append(ACL,[ACE],NACL),
                                 espacos_fila([],E,NACL,[]),!.
espacos_fila([],ACL,ACL,_) :- !.

espacos_fila([P|R],E,ACL,ACE) :- P \== #,!,
                                 append(ACE,[P],NACE),
                                 espacos_fila(R,E,ACL,NACE).

espacos_fila([P|R],E,ACL,ACE) :- P == #,
                                 length(ACE,C),
                                 C >= 3,!,
                                 append(ACL,[ACE],NACL),
                                 espacos_fila(R,E,NACL,[]).

espacos_fila([#|R],E,ACL,ACE) :- length(ACE,C),
                                 C < 3,!,
                                 espacos_fila(R,E,ACL,[]).





