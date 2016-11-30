/*
   union(Xs,Ys,Us) :- Us is the union of the elements in Xs and Ys. 
*/

union([X|Xs],Ys,Us) :- member(X,Ys), union(Xs,Ys,Us).
union([X|Xs],Ys,[X|Us]) :- nonmember(X,Ys), union(Xs,Ys,Us).
union([],Ys,Ys).

%  Program 13.1    Finding the union of two lists