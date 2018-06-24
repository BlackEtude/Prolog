key(read).
key(write).
key(if).
key(then).
key(else).
key(fi).
key(while).
key(do).
key(od).
key(and).
key(or).
key(mod).
white(' ').
white('\n').
white('\t').

scanner(Strumien, Tokeny) :-
    current_input(In),
    set_input(Strumien),
    skanuj(Tokeny),
    set_input(In).

skanuj(X) :-
    get_char(C),
    skanuj_dalej(C, X), !.

skanuj_dalej(end_of_file, []) :- !.
skanuj_dalej(C1, X) :-
    white(C1), !,
    get_char(C2),
    skanuj_dalej(C2, X).
skanuj_dalej(C1, [H|T]) :-
    kategoria(C1, Kat),
    skanuj_slowo(C1, C2, '', S, Kat),
    label(H, S, Kat),
    skanuj_dalej(C2, T).

skanuj_slowo(end_of_file, end_of_file, N, N, _) :- !.
skanuj_slowo(C, C, N, N, _) :-
    white(C), !.
skanuj_slowo(C, C, N, N, Kat) :-
    \+ kategoria(C, Kat), !.
skanuj_slowo(C1, C3, N1, N, Kat) :-
    atom_concat(N1, C1, N2),
    get_char(C2),
    skanuj_slowo(C2, C3, N2, N, Kat).

kategoria(K, Kat) :-
    char_type(K, upper),
    Kat = id.
kategoria(K, Kat) :-
    char_type(K, lower),
    Kat = key.
kategoria(K, Kat) :-
    member(K, [;, +, -, *, /,'(', ')', <, >, =, :]),
    Kat = sep.
kategoria(K, Kat) :-
    atom_number(K, N),
    integer(N),
    Kat = int.

label(H, S, id) :-
    H = id(S).
label(H, S, key) :-
    key(S),
    H = key(S).
label(H, S, sep) :-
    member(S, [ ;, +, -, *, /,'(', ')', <, >, =<, >=, :=, =, /=]),
    H = sep(S).
label(H, S, int) :-
    atom_number(S, N),
    integer(N),
    N >= 0,
    H = int(N).