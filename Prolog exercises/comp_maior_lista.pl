comp_maior_lista(L,C) :- comp_maior_lista(L,C,0).

comp_maior_lista([],AC,AC).

comp_maior_lista([P|R],C,AC) :- length(P,Comp),
                                Comp > AC,!,
                                comp_maior_lista(R,C,Comp).

comp_maior_lista([P|R],C,AC) :- length(P,Comp),
                                Comp =< AC,!,
                                comp_maior_lista(R,C,AC).
