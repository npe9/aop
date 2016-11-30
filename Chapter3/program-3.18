/*
	delete(List,X,HasNoXs) :-
		The list HasNoXs is the result of removing all
		occurrences of X from the list List.
*/

	delete([X|Xs],X,Ys) :- delete(Xs,X,Ys).
	delete([X|Xs],Z,[X|Ys]) :- X \== Z, delete(Xs,Z,Ys).
	delete([],X,[]).

%	Program 3.18: Deleting all occurrences of an element from a list
