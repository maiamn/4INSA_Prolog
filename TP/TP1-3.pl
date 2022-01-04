	% Premiere definition de factorielle(N)
	% 2 clauses : cas trivial et clause recursive
	% factorielle(0) = 1 
	% factorielle(N) = N*factorielle(N-1)

	
fact(0,1) :- !.				

fact(N,F) :-				
	N1 is N-1,
	fact(N1,F1),
	F is N*F1.


% ------------------------------------------------------------------------------------- %
%                     Ajouter vos nouvelles regles a partir d'ici                       %
% ------------------------------------------------------------------------------------- %

%%% Nouvelle version factorielle %%%

factorielle(0, 1).
factorielle(N, F) :-
    N>0, 
    N1 is N-1,
	fact(N1,F1),
	F is N*F1.

%%% Somme d'entiers d'une liste %%%

somme([], 0).
somme([X|R], S) :-
    somme(R, SR), 
    S is X+SR.

%%% Nouvelle version somme d'entiers d'une liste %%%
somme2([], S,S).
somme2([X|L],I,S) :-
	J is X+I,
	somme2(L,J,S).

