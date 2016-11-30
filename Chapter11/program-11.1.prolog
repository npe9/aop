/*
   merge(Xs,Ys,Zs) :- 
	Zs is an ordered list of integers obtained from merging
	the ordered lists of integers Xs and Ys.
*/
     merge([X|Xs],[Y|Ys],[X|Zs]) :-
	X < Y, merge(Xs,[Y|Ys],Zs).
     merge([X|Xs],[Y|Ys],[X,Y|Zs]) :-
	X =:= Y, merge(Xs,Ys,Zs).
     merge([X|Xs],[Y|Ys],[Y|Zs]) :-
	X > Y, merge([X|Xs],Ys,Zs).
     merge(Xs,[],Xs).
     merge([],Xs,Xs).

%  Program 11.1    Merging ordered lists
