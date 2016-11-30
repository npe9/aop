/*
   delete(Xs,X,Ys) :- 
	Ys is the result of deleting all occurrences of X from the list Xs.
*/
     delete([X|Xs],X,Ys) :- !, delete(Xs,X,Ys).
     delete([X|Xs],Z,[X|Ys]) :- Y \== X, !, delete(Xs,Z,Ys).
     delete([],X,[]).

%   Program 11.9a   Deleting elements from a list
