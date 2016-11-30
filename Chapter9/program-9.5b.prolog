/*
   univ(Term, List) :- 
	The functor of Term is the first element of the list List, 
	and its arguments are the rest of List's elements.
*/

     univ(Term, [F|Args]) :-
	length(Args,N), functor(Term,F,N), args(Args,Term,1).

     args([Arg|Args],Term,N) :-
		arg(N,Term,Arg), N1 is N+1, args(Args,Term,N1).
     args([],Term,N).
/*
   length(Xs,N) :- N is the length of the list Xs.
*/
     length([X|Xs],N) :- length(Xs,N1), N is N1+1.
     length([],0).

%  Program 9.5b   Constructing a term corresponding to a list
