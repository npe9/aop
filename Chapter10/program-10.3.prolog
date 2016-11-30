/*
   grandparent(X,Z) :- X is the grandparent of Z.
*/
   grandparent(X,Z) :- nonvar(X), parent(X,Y), parent(Y,Z).
   grandparent(X,Z) :- nonvar(Z), parent(Y,Z), parent(X,Y).

%  Program 10.3  A more efficient version of grandparent
