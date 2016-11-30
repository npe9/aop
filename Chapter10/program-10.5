/*
   unify(Term1,Term2) :- 
	Term1 and Term2 are unified, ignoring the occurs check.
*/
   unify(X,Y) :-
	var(X), var(Y), X=Y.
   unify(X,Y) :-
	var(X), nonvar(Y), X=Y.
   unify(X,Y) :-
	var(Y), nonvar(X), Y=X.
   unify(X,Y) :-
	nonvar(X), nonvar(Y), constant(X), constant(Y), X=Y.
   unify(X,Y) :-
	nonvar(X), nonvar(Y), compound(X), compound(Y), term_unify(X,Y).

   term_unify(X,Y) :-
	functor(X,F,N), functor(Y,F,N), unify_args(N,X,Y).

   unify_args(N,X,Y) :-
	N > 0, unify_arg(N,X,Y), N1 is N-1, unify_args(N1,X,Y).
   unify_args(0,X,Y).

   unify_arg(N,X,Y) :-
	arg(N,X,ArgX), arg(N,Y,ArgY), unify(ArgX,ArgY).


%  Program 10.5    Unification algorithm
