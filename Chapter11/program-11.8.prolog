/*
   X \= Y :- X and Y are not unifiable.
*/
	:- op(700, xfx, \=).

     X \= X :- !, fail.
     X \= Y.

%  Program 11.8   Implementing \=

