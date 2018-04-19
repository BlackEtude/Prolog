zapalki(Z, (duze(N1), srednie(N2))) :-
	zapalki(Z, (duze(N1), srednie(N2), male(0))).
zapalki(Z, (duze(N1), male(N3))) :-
	zapalki(Z, (duze(N1), srednie(0), male(N3))).
zapalki(Z, (srednie(N2), male(N3))) :-
	zapalki(Z, (duze(0), srednie(N2), male(N3))).
zapalki(Z, (duze(N1), srednie(N2), male(N3))) :-
	generuj_duze(D, N1),
	generuj_srednie(S, N2),
	generuj_male(M, N3),
	suma(U, [D, S, M]),
	sort(U, US),
	sprawdz_duze(US, N1),
	sprawdz_srednie(US, N2),
	sprawdz_male(US, N3),
	between(0, 24, Z),
	DL is 24-Z,
	length(U, DL),
	narysuj_pole(U).

generuj_duze(D, 0) :-
	D = [].
generuj_duze(D, 1) :-
	duze_kwadraty(D).

generuj_srednie(S, 0) :-
	S = [].
generuj_srednie(S, N) :-
	srednie_kwadraty(LS),
	podzbior(L, LS),
	length(L, N),
	suma(S, L).

generuj_male(M, 0) :-
	M = [].
generuj_male(M, N) :-
	male_kwadraty(LM),
	podzbior(L, LM),
	length(L, N),
	suma(M, L).

sprawdz_duze(U, 1) :-
	duze_kwadraty(D),
	podzbior(D, U).
sprawdz_duze(U, 0) :-
	duze_kwadraty(D),
	\+ podzbior(D, U).

sprawdz_srednie(U, N) :-
	srednie_kwadraty(S),
	sprawdz(U, S, 0, N).

sprawdz_male(U, N) :-
	male_kwadraty(M),
	sprawdz(U, M, 0, N).

sprawdz(_, [], N, N).
sprawdz(U, [H|T], C, N) :-
	podzbior(H, U),
	C1 is C+1,
	sprawdz(U, T, C1, N).
sprawdz(U, [H|T], C, N) :-
	\+ podzbior(H, U),
	sprawdz(U, T, C, N).

podzbior([], []).
podzbior([E|NT], [E|T]):-
	podzbior(NT, T).
podzbior(NT, [_|T]):-
	podzbior(NT, T).

suma(U, [H]) :-
	U = H.
suma(U, [H|T]) :-
	suma(U1, T),
	union(H, U1, U).

duze_kwadraty([1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24]).
srednie_kwadraty([[1, 2, 4, 6, 11, 13, 15, 16], [2, 3, 5, 7, 12, 14, 16, 17], [8, 9, 11, 13, 18, 20, 22, 23], [9, 10, 12, 14, 19, 21, 23, 24]]).
male_kwadraty([[1, 4, 5, 8], [2, 5, 6, 9], [3, 6, 7, 10], [8, 11, 12, 15], [9, 12, 13, 16], [10, 13, 14, 17], [15, 18, 19, 22], [16, 19, 20, 23], [17, 20, 21, 24]]).

narysuj_zapalke(X) :-
	member(X, [2, 3, 9, 10, 16, 17, 23, 24]),
	write('---+').
narysuj_zapalke(X) :-
	member(X, [1, 8, 15, 22]),
	write('\n+---+').
narysuj_zapalke(X) :-
	member(X, [4, 11, 18]),
	write('\n|   ').
narysuj_zapalke(X) :-
	member(X, [5, 6, 7, 12, 13, 14, 19, 20, 21]),
	write('|   ').

narysuj_puste(X) :-
	member(X, [2, 3, 9, 10, 16, 17, 23, 24]),
	write('   +').
narysuj_puste(X) :-
	member(X, [1, 8, 15, 22]),
	write('\n+   +').
narysuj_puste(X) :-
	member(X, [4, 11, 18]),
	write('\n    ').
narysuj_puste(X) :-
	member(X, [5, 6, 7, 12, 13, 14, 19, 20, 21]),
	write('    ').

narysuj_pole(25, _) :-
	write('\n\n').
narysuj_pole(X, L) :-
	member(X, L),
	narysuj_zapalke(X),
	X1 is X+1,
	narysuj_pole(X1, L).
narysuj_pole(X, L) :-
	\+ member(X, L),
	narysuj_puste(X),
	X1 is X+1,
	narysuj_pole(X1, L).
narysuj_pole(L) :-
	narysuj_pole(1, L).