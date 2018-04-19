wariancja(L, D) :-
	L \= [],
	length(L, Length),
	avg(L, 0, Average, Length),
	wariancja(L, 0, Length, Average, D).

wariancja([], Var, Length, _, D) :-
    D is Var/Length.

wariancja([X|L], Var, Length, Average, D) :-
    VarX is Var + Average*Average + X*X - 2*Average*X,
    wariancja(L, VarX, Length, Average, D).

avg([], Sum, Average, Length) :-
    Average is Sum/Length.

avg([X|L], Sum, Average, Length) :-
    SumX is Sum + X,
    avg(L, SumX, Average, Length).