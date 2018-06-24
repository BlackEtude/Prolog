board([]) :-
    write('Nalezy podac tablice liczb'),!.
board(L) :-
	member(X, L),
	length(L, LH),
	X > LH,
	write('Nieprawidlowe dane'),!.
board(L) :-
	length(L, LH),
	ponumeruj_hetmany(L, H, 1, LH),
	S is LH mod 2,
	rysuj(H, 0, LH, S).

hetmany(N, P) :-
	numlist(1, N, L),
	permutation(L, P),
	prawidlowa(P).

ponumeruj_hetmany([], [], _, _).
ponumeruj_hetmany([H1|T1], [H2|T2], K, LH) :-
	H2 is K + LH * (LH - H1),
	K1 is K+1,
	ponumeruj_hetmany(T1, T2, K1, LH).

prawidlowa(X) :-
	\+ nieprawidlowa(X).

nieprawidlowa(X) :-
	append(_, [I|L1], X),
	append(L2, [J|_], L1),
	length(L2, K),
	abs(I-J) =:= K+1.

rysuj(_, LH, LH, _) :-
	rysuj_pozioma_linie(LH), !.
rysuj(H, N, LH, 1) :-
	rysuj_pozioma_linie(LH),
	rysuj_poziom(H, N, LH, 1),
	N1 is N+1,
	rysuj(H, N1, LH, 0).
rysuj(H, N, LH, 0) :-
	rysuj_pozioma_linie(LH),
	rysuj_poziom(H, N, LH, 0),
	N1 is N+1,
	rysuj(H, N1, LH, 1).

rysuj_pozioma_linie(LH) :-
	write('\n+'),
	rysuj_kreske(0, LH).

rysuj_poziom(H, N, LH, S) :-
	write('\n|'),
	NR is N * LH + 1,
	rysuj_srodek(H, NR, 0, LH, S),
	write('\n|'),
	rysuj_srodek(H, NR, 0, LH, S).

rysuj_kreske(LH, LH) :- !.
rysuj_kreske(C, LH) :-
	write('-----+'),
	C1 is C+1,
	rysuj_kreske(C1, LH).

rysuj_srodek(_, _, LH, LH, _) :- !.
rysuj_srodek(H, NR, C, LH, 1) :-
	\+ member(NR, H),!,
	write(':::::|'),
	C1 is C+1,
	NR1 is NR+1,
	rysuj_srodek(H, NR1, C1, LH, 0).
rysuj_srodek(H, NR, C, LH, 1) :-
	member(NR, H),!,
	write(':###:|'),
	C1 is C+1,
	NR1 is NR+1,
	rysuj_srodek(H, NR1, C1, LH, 0).
rysuj_srodek(H, NR, C, LH, 0) :-
	\+ member(NR, H),!,
	write('     |'),
	C1 is C+1,
	NR1 is NR+1,
	rysuj_srodek(H, NR1, C1, LH, 1).
rysuj_srodek(H, NR, C, LH, 0) :-
	member(NR, H), !,
	write(' ### |'),
	C1 is C+1,
	NR1 is NR+1,
	rysuj_srodek(H, NR1, C1, LH, 1).