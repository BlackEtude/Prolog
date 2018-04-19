insert_even(X, [Y|Xs], [Y,X|Xs]).
insert_even(X, [Y,Z|Xs], [Y,Z|Ys]) :- 
	insert_even(X, Xs, Ys).

insert_odd(X, Xs, [X|Xs]).
insert_odd(X, [Y,Z|Xs], [Y,Z|Ys]) :- 
	insert_odd(X, Xs, Ys).

even_permutation([],[]).
even_permutation([X|Xs], Ys) :-
    even_permutation(Xs, Zs),
    insert_odd(X, Zs, Ys).
even_permutation([X|Xs], Ys) :-
    odd_permutation(Xs, Zs),
    insert_even(X, Zs, Ys).

odd_permutation([X|Xs], Ys) :-
    odd_permutation(Xs, Zs),
    insert_odd(X, Zs, Ys).
odd_permutation([X|Xs], Ys) :-
    even_permutation(Xs, Zs),
    insert_even(X, Zs, Ys).
