:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_files)).
:- use_module(form).
:- use_module(queens).
:- http_handler(root(queens), handler_queens, []).
:- http_handler(root(solution), handler_solution, []).
:- http_handler(root(.), http_reply_from_files('pic', []), [prefix]).

server(Port) :-
	http_server(http_dispatch, [port(Port)]).

handler_queens(_Request) :-
	format('Content-type: text/html~n~n'),
	format('<!DOCTYPE html><html>~n', []),
	format('<head><title>Queens problem</title>~n', []),
	format('<meta http-equiv="content-type" content="text/html; charset=UTF-8">~n', []),
	format('</head>~n<body>~n', []),
    format('<h1>Gimme size of the problem</h1>~n', []),
	build_form([action(solution), method(post)],
		   [label(size, 'Size:'), input(text, size), br,
			input(submit)]),
	format('</body>~n</html>', []).

handler_solution(Request) :-
	member(method(post), Request), !,
	http_read_data(Request, Data, []),
    member(size = Value, Data),
    atom_number(Value, N),
    queens(N, P),
	reply_html_page(title('Solution'), [h1('Solution'), table([\line(N, P)])]).

line(_, []) --> [].
line(N, [H|T]) -->
    html(tr(\cell(1, H, N))),
    line(N, T).

cell(X, _, N) --> {X is N+1}, [].
cell(Q, Q, N) -->
    html(td(img(src('queen.png')))),
    {X is Q+1},
    cell(X, Q, N).
cell(X, Q, N) -->
    html(td(img(src('empty.png')))),
    {X1 is X+1},
    cell(X1, Q, N).