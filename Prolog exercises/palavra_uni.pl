:- [espacos_com_posicoes_comuns].

espacos_uni(E,LP) :- espacos_uni(E,LP,[]).

espacos_uni(E,[P|R],AC) :- length(E,CE),
                         length(P,CP),
                         CE \== CP,!,
                         append(AC,[P],NAC),
                         espacos_uni(E,R,NAC).

espacos_uni(E,[P|R],AC) :- length(E,CE),
                         length(P,CP),
                         CE == CP,
                         P \= E,!,
                         append(AC,[P],NAC),
                         espacos_uni(E,R,NAC).


espacos_uni(E,[P|R],AC) :- length(E,CE),
                           length(P,CP),
                           CE == CP,!,
                           (P = E),
                           append(AC,R,_).


espacos_pal_uni([],_) :- true.

espacos_pal_uni([E|RE],LP) :- member(E,LP),
                              espacos_pal_uni(RE,LP).






