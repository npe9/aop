/*
   solve(A,D,Overflow) :-
	A has a proof tree of depth less than D and Overflow equals 
	no_overflow,or A has a branch in the computation tree longer
	than D, and Overflow contains a list of its first D elements.
*/
	solve(true,D,no_overflow) :- !.
	solve(A,0,overflow([])).
	solve((A,B),D,Overflow) :- !,
		D > 0,
		solve(A,D,OverflowA),
		solve_conjunction(OverflowA,B,D,Overflow).
	solve(A,D,Overflow) :-
		D > 0,
		clause(A,B),
		D1 is D - 1,
		solve(B,D1,OverflowB),
		return_overflow(OverflowB,A,Overflow).
	solve(A,D,no_overflow) :-
		D > 0,
		system(A), A.

	solve_conjunction(overflow(S),B,D,overflow(S)).
	solve_conjunction(no_overflow,B,D,Overflow) :-
		solve(B,D,Overflow).

	return_overflow(no_overflow,A,no_overflow).
	return_overflow(overflow(S),A,overflow([A|S])).

% Program 17.11 :A meta-interpreter detecting a stack overflow
