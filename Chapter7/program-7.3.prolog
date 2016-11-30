/*
   member_check(X,Xs) :- X is a member of the list Xs.
*/
     member_check(X,[X|Xs]).
     member_check(X,[Y|Ys]) :- X \== Y, member_check(X,Ys).

%  Program 7.3    Checking for list membership
