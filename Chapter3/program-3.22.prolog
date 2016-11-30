/*
	sort(Xs,Ys) :- 
		The list Ys is an ordered permutation of the list Xs.
*/
	quicksort([X|Xs],Ys) :-
		partition(Xs,X,Littles,Bigs),
		quicksort(Littles,Ls),
		quicksort(Bigs,Bs),
		append(Ls,[X|Bs],Ys).
	quicksort([],[]).

	partition([X|Xs],Y,[X|Ls],Bs) :- X =< Y, partition(Xs,Y,Ls,Bs).
	partition([X|Xs],Y,Ls,[X|Bs]) :- X >  Y, partition(Xs,Y,Ls,Bs).
	partition([],Y,[],[]).

	append([],Ys,Ys).
	append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).

%	Program 3.22: Quicksort
