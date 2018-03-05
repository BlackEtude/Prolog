jest_matka(X) :-
    matka(X, _).

jest_ojcem(X) :-
    ojciec(X, _).

jest_synem(X) :-
    mezczyzna(X),
    rodzic(_, X).

siostra(X, Y) :-
    rodzic(Z, X), 
    rodzic(Z, Y),
    kobieta(X),
    X \= Y.

dziadek(X, Y) :-
    ojciec(X, Z),
    rodzic(Z, Y).

rodzenstwo(X, Y) :-
    rodzic(Z, X), 
    rodzic(Z, Y),
    X \= Y.
