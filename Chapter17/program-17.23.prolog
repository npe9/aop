/*
  monitor(Goal,Proof) :-
    Succeeds if a result of yes is returned from solving Goal at the
    solve level, in which case Proof  is a proof tree representing the
    successful computation, or when the end of the computation is reached,
    in which case Proof  is a list of failure branches since the last success.
*/

monitor(Goal,Proof) :-
    set_search_tree, solve(Goal,Result,[ ],Proof),
    filter(Result,Proof).
monitor(Goal,Proof) :-
    collect_proof(P), reverse(P,[ ],P1),
    Proof = failed(Goal,P1).

filter(yes,Proof) :-  reset_search_tree.
filter(no,Proof) :-  store_proof(Proof), fail.

/*
solve(Goal,Result,Rules,Proof) :-
    Given a set of rules of the form rule(A,B,Name), Goal has
    Result yes if it follows from the rules and no if it does not.
    Rules is the current list of rules that have been used.
    Proof  is a proof tree if the result is yes and a failure branch
    of the search tree if the result is no.
*/

:- op(40,xfy,because).
:- op(30,xfy,with).

solve(A,yes,Rules,Tree) :-  fact(A), Tree = fact(A).
solve(A,Result,Rules,Tree) :-
    rule(A,B,Name), RulesB = [NamejRules],
    solve_body(B,Result,RulesB,Proof),
    Tree = A because B with Proof.
solve(A,Result,Rules,Tree) :-
    askable(A), solve_askable(A,Result,Rules), Tree = user(A).
solve(A,no,Rules,Tree) :-
    not fact(A), not rule(A,B,Name), Tree = no_match(A).

solve_body(A&B,Result,Rules,Proof) :-
    solve_body(A,ResultA,Rules,ProofA),
    solve_and(ResultA,B,Result,Rules,ProofB),
    Proof = ProofA & ProofB.
solve_body(A is_true,Result,Rules,Proof) :-
    solve(A,Result,Rules,Proof).

solve_and(no,A,no,Rules,unsearched).
solve_and(yes,B,Result,Rules,Tree) :-  solve(B,Result,Rules,Tree).

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

%  The following predicates facilitate interaction with the user.

ask(A,Response) :-  display_query(A), read(Response).

respond(yes,A,yes) :-  assert(known_to_be_true(A)).
respond(no,A,no) :-  assert(known_to_be_false(A)).
respond(why,A,[RulejRules]) :-
    display_rule(Rule), ask(A,Answer), respond(Answer,A,Rules).
respond(why,A,[ ]) :-
    writeln([`No more explanation possible']), ask(A,Answer),
    respond(Answer,A,[ ]).

known(A) :-  known_to_be_true(A).
known(A) :-  known_to_be_false(A).

display_query(A) :-  write(A), write(`?  ').

    display_rule(rule(A,B)) :-
       write(`IF '), write_conjunction(B), writeln([`THEN ',A ]).

    write_conjunction(A&B) :-
       write_conjunction(A), write(` AND '),
       write_conjunction(B).

    write_conjunction(A is_true) :-  write(A).


     writeln([X|Xs]) :- write(X), writeln(Xs).
     writeln([]) :- nl.

%  Program 17.23: An explanation shell


