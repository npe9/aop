/*
   factorial(N,F) :- F is the integer N factorial.
*/ 
     factorial(N,F) :- factorial(N,1,F).

     factorial(N,T,F) :-
        N > 0, T1 is T*N, N1 is N-1, factorial(N1,T1,F).
     factorial(0,F,F). 

%  Program 8.4   Another iterative factorial
