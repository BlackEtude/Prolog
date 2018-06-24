rowny_rozmiar([_|T1], [_|T2]) :-
    rowny_rozmiar(T1, T2).

srodkowy(L, X) :-
    append(P, [X|S], L),
    rowny_rozmiar(P, S).