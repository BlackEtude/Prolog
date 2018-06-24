:-use_module(library(url)).
:-use_module(library(sgml)).
:-use_module(library(xpath)).

serwery(NazwaPliku, Lista) :-
    load_html(NazwaPliku, DOM, []),
    setof(URL, znajdz_serwery(DOM, URL), Lista).

znajdz_serwery(DOM, URL) :-
    xpath(DOM, //(a(@href)), HREF),
    parse_url(HREF, localhost, Parse),
    member(host(URL), Parse).

