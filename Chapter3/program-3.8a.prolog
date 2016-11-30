/*
	mod(X,Y,Z) :-
		Z is the remainder of the integer division of X by Y.
*/

	mod(X,Y,Z) :- Z < Y, times(Y,Q,QY), plus(QY,Z,X).

	times(0,X,0).
	times(s(X),Y,Z) :- times(X,Y,XY), plus(XY,Y,Z).

	plus(0,X,X) :- natural_number(X).
	plus(s(X),Y,s(Z)):- plus(X,Y,Z).

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.8a: A nonrecursive definition of modulus
