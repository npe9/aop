/*
	plus(X,Y,Z) :-
		X, Y and Z are natural numbers
		such that Z is the sum of X and Y.
*/

	plus(0,X,X) :- natural_number(X).
	plus(s(X),Y,s(Z)):- plus(X,Y,Z).

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.3: Addition
