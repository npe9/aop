/*
     nd_reverse(Xs,Ys) :- 
	Ys is the reversal of the list obtained by 
	removing duplicate elements from the list Xs.
*/
     nd_reverse(Xs,Ys) :- nd_reverse(Xs,[],Ys).

     nd_reverse([X|Xs],Revs,Ys) :-
	member(X,Revs), nd_reverse(Xs,Revs,Ys).
     nd_reverse([X|Xs],Revs,Ys) :-
	nonmember(X,Revs), nd_reverse(Xs,[X|Revs],Ys).
     nd_reverse([],Ys,Ys).

     nonmember(X,[Y|Ys]) :- X \== Y, nonmember(X,Ys).
     nonmember(X,[]).

%  Program 7.10   Reversing with no duplicates
