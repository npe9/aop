/*			       
	sort(Xs,Ys) :- 
		The list Ys is an ordered permutation of the list Xs.
*/
	
	sort(Xs,Ys) :- permutation(Xs,Ys), ordered(Ys).

	permutation(Xs,[Z|Zs]) :- select(Z,Xs,Ys), permutation(Ys,Zs).
	permutation([],[]).

	ordered([]).
	ordered([X]).
	ordered([X,Y|Ys]) :- X =< Y, ordered([Y|Ys]).

	select(X,[X|Xs],Xs).
	select(X,[Y|Ys],[Y|Zs]) :- select(X,Ys,Zs).

%	Program 3.20 Permutation sort
