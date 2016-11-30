/*
	length(Xs,N) :- The list Xs has N elements.
*/

	length([],0).
	length([X|Xs],s(N)) :- length(Xs,N).

%	Program 3.17: Determining the length of a list
