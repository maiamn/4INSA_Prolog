	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Dispatch et quicksort %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dispatch(_, [], [], []). 

dispatch(X, [Y|R], [Y|Infeg], Sup) :-
    Y =< X, 
    dispatch(X, R, Infeg, Sup).

dispatch(X, [Y|R], Infeg, [Y|Sup]) :-
    Y > X, 
    dispatch(X, R, Infeg, Sup).


quicksort([], []).

quicksort([X|R], S) :-
    dispatch(X, R, Infg, Sup), 
    quicksort(Infg, InfgS), 
    quicksort(Sup, SupS), 
    append(InfgS, [X], A), 
    append(A, SupS, S).