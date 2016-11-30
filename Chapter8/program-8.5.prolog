/*  
  between(I,J,K) :- K is an integer between the integers I and J inclusive.
*/
     between(I,J,I) :- I =< J.
     between(I,J,K) :- I < J, I1 is I + 1, between(I1,J,K).

%  Program 8.5   Generating a range of integers
