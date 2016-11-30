/*
   members(Xs,Ys) :- Each element of the list Xs is an element of the list Ys.
*/
     members([X|Xs],Ys) :- member(X,Ys), members(Xs,Ys).
     members([],Ys).

%  Program 7.6    Testing for a subset
