
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENTREES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hors_d_oeuvre(artichauts_melanie).
hors_d_oeuvre(truffes_sous_le_sel).
hors_d_oeuvre(cresson_oeuf_poche).

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VIANDES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

viande(grillade_de_boeuf).
viande(poulet_au_tilleul).

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% POISSONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

poisson(bar_aux_algues).
poisson(truite_meuniere).

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DESSERTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


dessert(sorbet_aux_poires).
dessert(fraises_chantilly).
dessert(melon_surprise).

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BOISSONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

boisson(eau_minerale(hepar)).
boisson(vin_rouge(morgon)).
boisson(biere(gueuze)).

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VALEURS CALORIFIQUES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

calories(artichauts_melanie, 150).
calories(truffes_sous_le_sel, 212).
calories(cresson_oeuf_poche, 202).
calories(grillade_de_boeuf, 532).
calories(poulet_au_tilleul, 400).
calories(bar_aux_algues, 292).
calories(truite_meuniere,254).
calories(sorbet_aux_poires,223).
calories(fraises_chantilly,289).
calories(melon_surprise, 122).
calories(eau_minerale(hepar),0).
calories(vin_rouge(morgon), 175).
calories(biere(gueuze),250).



% ------------------------------------------------------------------------------------- %
%                     Ajouter vos nouvelles regles a partir d'ici                       %
% ------------------------------------------------------------------------------------- %
 

%%% Règles Plat si c'est une viande ou un poisson) %%%

plat(P) :-
    viande(P) ; poisson(P).

%%% Un repas est composé d'une entrée, d'un plat, d'un dessert et d'une boisson %%%

repas([E,P,D,B]) :-
    hors_d_oeuvre(E), 
    plat(P), 
    dessert(D),
    boisson(B).

%%% Calculer la valeur calorifique d'un repas %%%
valeur_calorifique([], 0).
valeur_calorifique([X|R], S) :-
    calories(X, SX), 
    valeur_calorifique(R, SR), 
    S is SX+SR. 

%%% Trouver un repas léger %%%
repas_leger(R) :-
    repas(R), 
    valeur_calorifique(R, S), 
    S<600. 

%%% Trouver un repas léger avec un total calorifique inférieur à L %%%
repas_leger(R, X, L) :-
    repas(R), 
    valeur_calorifique(R, X), 
    X<L. 

