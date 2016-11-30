/*
    solve(Goal,Result) :-
       Given a set of rules of the form rule(A,B,Name), Goal has
       Result yes if it follows from the rules and no if it does not.
       The user is prompted for missing information.
*/
    solve(A,yes) :-  fact(A).
    solve(A,Result) :-  rule(A,B,Name), solve_body(B,Result).
    solve(A,Result) :-  askable(A), solve_askable(A,Result).
    solve(A,no).

    solve_body(A&B,Result) :-
       solve_body(A,ResultA), solve_and(ResultA,B,Result).
    solve_body(A is_true,Result) :-  solve(A,Result).

    solve_and(no,A,no).
    solve_and(yes,B,Result) :-  solve(B,Result).

    solve_askable(A,Result) :-
       not known(A), ask(A,Response), respond(Response,A,Result).

%    The following predicates facilitate interaction with the user.

    ask(A,Response) :-  display_query(A), read(Response).

    respond(yes,A,yes) :-  assert(known_to_be_true(A)).
    respond(no,A,no) :-  assert(known_to_be_false(A)).

    known(A) :-  known_to_be_true(A).
    known(A) :-  known_to_be_false(A).

    display_query(A)   write(A), write(`?  ').

%    Program 17.19: An interactive rule interpreter
