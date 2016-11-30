/*
  solve(Goal,Certainty) :-
     Certainty is our confidence that Goal is true. 
*/
     solve(true,1) :- !.
     solve((A,B),C) :- !,
	solve(A,C1), solve(B,C2), minimum(C1,C2,C).
     solve(A,1) :- builtin(A), !, A.
     solve(A,C) :-
	clause_cf(A,B,C1), solve(B,C2), C is C1 * C2.

   minimum(X,Y,X) :- X =< Y, !.
   minimum(X,Y,Y) :- X > Y, !.

%  Program 17.9   A meta-interpreter for reasoning with uncertainty
