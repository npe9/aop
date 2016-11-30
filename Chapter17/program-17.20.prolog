/*
       monitor(Goal) :-
           Succeeds if a result of yes is returned from solving Goal
           at the solve level, or when the end of the computation is reached.
*/
       monitor(Goal) :-  solve(Goal,Result,[ ]), filter(Result).
       monitor(Goal).

       filter(yes).
       % filter(no) :-  fail.

/*
       solve(Goal,Result,Rules) :-
           Given a set of rules of the form rule(A,B,Name), Goal has
           Result yes if it follows from the rules and no if it does not.
           Rules is the current list of rules that have been used.
*/
       solve(A,yes,Rules) :-  fact(A).
       solve(A,Result,Rules) :-
           rule(A,B,Name), RulesB = [NamejRules],
           solve_body(B,Result,RulesB).
       solve(A,no,Rules).

       solve_body(A&B,Result,Rules) :-
           solve_body(A,ResultA,Rules),
           solve_and(ResultA,B,Result,Rules).
       solve_body(A is_true,Result,Rules) :-   solve(A,Result,Rules).

       solve_and(no,A,no,Rules).
       solve_and(yes,B,Result,Rules) :-  solve(B,Result,Rules).

%       Program 17.20: A two-level rule interpreter carrying rules
