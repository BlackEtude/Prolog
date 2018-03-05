/* do 6: sprawdzać zakres, pilnować. Zakres i zmienna - wypisywać wszyskie liczy pierwsze z tego zakresu*/
/* Testowanie dla 1000000 do 1000020 */


is_prime(2).
is_prime(3).
is_prime(X) :-
	X < 2,
	fail.
is_prime(X) :- 
	X > 3, 
	X mod 2 =\= 0, 
	\+ factor(X, 3).

prime(LO, HI, N) :- 
	between(LO, HI, N), 
	is_prime(N).

factor(N, X) :- 
	N mod X =:= 0.
factor(N, X) :-
	X * X < N, 
	factor(N, X+2).