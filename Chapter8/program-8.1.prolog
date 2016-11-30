/*
   greatest_common_divisor(X,Y,Z) :- 
	Z is the greatest common divisor of the integers X and Y.
*/
     greatest_common_divisor(I,0,I).
     greatest_common_divisor(I,J,Gcd) :-
          J > 0, R is I mod J, greatest_common_divisor(J,R,Gcd).

%  Program 8.1    Computing the greatest common divisor of two integers
