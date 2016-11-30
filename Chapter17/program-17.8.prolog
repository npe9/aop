/*  
   solve(Goal,Tree) :-		       
	Tree is a proof tree for Goal given the program 
	defined by clause/2.
*/
    solve(true,true) :- !.
    solve((A,B),(ProofA,ProofB)) :- !,
       solve(A,ProofA), solve(B,ProofB).
    solve(A,(A:-builtin)) :- builtin(A), !, A.
    solve(A,(A:-Proof)) :-
       clause(A,B), solve(B,Proof).

% Program 17.8	A meta-interpreter for building a proof tree
