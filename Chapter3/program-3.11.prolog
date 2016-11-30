/*
	list(Xs) :- Xs is a list.
*/

	list([]).
	list([X|Xs]) :- list(Xs).

%	Program 3.11: Defining a list
