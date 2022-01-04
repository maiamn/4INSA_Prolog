	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%% Décomposition d'une liste %%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a_gauche(X, L, G) renvoie vraie si la liste G contient les éléments qui sont situés
% à gauche de X dans la liste L 
a_gauche(_, [], []). 
a_gauche(X, [X|_], []):- ! .
a_gauche(X, [Y|R], [Y|G]) :- 
    a_gauche(X, R, G).

% a_droite(X, L, D) renvoie vraie si la liste D contient les éléments qui sont situés
% à droite de X dans la liste L 
a_droite(X, [X|D], D):- !.
a_droite(X, [_|R], D) :- a_droite(X, R, D).

% separer(X, L, G, D) permet de séparer une liste en deux 
% G contient les éléments qui sont à gauche de X dans L 
% D contient les éléments qui sont à droite de X dans L 

separer(_, [], [], []). 
separer(X, [X|R], [], R):- !.
separer(X, [Y|R], [Y|G], D) :- separer(X, R, G, D).









    
    