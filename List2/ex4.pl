ma(adam, laptop).
ma(tomasz, auto).
ma(magda, rower).
ma(kasia, ksiazka).
ma(michal, kubek).

daje(1, adam, laptop, magda).
daje(1, tomasz, auto, magda).
daje(3, kasia, ksiazka, magda).
daje(4, magda, laptop, kasia).
daje(8, magda, ksiazka, adam).
daje(9, magda, rower, monika).


ma(Kiedy, Kto, Co) :-		%% mial od poczatku oraz nie oddal
	ma(Kto, Co), 
	daje(Koniec, _, _, _), 
	zatrzymal(0, Koniec, Kto, Co), 
	between(0, Koniec, Kiedy).

ma(Kiedy, Kto, Co) :-		%% dostal oraz oddal
	daje(Start, _, Co, Kto), 
	daje(Koniec, _, Co, _),
	X is Koniec-1,  
	zatrzymal(Start, X, Kto, Co), 
	between(Start, X, Kiedy).

ma(Kiedy, Kto, Co) :-		%% dostal oraz nie oddal
	daje(Kiedy, _, Co, Kto),  
	\+ (daje(Y, Kto, Co, _), Y > Kiedy).

zatrzymal(Start, Koniec, Kto, Co) :-
	\+ (
		between(Start, Koniec, N),
		daje(N, Kto, Co, _)
	), !.
