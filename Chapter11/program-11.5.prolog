/*
    sort(Xs,Ys) :- 
	Ys is an ordered permutation of the list of integers Xs.
*/
    sort(Xs,Ys) :-
	append(As,[X,Y|Bs],Xs),
	X > Y,
	!,
	append(As,[Y,X|Bs],Xs1),
	sort(Xs1,Ys).
    sort(Xs,Xs) :-
	ordered(Xs), !.

	ordered([]).
	ordered([X]).
	ordered([X,Y|Ys]) :- X =< Y, ordered([Y|Ys]).

%  Program 11.5   Interchange sort
