/*
   nonmember(X,Xs) :- X is not a member of the list Xs.
*/
     nonmember(X,[Y|Ys]) :- X \== Y, nonmember(X,Ys).
     nonmember(X,[]).

%  Program 7.5    Nonmembership of a list
