/*
       monitor(Goal) :-
           Succeeds if a result of yes is returned from solving Goal
          at the solve level, or when the end of the computation is reached.
*/
       monitor(Goal) :-  solve(Goal,Result), filter(Result).
       monitor(Goal).

       filter(yes).
       % filter(no)   fail.

/*
       solve(Goal,Result) :-
           Given a set of rules of the form rule(A,B,Name), Goal has
           Result yes if it follows from the rules and no if it does not.
*/
       solve(A,yes) :-  fact(A).
       solve(A,Result) :-  rule(A,B,Name), solve_body(B,Result).
       solve(A,no).

       solve_body(A&B,Result) :-
           solve(A,ResultA), solve_and(ResultA,B,Result).
       solve_body(A is_true,Result)   solve(A,Result).

       solve_and(no,A,no).
       solve_and(yes,B,Result)   solve(B,Result).

%   Program 17.18: A skeleton two-level rule interpreter
