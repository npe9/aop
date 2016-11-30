/*
   union_intersect(Xs,Ys,Us) :- 
	Us and is are the union and intersection, respectively, of the
		elements in Xs and Ys.  
*/

union_intersect([X|Xs],Ys,Us,[X|Is]) :- 
	member(X,Ys), union_intersect(Xs,Ys,Us,Is).
union_intersect([X|Xs],Ys,[X|Us],Is) :- 
	nonmember(X,Ys), union_intersect(Xs,Ys,Us,Is).
union_intersect([],Ys,Ys,[]).

%  Program 13.3    Finding the union and intersection of two lists