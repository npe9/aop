/*
	times(X,Y,Z) :-
		X, Y and Z are natural numbers
		such that Z is the product of X and Y
*/

	times(0,X,0).
	times(s(X),Y,Z) :- times(X,Y,XY), plus(XY,Y,Z).

	plus(0,X,X) :- natural_number(X).
	plus(s(X),Y,s(Z)):- plus(X,Y,Z).

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.4: Multiplication as repeated addition
