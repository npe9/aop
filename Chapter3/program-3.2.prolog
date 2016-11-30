/*
	X lesseq Y :-  X and Y are natural numbers,
	  		  such that X is less than or equal to Y.

We use lesseq to represent the operator rather than cause problems
with an error message from Prolog about redefining an operator!
*/

	:- op(xfx, 40, lesseq).
	0 lesseq X :- natural_number(X).
	s(X) lesseq s(Y) :- X lesseq Y.

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.2: The less than or equal relation
