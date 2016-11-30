/*
  solve(Goal,Certainty,Threshold) :-
     Certainty is our confidence, greater than threshold, that Goal is true. 
*/
     solve(true,1,T) :- !.
     solve((A,B),C,T) :- !,
	solve(A,C1,T), solve(B,C2,T), minimum(C1,C2,C).
     solve(A,1,T) :- builtin(A), !, A.
     solve(A,C,T) :-
	clause_cf(A,B,C1), C1 > T, T1 is T/C1,
	solve(B,C2,T1), C is C1 * C2.

   minimum(X,Y,X) :- X =< Y, !.
   minimum(X,Y,Y) :- X > Y, !.

%  Program 17.10   Reasoning with uncertainty with threshold cutoff
