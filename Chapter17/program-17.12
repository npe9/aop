/*	
   isort(Xs,Ys) :-
	Ys is an ordered permutation of Xs. Nontermination program.
*/

	isort([X|Xs],Ys) :-
	   isort(Xs,Zs), insert(X,Zs,Ys).
	isort([],[]).

	insert(X,[Y|Ys],[X,Y|Ys]) :- X < Y.
	insert(X,[Y|Ys],[Y|Zs]) :- X >= Y, insert(Y,[X|Ys],Zs).
	insert(X,[],[X]).

% Program 17.12   A nonterminating insertion sort
