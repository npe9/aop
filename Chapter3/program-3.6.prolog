/*
	factorial(N,F) :- F equals N factorial.
*/

	factorial(0,s(0)).
	factorial(s(N),F) :- factorial(N,F1), times(s(N),F1,F).

	times(0,X,0).
	times(s(X),Y,Z) :- times(X,Y,XY), plus(XY,Y,Z).

	plus(0,X,X) :- natural_number(X).
	plus(s(X),Y,s(Z)):- plus(X,Y,Z).

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.6: Computing factorials
