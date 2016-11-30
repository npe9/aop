/*
   factorial(N,F) :- F is the integer N factorial.
*/ 
     factorial(N,F) :-
        N > 0, N1 is N-1, factorial(N1,F1), F is N*F1.
     factorial(0,1).
%
%  Program 8.2   Computing the factorial of a number
