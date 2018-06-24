%% ma(tomek, lustro).
%% ma(tomek, mieszkanie).
%% ma(ola, taran).
%% ma(ola, tasak).
%% ma(bartek, zeszyt).
%% ma(ernest, balagan).
%% ma(zosia, ciastko).

%% daje(s(0), tomek, lustro, ola).
%% daje(s(s(s(0))), ola, lustro, zosia).
%% daje(s(0), ola,  tasak,  ernest).
%% daje(s(s(0)), ernest, balagan, zosia).
%% daje(s(s(s(s(0)))), zosia, balagan, ernest).
%% daje(s(s(s(s(s(0))))), ernest, balagan, zosia).
%% daje(s(s(s(s(s(s(0)))))), zosia, balagan, ernest).

ma(kazik, dom).
ma(zbysio, auto).
ma(magda, rower).
ma(kasia, willa).

daje(1, kazik, dom, magda).
daje(1, zbysio, auto, magda).
daje(3, magda, dom, kasia).
daje(2, kasia, willa, magda).
daje(8, magda, willa, kazik).

% definicja chwili
chwila(0).
chwila(s(X)) :-
    chwila(X).

% X=<Y
wczesniej(0, X) :-
    chwila(X).
wczesniej(s(X), s(Y)) :-
    wczesniej(X, Y).

% Lista chwil w których ktoś coś komuś daje
zapisanyczas(L, Kto, Co, Komu) :-
    findall(X, daje(X, Kto, Co, Komu), L).

% Najpóźniejsza chwila na liście
ostatni_zapisany(Max, [], Max).
ostatni_zapisany(X, [Z|L], Max) :-
    wczesniej(Z, Max),
    ostatni_zapisany(X, L, Z),!.
ostatni_zapisany(X, [Z|L], _) :-
    ostatni_zapisany(X, L, Z),!.

% Ostatnie chwile w których ktoś coś daje i dostaje
ostatnia_chwila(ChwilaDaje, ChwilaDostaje, Kto, Co) :-
    zapisanyczas(L1, Kto, Co, _),
    ostatni_zapisany(ChwilaDaje, L1, 0),
    zapisanyczas(L2, _, Co, Kto),
    ostatni_zapisany(ChwilaDostaje, L2, 0).

% Ostatnia chwila w której ktoś daje albo dostaje
ostatnia_wieksza_chwila(Chwila, ChwilaDaje, ChwilaDostaje) :-
    wczesniej(ChwilaDaje, ChwilaDostaje),
    Chwila = ChwilaDostaje, !.
ostatnia_wieksza_chwila(Chwila, ChwilaDaje, _) :-
    Chwila = ChwilaDaje, !.

% Chcemy iść po kolei dla każdej chwili na liście aż do ostatniej
ma(Kiedy, Kto, Co) :-
    ostatnia_chwila(ChwilaDaje, ChwilaDostaje, Kto, Co),
    ostatnia_wieksza_chwila(Chwila, ChwilaDaje, ChwilaDostaje),
    wczesniej(Kiedy, Chwila),
    ma(Kiedy, Kto, Co, Chwila).

ma(Kiedy, Kto, Co) :-
    ostatnia_chwila(ChwilaDaje, ChwilaDostaje, Kto, Co),
    ostatnia_wieksza_chwila(Chwila, ChwilaDaje, ChwilaDostaje), 
    (daje(Chwila, _, Co, Kto); ma(Kto, Co), Chwila is 0),
    Kiedy = ma_juz_zawsze.

ma(0, Kto, Co, _) :-
    ma(Kto, Co).

ma(Kiedy, Kto, Co, _) :-
    daje(Kiedy, _, Co, Kto).

ma(Kiedy, Kto, Co, Chwila) :-
    \+ daje(Kiedy, Kto, Co, _),
    Kiedy = s(Y),
    ma(Y, Kto, Co, Chwila).