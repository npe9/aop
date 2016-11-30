/*
        Rule interpreter for counting reductions
*/
        solve(A,1) :-  fact(A).
        solve(A,N) :-  rule(A,B,Name), solve_body(B,NB), N is NB+1.

        solve_body(A&B,N) :-
           solve_body(A,NA), solve_body(B,NB), N is NA+NB.
        solve_body(A is_true,N) :-  solve(A,N).

%        Sample rule base

        rule(oven(Dish,top),pastry(Dish) is_true
           & size(Dish,small) is_true,place1).
        rule(oven(Dish,middle),pastry(Dish) is_true
           & size(Dish,big) is_true,place2).
        rule(oven(Dish,middle),main_meal(Dish) is_true,place3).
        rule(oven(Dish,bottom),slow_cooker(Dish) is_true,place4).
        rule(pastry(Dish),type(Dish,cake) is_true,pastry1).
        rule(pastry(Dish),type(Dish,bread) is_true,pastry2).
        rule(main_meal(Dish),type(Dish,meat) is_true,main_meal).
        rule(slow_cooker(Dish),type(Dish,milk_pudding)
           is_true,slow_cooker).

        should_fold(solve(oven(D,P),N),oven(D,P,N)).
        should_fold(solve(pastry(D),N),pastry(D,N)).
        should_fold(solve(main_meal(D),N),main_meal(D,N)).
        should_fold(solve(slow_cooker(D),N),slow_cooker(D,N)).
        should_fold(solve(type(D,P),N),type(D,P,N)).
        should_fold(solve(size(D,P),N),size(D,P,N)).

        should_unfold(solve_body(G,N)).
        should_unfold(rule(A,B,Name)).

        program(rule_interpreter,[(solve(A1,1) :-  fact(A1)),
           (solve(A2,N) :-  rule(A2,B,Name), solve_body(B,NB), N is NB+1)]).

%        Program 18.5: Specializing a rule interpreter
