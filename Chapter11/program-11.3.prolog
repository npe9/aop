/*
   minimum(X,Y,Min) :- Min is the minimum of the numbers X and Y.
*/
   minimum(X,Y,X) :- X =< Y, !.
   minimum(X,Y,Y) :- X > Y, !.

%  Program 11.3    Minimum with cuts
