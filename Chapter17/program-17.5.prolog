/*
  solve(Goal) :-
     Goal is true given the pure Prolog program defined by clause/2.
*/

     solve(true).
     solve((A,B)) :- solve(A), solve(B).
     solve(A) :- clause(A,B), solve(B).

%	Program 17.5	A meta-interpreter for pure Prolog
