utworz(N, L) :-
	findall(Num, between(1, N, Num), L).

permutuj([], []).
permutuj([H|T], L1) :- 
	permutuj(T, L2), 
	select(H, L1, L2).

polacz([], X, X) :- !.
polacz(X, [], X).
polacz([H1|T1], [H2|T2], [H1, H2|T]) :- 
	!, 
	polacz(T1, T2, T).

lista(N, X):-
	utworz(N, L1),
	permutuj(L1, L2),
	polacz(L1, L2, X).
