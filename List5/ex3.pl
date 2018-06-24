browse(Term) :-
	czytaj_polecenie(Term, [], []), !.

czytaj_polecenie(M, P, S) :-
	write(M), nl, write('command: '),
	read(C),
	nastepny_wierzcholek(M, P, S, C).

nastepny_wierzcholek(M, P, S, 'i') :-
	M =.. [F, M2|A],
	P1 = [F|P],
	S1 = [[M2|A]|S],
	czytaj_polecenie(M2, P1, S1).
nastepny_wierzcholek(_, [P1|P2], [S1|S2], 'o') :-
	M2 =.. [P1|S1],
	czytaj_polecenie(M2, P2, S2).
nastepny_wierzcholek(M, P, [S1|S2], 'p') :-
	append(_, [M2, M|_], S1),
	czytaj_polecenie(M2, P, [S1|S2]).
nastepny_wierzcholek(M, P, [S1|S2], 'n') :-
	append(_, [M, M2|_], S1),
	czytaj_polecenie(M2, P, [S1|S2]).
nastepny_wierzcholek(_, [], [], 'o') :-
	true.
nastepny_wierzcholek(M, P, S, _) :-
	czytaj_polecenie(M, P, S).