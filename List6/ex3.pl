% a^n b^n: e.g. phrase(ab, [a,a,b,b]).
ab --> [].
ab --> [a], ab, [b].

% a^n b^n c^n: e.g. phrase(abc, [a,a,a,b,b,b,c,c,c]).
abc --> a(N), b(N), c(N).

a(0) --> [].
a(N) --> [a], a(N1), {N is N1 + 1}.

b(0) --> [].
b(N) --> [b], b(N1), {N is N1 + 1}.

c(0) --> [].
c(N) --> [c], c(N1), {N is N1 + 1}.

fib(N, F) :-
    fib(N, 1, 0, F).
fib(0, _, P, P) :- !.
fib(1, V, _, V) :- !.
fib(N, V, P, F) :-
    N1 is N-1,
    V1 is V+P,
    fib(N1, V1, V, F).

% a^n b^fib(n), e.g. phrase(bfib, [a,a,a,b,b]).
bfib --> [].
bfib --> a(N), { fib(N, FIB) }, b(FIB).

% Jak append (drugi i trzeci argument zamienione)
% phrase(p([a,b,c]),N,[d,e,f]) produkuje N = [a, b, c, d, e, f].
p([]) --> [].
p([X|Xs]) --> [X], p(Xs).