/*
	minimum(N1,N2,Min) :- 
		The minimum of natural numbers N1 and N2 is Min.

We use lesseq to represent the operator rather than cause problems
with an error message from Prolog about redefining an operator!
*/
						
	:- op(xfx, 40, lesseq).

	minimum(N1,N2,N1) :- N1 lesseq N2.
	minimum(N1,N2,N2) :- N2 lesseq N1.

	0 lesseq X :- natural_number(X).
	s(X) lesseq s(Y) :- X lesseq Y.

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.7: The minimum of two numbers

