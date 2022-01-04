	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Les personnes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
personne(edouard,   homme,  72, retraite(commandant(armee_de_terre)), nice).
personne(agathe,    femme,  58, musicienne(blues),                    nice).
personne(gaston,    homme,  65, retraite(chauffeur(semvat)),          balma).
personne(simone,    femme,  65, retraite(cableur(airbus)),            balma).
personne(georges,   homme,  28, animateur(club_med),                  toulouse).
personne(marie_cecile,femme,35, clerc_de_notaire,                     toulouse).
personne(octave,    homme,  40, huissier,                             nice).
personne(elton,     homme,  10, ecolier,                              toulouse).
personne(vanessa,   femme,  5,  ecolier,                              toulouse).


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%% Les relations de parente %%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
parent(edouard, marie_cecile).
parent(agathe,  marie_cecile).
parent(edouard, octave).
parent(agathe,  octave).
parent(gaston,  georges).
parent(simone,  georges).
parent(georges, elton).
parent(georges, vanessa).
parent(marie_cecile, elton).
parent(marie_cecile, vanessa).

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Règles %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pere(Pere, Enfant) :-
   personne(Pere, homme, _, _, _),
   parent(Pere, Enfant).

mere(Mere, Enfant) :-
    personne(Mere, femme, _, _, _), 
    parent(Mere, Enfant).
	
fille(Fille, Parent) :-
   personne(Fille, femme, _, _, _),
   parent(Parent, Fille).

fils(Fils, Parent) :-
    personne(Fils, homme, _, _, _), 
    parent(Parent, Fils). 
   


% ------------------------------------------------------------------------------------- %
%                     Ajouter vos nouvelles regles a partir d'ici                       %
% ------------------------------------------------------------------------------------- %
 

%%% Personnes domiciliées à Nice %%%

habiteNice(Someone) :-
    personne(Someone, _, _, _, nice).

%%% Personnes qui habitent dans la même ville que leurs deux parents %%%

domicileParents(Enfant) :-
    personne(Enfant, _, _, _, Ville), 
    parent(Parent1, Enfant), 
    parent(Parent2, Enfant), 
    Parent1 \= Parent2, 
    personne(Parent1, _, _, _, Ville), 
    personne(Parent2, _, _, _, Ville). 

%%% Parents ayant au moins un enfant écolier %%%

parent_d_ecolier(Parent) :-
    personne(Parent, _, _, _, _), 
    once((personne(Enfant, _, _, ecolier, _), parent(Parent, Enfant))).
 
 
 