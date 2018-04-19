wyrazenie(Lista, Wartosc, Wyrazenie) :-
	wyrazenie(Lista, Wyrazenie),
	Wartosc is Wyrazenie.
wyrazenie([Liczba], Liczba).
wyrazenie(Lista, Wyrazenie) :-
	rozdziel(Lista, L1, L2),
	wyrazenie(L1, X),
	wyrazenie(L2, Y),
	dzialanie(Wyrazenie, X, Y).

dzialanie(Wyrazenie, X, Y) :-
	Wyrazenie = X + Y.
dzialanie(Wyrazenie, X, Y) :-
	Wyrazenie = X - Y.
dzialanie(Wyrazenie, X, Y) :-
	Wyrazenie = X * Y.
dzialanie(Wyrazenie, X, Y) :-
	Y =\= 0,
	Wyrazenie = X / Y.

rozdziel(L, L1, L2) :-
	append(L1, L2, L),
	L1 \= L,
	L2 \= L.