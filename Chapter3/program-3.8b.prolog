/*
	mod(X,Y,Z) :-
		Z is the remainder of the integer division of X and Y.
*/

	mod(X,Y,X):- X < Y.
	mod(X,Y,Z) :- plus(X1,Y,X), mod(X1,Y,Z).

	plus(0,X,X) :- natural_number(X).
	plus(s(X),Y,s(Z)):- plus(X,Y,Z).

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.8b: A recursive definition of modulus
