/*
	ackermann(X,Y,A) :-
		A is the value of Ackermann's function for
		the natural numbers X and Y.
*/

	ackermann(0,N,s(N)).
	ackermann(s(M),0,Val) :- ackermann(M,s(0),Val).
	ackermann(s(M),s(N),Val) :-
		ackermann(s(M),N,Val1), ackermann(M,Val1,Val).

%	Program 3.9: Ackermann's function

