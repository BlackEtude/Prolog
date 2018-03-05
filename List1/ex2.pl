on(a, b).
on(b, c).
on(c, d).
on(d, e).

above(Block1, Block2) :- 
	on(Block1, Block2).

above(Block1, Block2) :-
	on(Block1, Z), 
	above(Z, Block2).

