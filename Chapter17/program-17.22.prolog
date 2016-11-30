/*
    explain(Goal)  :-
       Explains how the goal Goal was proved.
*/
    explain(Goal) :-  monitor(Goal,Proof), interpret(Proof).

%    monitor(Goal,Proof)   See Program 17.21.

    interpret(ProofA&ProofB) :-
       interpret(ProofA), interpret(ProofB).
    interpret(failed(A,Branches)) :-
       nl, writeln([A,` has failed with the following failure branches:']),
       interpret(Branches).
    interpret([Fail|Fails]) :-
       interpret(Fail), nl, write(`NEW BRANCH'), nl,
       interpret(Fails).
    interpret([ ]).
    interpret(fact(A)) :-
       nl, writeln([A,` is a fact in the database.']).
    interpret(A because B with Proof) :-
       nl, writeln([A,` is proved using the rule']),
       display_rule(rule(A,B)), interpret(Proof).
    interpret(no_match(A)) :-
       nl, writeln([A,` has no matching fact or rule in the rule base.']).
    interpret(unsearched) :-
       nl, writeln([`The rest of the conjunct is unsearched.']).

    display_rule(rule(A,B)) :-
       write(`IF '), write_conjunction(B), writeln([`THEN ',A ]).

    write_conjunction(A&B) :-
       write_conjunction(A), write(` AND '),
       write_conjunction(B).

    write_conjunction(A is_true) :-  write(A).

     writeln([X|Xs]) :- write(X), writeln(Xs).
     writeln([]) :- nl.

%    Program 17.22: Explaining a proof
