/* 
	natural_number(X) :- X is a natural number.
*/

	natural_number(0).
	natural_number(s(X)) :- natural_number(X).

%	Program 3.1:  Defining the natural numbers
