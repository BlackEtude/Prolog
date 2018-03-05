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

minimalny(X) :-
    le(X, X), 
    \+ (le(Y, X), X \= Y).

maksymalny(X) :-
    le(X, X), 
    \+ (le(X, Y), X \= Y).

najmniejszy(X) :-
	le(X, X), 
	\+ (le(Y, Y), \+ le(X, Y)).

najwiekszy(X) :-
	le(X, X), 
	\+ (le(Y, Y), \+ le(Y, X)).