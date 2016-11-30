/*
	satisfiable(Formula) :- 
		There is a true instance of the Boolean formula Formula.	     
*/
	:- op(950, xfx, [&]).
	:- op(950, xfx, [|]).
	:- op(900,  fx, [~]).


	satisfiable(true).
	satisfiable(X & Y) :- satisfiable(X), satisfiable(Y).
	satisfiable(X | Y) :- satisfiable(X).
	satisfiable(X | Y) :- satisfiable(Y).
	satisfiable((~ X)) :-  invalid(Y).
/*
	invalid(Formula) :-	
		There is a false instance of the Boolean formula Formula.	  
*/
	invalid(false).
	invalid(X | Y) :- invalid(X), invalid(Y).
	invalid(X & Y) :- invalid(X).
	invalid(X & Y) :- invalid(Y).
	invalid((~ X)) :- satisfiable(X).

%	Program 3.32: Satisfiability of Boolean formulae
