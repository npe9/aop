/*
    monitor(Goal,Proof) :-
       Succeeds if a result of yes is returned from solving Goal at the
       solve level, in which case Proof is a proof tree representing the
       successful computation, or when the end of the computation is reached,
       in which case Proof is a list of failure branches since the last success.
*/
    monitor(Goal,Proof) :-
       set_search_tree, solve(Goal,Result,Proof),
       filter(Result,Proof).
    monitor(Goal,Proof) :-
       collect_proof(P), reverse(P,[ ],P1),
       Proof = failed(Goal,P1).

    filter(yes,Proof) :-  reset_search_tree.
    filter(no,Proof) :-  store_proof(Proof), fail.

/*
    solve(Goal,Result,Proof)  :-
       Given a set of rules of the form rule(A,B,Name), Goal has
       Result yes if it follows from the rules and no if it does not.
       Proof  is a proof tree if the result is yes and a failure branch
       of the search tree if the result is no.
*/
    :- op(40,xfy,because).
    :- op(30,xfy,with).

    solve(A,yes,Tree) :-  fact(A), Tree = fact(A).
    solve(A,Result,Tree) :-
       rule(A,B,Name), solve_body(B,Result,Proof),
       Tree = A because B with Proof.
    solve(A,no,Tree) :-
       not fact(A), not rule(A,B,Name), Tree = no_match(A).

    solve_body(A&B,Result,Proof) :-
       solve_body(A,ResultA,ProofA),
       solve_and(ResultA,B,Result,ProofB),
       Proof = ProofA & ProofB.
    solve_body(A is_true,Result,Proof) :-  solve(A,Result,Proof).

    solve_and(no,A,no,unsearched).
    solve_and(yes,B,Result,Tree) :-  solve(B,Result,Tree).

%  The following predicates use side effects to record and remove 
%  branches of the search tree.

    collect_proof(Proof) :-  retract(`search tree'(Proof)).

    store_proof(Proof) :- 
       retract(`search tree'(Tree)),
       assert(`search tree'([ProofjTree])).

    set_search_tree :-  assert(`search tree'([ ])).

    reset_search_tree :- 
       retract(`search tree'(Proof)),
       assert(`search tree'([ ])).

	reverse([],[]).
	reverse([X|Xs],Zs) :- reverse(Xs,Ys), append(Ys,[X],Zs).

%    Program 17.21: A two-level rule interpreter with proof trees
