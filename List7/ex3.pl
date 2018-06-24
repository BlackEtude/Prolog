filozofowie :-
	thread_create(startuj(0), ID1, []),
	thread_create(startuj(1), ID2, []),
	thread_create(startuj(2), ID3, []),
	thread_create(startuj(3), ID4, []),
	thread_create(startuj(4), ID5, []),
	thread_join(ID1, _),
	thread_join(ID2, _),
	thread_join(ID3, _),
	thread_join(ID4, _),
	thread_join(ID5, _).

startuj(ID) :-
	mysl(ID),
	Lewy is ID,
	Prawy is ID + 1 mod 5,
	wydrukuj(ID, "chce podniesc prawy widelec"),
	podnies_widelec(ID, Prawy, prawy),
	wydrukuj(ID, "chce podniesc lewy widelec"),
	podnies_widelec(ID, Lewy, lewy),
	jedz(ID),
	odloz_widelec(ID, Prawy, prawy),
	odloz_widelec(ID, Lewy, lewy),
	startuj(ID).

wydrukuj(ID, Akcja):-
	mutex_lock(druk),
	format('[~w] ~w~n', [ID, Akcja]),
	mutex_unlock(druk),
	sleep(1).

mysl(ID) :-
	wydrukuj(ID, mysli),
	random_between(1, ID, R),
	sleep(R).

jedz(ID):-
	wydrukuj(ID, "je"),
	random_between(1, ID, R),
	sleep(R).

podnies_widelec(ID, Widelec, Strona):-
	atom_concat('w', Widelec, M),
	mutex_lock(M),
	(	Strona = lewy
	->	wydrukuj(ID, 'podniosl lewy widelec')
	;	wydrukuj(ID, 'podniosl prawy widelec')).

odloz_widelec(ID, Widelec, Strona):-
	atom_concat('w', Widelec, M),
	(	Strona = lewy
	->	wydrukuj(ID, 'odklada lewy widelec')
	;	wydrukuj(ID, 'odklada prawy widelec')),
	mutex_unlock(M).