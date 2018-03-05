le(a, a).
le(a, b).
le(a, c).
le(a, d).
le(a, e).

le(b, b).
le(b, c).
le(b, e).

le(c, c).
le(c, e).

le(d, d).
le(d, e).

le(e, e).

le(f, f).


czesciowy_poczadek() :-
	\+ ((le(X, _); le(_, X)), \+ le(X, X)), 	/* zwrotność */
    \+ (le(X, Y), le(Y, Z), \+ le(X, Z)),		/* przechodniość */
    \+ (le(X, Y), le(Y, X), X \= Y).			/* słaba antysymetria */