/*	
    isort(Xs,Ys) :- Buggy insertion sort.
*/
	isort([X|Xs],Ys) :-
	   isort(Xs,Zs), insert(X,Zs,Ys).
	isort([],[]).

	insert(X,[Y|Ys],[X,Y|Ys]) :- X >= Y.
	insert(X,[Y|Ys],[Y|Zs]) :- X > Y, insert(X,Ys,Zs).
	insert(X,[],[X]).

%  Program 17.13   An incorrect and incomplete insertion sort
