/*
   occurs_in(Sub,Term) :- 
	Sub is a subterm of the (possibly non-ground term) Term.
*/
% a:  Using ==

   occurs_in(X,Term) :- subterm(Sub,Term), X == Sub.

% b:  Using freeze    $$$$  freeze is not in Standard Prolog

   occurs_in(X,Term) :- freeze(X,Xf), freeze(Y,Termf), subterm(Xf,Termf).

/*
   subterm(Sub,Term) :- Sub is a subterm of the ground term Term.
*/
     subterm(Term,Term).
     subterm(Sub,Term) :- 
        compound(Term), functor(Term,F,N), subterm(N,Sub,Term).

     subterm(N,Sub,Term) :- 
        arg(N,Term,Arg), subterm(Sub,Arg).
     subterm(N,Sub,Term) :- 
        N > 1, N1 is N-1, subterm(N1,Sub,Term).

%  Program 10.7    Occurs in
