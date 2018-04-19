rybki(Kto) :- zagadka(Domy), member( [_, _, Kto, rybki, _, _], Domy), !.

zagadka(Domy) :-
	Domy = [[1, _, _, _, _, _], [2, _, _, _, _, _], [3, _, _, _, _, _], [4, _, _, _, _, _], [5, _, _, _, _, _]], 
	member([1, _, norweg, _, _, _], Domy),
	member([3, _, _, _, mleko, _], Domy),  
	member([X1, _, norweg, _, _, _], Domy), 
	member([Y1, niebieski, _, _, _, _], Domy),
	(X1 is Y1+1 ; X1 is Y1-1), 
	member([_, czerwony, anglik, _, _, _], Domy), 
	member([_, _, dunczyk, _, herbata, _], Domy), 
	member([_, zolty, _, _, _, cygara], Domy),
	member([_, _, niemiec, _, _, fajka], Domy), 
	member([X2, zielony, _, _, _, _], Domy), 
	member([Y2, bialy, _, _, _, _], Domy), 
	X2 is Y2-1, 
	member([X3, _, _, _, _, light], Domy), 
	member([Y3, _, _, koty, _, _], Domy), 
	(X3 is Y3-1 ; X3 is Y3+1), 
	member([X4, _, _, _, _, light], Domy), 
	member([Y4, _, _, _, woda, _], Domy), 
	(X4 is Y4+1 ; X4 is Y4-1), 
	member([_, _, szwed, psy, _, _], Domy), 
	member([_, _, _, ptaki, _, bezfiltra], Domy), 
	member([_, _, _, _, piwo, mentolowe], Domy),
	member([_, zielony, _, _, kawa, _], Domy),
	member([X5, _, _, konie, _, _], Domy), 
	member([Y5, zolty, _, _, _, _], Domy), 
	(X5 is Y5+1 ; X5 is Y5-1).