/*
   length(Xs,N) :- N is the length of the list Xs.
*/
     length([X|Xs],N) :- length(Xs,N1), N is N1+1.
     length([],0).

%  Program 8.11  Finding the length of a list
