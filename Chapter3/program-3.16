/*
	reverse(List,Tsil):-
		Tsil is the result of reversing the list List.
*/
	% a: Naive reverse
	reverse([],[]).
	reverse([X|Xs],Zs) :- reverse(Xs,Ys), append(Ys,[X],Zs).

	% b: Reverse-accumulate

	reverse(Xs,Ys):- reverse(Xs,[],Ys).
	reverse([X|Xs],Acc,Ys) :- reverse(Xs,[X|Acc],Ys).
	reverse([],Ys,Ys).

%	Program 3.16: Reversing a list
