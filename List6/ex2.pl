:- consult('ex1.pl').
:- consult('scanner.pl').
:- consult('interpreter.pl').

wykonaj(Plik) :-
    open(Plik, read, Strumien),
	scanner(Strumien, Tokeny),
	close(Strumien),
    phrase(program(Program), Tokeny),
	interpreter(Program).