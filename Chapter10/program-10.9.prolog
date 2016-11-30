/*
    X : Y :- X or Y.
*   
*   Note: used ':' instead of ';' as ';' is a system predicate.
*/
	:- op(1100,xfy,[':']).

    X : Y :- X.
    X : Y :- Y.

%   Program 10.9    Logical disjunction
