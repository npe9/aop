/*
	gcd(X,Y,Z) :- Z is the greatest common divisor of the 
			      natural numbers X and Y.
*/

	gcd(X,Y,Gcd) :- mod(X,Y,Z), gcd(Y,Z,Gcd).
	gcd(X,0,X) :- X > 0.

%	Program 3.10: The Euclidean algorithm
