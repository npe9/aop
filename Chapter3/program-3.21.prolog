/*
	sort(Xs,Ys) :- 
		The list Ys is an ordered permutation of the list Xs.
*/

	sort([X|Xs],Ys) :- sort(Xs,Zs), insert(X,Zs,Ys).
	sort([],[]).

	insert(X,[],X).
	insert(X,[Y|Ys],[Y|Zs]) :- X > Y, insert(X,Ys,Zs).
	insert(X,[Y|Ys],[X,Y|Ys]) :- X =< Y.

%	Program 3.21: Insertion sort
