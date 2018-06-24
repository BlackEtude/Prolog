:- consult('ex1.pl').

split(IN, OUT1, OUT2) :-
	freeze(IN,
		(IN = [H | T]
		->	OUT1 = [H | T1],
			split(T, OUT2, T1)
		;	OUT1 = [],
			OUT2 = []
		)).

merge_sort(IN, OUT) :-
	freeze(IN,
		(IN = [H | T]
		->	freeze(T,
			(T \= []
			->	split(IN, L, R),
				merge_sort(L, M1),
				merge_sort(R, M2), !,
				merge(M1, M2, OUT)
			;	OUT = [H]
			))
		; OUT = [])).