lista(N,X) :-
    numlist(1,N,L),
    lista(X,L,[],[],n).

lista(X,[],[],[],n) :-
    X = [].

lista(X,L,LN,LP,n) :-
    select(Y,LN,LN1),
    X = [Y|X1],
    lista(X1,L,LN1,LP,p).

lista(X,[Z|L],LN,LP,n) :-
    X = [Z|X1],
    lista(X1,L,LN,[Z|LP],p).

lista(X,L,LN,LP,p) :-
    select(Y,LP,LP1),
    X = [Y|X1],
    lista(X1,L,LN,LP1,n).

lista(X,[Z|L],LN,LP,p) :-
    X = [Z|X1],
    lista(X1,L,[Z|LN],LP,n).

% 1 - inf 18
% 2 - inf 32
% 3 - inf 79
% 4 - inf 282
% 5 - inf 1356
% 6 - inf 8070
% 7 - inf 56517
% 8 - inf 453164
% 9 - inf 4088362
% 10 - inf 40974840
% 11 - inf 451618971
% 12 - inf 5428949730

%% isomorphic solution
% lista(N,X) :-
%     numlist(1,N,LN),
%     numlist(1,N,LP),
%     stworz_liste(X,LN,LP).
%
% stworz_liste(L,[],[]) :-
%     L = [].
%
% stworz_liste(X,[ZN|LN],LP) :-
%     select(ZP,LP,LP1),
%     X = [ZN,ZP|X1],
%     stworz_liste(X1,LN,LP1).