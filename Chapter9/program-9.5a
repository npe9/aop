/*
   univ(Term, List) :- List is a list containing the functor of Term followed 
		by the arguments of Term.
*/
     univ(Term, [F|Args]) :-
		functor(Term,F,N), args(0,N,Term,Args).

     args(I,N,Term,Arg,Args) :-
		I < N, I1 is I+1, arg(I1,Term,Arg), args(I1,N,Term,Args).
     args(N,N,Term,[]).

%  Program 9.5a   Constructing a list corresponding to a term
