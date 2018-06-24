jednokrotnie(X, L) :-
	append(P, [X|S], L),
	\+ member(X, S),
	\+ member(X, P).
	

dwukrotnie(X, L) :-
	append(P, [X|S], L),
	\+ member(X, P),
	jednokrotnie(X, S).