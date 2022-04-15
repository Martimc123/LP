:- [codigo_comum].

obtem_letras_palavras(LP,LETRAS) :- sort(LP,NLP),
                                    obtem_letras_palavras(NLP,LETRAS,[]).

obtem_letras_palavras([],LETRAS,LETRAS).

obtem_letras_palavras([P|R],LETRAS,L) :- atom_chars(P, NP),
                                         append(L,[NP],NL),
                                         obtem_letras_palavras(R,LETRAS,NL).

espaco_fila(F,Result) :- espaco_fila(F,[],Result).

espaco_fila([],Acc,Acc) :- length(Acc,C),
                           C < 3,
                           false.

espaco_fila([],Acc,Acc) :- length(Acc,C),
                           C >= 3.

espaco_fila([R|Rs],Acc,Result) :-
   R \= #,
   !,
   append(Acc,[R],NextAcc),
   espaco_fila(Rs,NextAcc,Result).

espaco_fila([#|_],Acc,Acc) :-
   length(Acc,L),
   L >= 3.

espaco_fila([#|R],_,Result) :-
   espaco_fila(R,[],Result).

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

espacos_puzzle(G,E) :- mat_transposta(G,TG),
                       append(G,TG,NG),
                       espacos_puzzle(NG,E,[]).

espacos_puzzle([],AC,AC).

espacos_puzzle([P|R],E,AC) :- espacos_fila(P,NP),
                              append(AC,NP,NAC),
                              espacos_puzzle(R,E,NAC).

membereq(X, [H|_]) :-
    X == H,!.
membereq(X, [_|T]) :-
    membereq(X, T),!.

common_elements([H|_], L2) :-
    membereq(H, L2),!.
common_elements([_|T], L2) :-
    common_elements(T, L2),!.

non_common_elements(L1,L2) :- \+ common_elements(L1,L2).


espacos_com_posicoes_comuns(E,EL,EC) :-  espacos_com_posicoes_comuns(E,EL,EC,[]).

espacos_com_posicoes_comuns([],_,AC,AC) :- !.

espacos_com_posicoes_comuns([P|R],E1,EC,AC) :- P == E1,!,
                        espacos_com_posicoes_comuns(R,E1,EC,AC).

espacos_com_posicoes_comuns([P|R],E1,EC,AC) :-
                        common_elements(P,E1), P \== E1,!,
                        append(AC,[P],NAC),
                        espacos_com_posicoes_comuns(R,E1,EC,NAC).

espacos_com_posicoes_comuns([P|R],E1,EC,AC) :-
                        non_common_elements(P,E1),!,
                        espacos_com_posicoes_comuns(R,E1,EC,AC).

% Este predicado percorre a lista de espacos e ve se existe alguma
% palavra na lista de palavras(LP) que unifica com esse espaco

member_list(X, [X | _List]).
member_list(X, [_Y | List]) :-
    member_list(X, List).

espacos_pal_uni([],_).

espacos_pal_uni([E|RE],LP) :- member(E,LP),
                              espacos_pal_uni(RE,LP).

% Verifica se o espaco (Esp) e a palavra(Pal) tem o mesmo comprimento e se tiverem unifica-os
% apos isso sao unificados os espacos comuns(NEsps) com as palavras da lista de palavras

palavra_possivel_esp(Pal, Esp, Esps, Letras) :-
    espacos_com_posicoes_comuns(Esps,Esp,NEsps),
    Pal = Esp,
    espacos_pal_uni(NEsps,Letras),!.

% Caso os espacos comuns ao Esp nao sejam unificaveis

npalavra_possivel_esp(P, Esp, Esps, Ltrs) :- \+ palavra_possivel_esp(P, Esp, Esps, Ltrs).

% Converte o predicado palavras_possiveis_esp/4 num predicado palavras_possiveis_esp/6, com uma copia das letras e um acumulador

% apos isso percorre a lista de palavras e verifica se possivel para aquele espaco, e se for unifica com esse espaco e adiciona
% essa palavra ao acumulador e ve o resto da lista para ver se a proxima palavra tambem e

% Caso a palavra nao seja possivel para aquele espaco, entao ve se a palavra a seguir e ate a lista de palavras ser vazia,
% devolvendo o que esta dentro do acumulador no final

palavras_possiveis_es(Ltrs,Esps,Esp,Pals) :-
    palavras_possiveis_es(Ltrs,Esps,Esp,Pals,Ltrs,[]).

palavras_possiveis_es(_,_,_,AC,[],AC).


palavras_possiveis_es(Ltrs,Esps,Esp,Pals,[P|RP],AC) :-
    palavra_possivel_esp(P, Esp, Esps, Ltrs),
    append(AC,P,NAC),
    palavras_possiveis_es(Ltrs,Esps,Esp,Pals,RP,NAC).

palavras_possiveis_es(Ltrs,Esps,Esp,Pals,[_|R],AC) :-
    palavras_possiveis_es(Ltrs,Esps,Esp,Pals,R,AC).

palavras_possiveis_esp_aux(Ltrs,Esps,Esp,Npals) :-
    findall(Pals,palavras_possiveis_es(Ltrs,Esps,Esp,Pals),Npals).

palavras_possiveis_esp(Ltrs,Esps,Esp,Npals2) :- palavras_possiveis_esp_aux(Ltrs,Esps,Esp,Npals),delete(Npals,[],Npals2).

palavras_possiveis(Letras,Espacos,Pals_Possiveis) :-
   palavras_possiveis(Letras,Espacos,Pals_Possiveis,Espacos,[]).

palavras_possiveis(_,_,AC,[],AC).

palavras_possiveis(Letras,Espacos,Pals_Possiveis,[P|R],AC) :-
   palavras_possiveis_esp(Letras,Espacos,P,Pals_Esp),
   append(AC,[[P,Pals_Esp]],NAC),
   palavras_possiveis(Letras,Espacos,Pals_Possiveis,R,NAC).

letras_comuns(Lst_Pals, Letras_comuns) :-
    findall((L,I), foreach(member(X,Lst_Pals),nth1(L,X,I)), Letras_comuns).

letras_comuns_lst(Lst_Pals, Letras_comuns) :- findall([I,L], foreach(member(X,Lst_Pals),nth1(L,X,I)), Letras_comuns).

aux_lst(_,[]).

aux_lst(E,[P|R]) :-  nth1(2,P,Index),
                     nth1(1,P,ElP),
                     nth1(Index,E,ElP),
                     aux_lst(E,R).

atribui_comuns(Pals) :- atribui_comuns(Pals,Pals).

atribui_comuns([],_).

atribui_comuns([P|R],Pals_uni) :- nth1(1,P,Esp),
                                  nth1(2,P,Pal),
                                  letras_comuns_lst(Pal,Letras),
                                  aux_lst(Esp,Letras),
                                  atribui_comuns(R,Pals_uni).

atribui_comuns_aux(Pals,Pals_eq) :- atribui_comuns_aux(Pals,Pals_eq,[]).

atribui_comuns_aux([],AC,AC) :- !.

atribui_comuns_aux([P|R],Pals_eq,AC) :- nth1(1,P,Esp),
                                        nth1(2,P,Pal),                                                                    member(Esp,Pal),!,
                                        append(AC,[[Esp,Pal]],NAC),
                                        atribui_comuns_aux(R,Pals_eq,NAC).

retira_impossiveis_aux(Esp,Pals,Npal) :-
   retira_impossiveis_aux(Esp,Pals,Npal,[]).


retira_impossiveis_aux(_,[],AC,AC) :- !.

retira_impossiveis_aux(Esp,[P|R],Npal,AC) :- Esp \= P,!,
                                           retira_impossiveis_aux(Esp,R,Npal,AC).

retira_impossiveis_aux(Esp,[P|R],Npal,AC) :- append(AC,[P],NAC),!,
                                          retira_impossiveis_aux(Esp,R,Npal,NAC).


retira_impossiveis(Pals, Novas_Pals) :- retira_impossiveis(Pals, Novas_Pals,[]).

retira_impossiveis([], Novas_Pals,Novas_Pals).

retira_impossiveis([P|R],Novas_Pals,AC) :-
                         nth1(1,P,Esp),
                         nth1(2,P,Pals),
                         retira_impossiveis_aux(Esp,Pals,Pals_fil),
                         append(AC,[[Esp,Pals_fil]],NAC),
                         retira_impossiveis(R,Novas_Pals,NAC).

obtem_unicas(Pals,Unicas) :- obtem_unicas(Pals,Unicas,[]).

obtem_unicas([],AC,AC) :- !.

obtem_unicas([P|R],Unicas,AC) :- nth1(2,P,Pal),
                                 length(Pal,C),
                                 C == 1,!,
                                 append(AC,Pal,NAC),
                                 obtem_unicas(R,Unicas,NAC).

obtem_unicas([P|R],Unicas,AC) :- length(P,C),
                                 C > 1,!,
                                 obtem_unicas(R,Unicas,AC).


retira_unicas_aux(Pals,Letras,NPals) :- retira_unicas_aux(Pals,Letras,NPals,[]).

retira_unicas_aux([],_,NAC,NAC) :- !.

retira_unicas_aux([P|R],Letras,NPals,AC) :- member(P,Letras),!,
                                         retira_unicas_aux(R,Letras,NPals,AC).

retira_unicas_aux([P|R],Letras,NPals,AC) :- !,append(AC,[P],NAC),
                                            retira_unicas_aux(R,Letras,NPals,NAC).



retira_unicas(Pals_Poss, Novas_Pals) :-
   obtem_unicas(Pals_Poss,Unicas),
   retira_unicas(Pals_Poss,Novas_Pals,[],Unicas).

retira_unicas([],AC,AC,_) :- !.

retira_unicas([P|R],Novas_Pals,AC,Unicas) :-
       nth1(1,P,Esp),
       nth1(2,P,Pals),
       length(Pals,C),
       C > 1,!,
       retira_unicas_aux(Pals,Unicas,NPals),
       append(AC,[[Esp,NPals]],NAC),
       retira_unicas(R,Novas_Pals,NAC,Unicas).

retira_unicas([P|R],Novas_Pals,AC,Unicas) :- append(AC,[P],NAC),
                                        retira_unicas(R,Novas_Pals,NAC,Unicas).

retira_a_mais(Esp,Pals,Pal) :- retira_a_mais(Esp,Pals,Pal,[]).

retira_a_mais(_,[],AC,AC) :- !.

retira_a_mais(Esp,[P|R],Pal,AC) :- P == Esp,!,
                                   append(AC,[P],NAC),
                                   retira_a_mais(Esp,R,Pal,NAC).

retira_a_mais(Esp,[_|R],Pal,AC) :- !,retira_a_mais(Esp,R,Pal,AC).

retira_final(Pals,N_pals) :- retira_final(Pals,N_pals,[]).

retira_final([],AC,AC).

retira_final([P|R],Novas_pals,AC) :- nth1(1,P,Esp),
                                 nth1(2,P,Pals),
                                 retira_a_mais(Esp,Pals,Pals_atuais),
                                 append(AC,[[Esp,Pals_atuais]],NAC),
                                 retira_final(R,Novas_pals,NAC).


simplifica(Pals,Pals_fin2) :-    atribui_comuns(Pals),
                                retira_impossiveis(Pals,Novas_Pals),
                                retira_unicas(Novas_Pals,Unicas_Pals),
                                atribui_comuns_aux(Unicas_Pals,Pals_fin),
                                retira_final(Pals_fin,Pals_fin2).

inicializa(Puz,NPals) :-
                      nth1(1,Puz,Palavras_Ini),
                      nth1(2,Puz,Grelha),
                      obtem_letras_palavras(Palavras_Ini,Letras),
                      espacos_puzzle(Grelha,Espacos),
                      palavras_possiveis(Letras, Espacos, Pals_Possiveis),
                      simplifica(Pals_Possiveis,NPals).
