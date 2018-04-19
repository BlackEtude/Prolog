max_sum(L, S) :-
    max_sum(L, S, 0, 0).

max_sum([], S, _, S).

max_sum([X|L], Sum, LocalMax, Max) :-
    MaxEndHere is max(X, LocalMax + X),
    MaxSoFar is max(Max, MaxEndHere),
	max_sum(L, MaxEndHere, MaxSoFar, Sum).