/*	
    translate(Grammar,Program) :-
	Program is the Prolog equivalent of the context-free
	grammar Grammar.
*/
        translate([Rule|Rules],[Clause|Clauses]) :-
           translate_rule(Rule,Clause),
           translate(Rules,Clauses).
        translate([ ],[ ]).

/*
        translate_rule(GrammarRule,PrologClause) :-
           PrologClause is the Prolog equivalent of the grammar
           rule GrammarRule.
*/
	translate_rule((Lhs --> Rhs),(Head :- Body)) :-
	   translate_head(Lhs,Head,Xs\Ys),
	   translate_body(Rhs,Body,Xs\Ys),!.

        translate_head(A,A1,Xs) :-
           translate_goal(A,A1,Xs).

	translate_body((A,B),(A1,B1),Xs\Ys) :-
	   !, translate_body(A,A1,Xs\Xs1), translate_body(B,B1,Xs1\Ys).
        translate_body(A,A1,Xs) :-
           translate_goal(A,A1,Xs).

        translate_goal(A,A1,DList) :-
           nonterminal(A), functor(A1,A,1), arg(1,A1,DList).
        translate_goal(Terms,connect(Terms,S),S) :-
           terminals(Terms).

	non_terminal(A) :- atom(A).

	terminals(Xs) :- list(Xs).

	list([]).
	list([X|Xs]) :- list(Xs).

%     Program 18.9: Translating grammar rules to Prolog clauses
