arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiagalny(A, B):- osiagalny(A, B, []).

osiagalny(A, A, _).

osiagalny(A, B, C):-
	\+ member(A, C),
	arc(A, X),
	osiagalny(X, B, [A|C]).

