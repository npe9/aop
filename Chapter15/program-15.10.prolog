/*
    freeze(A,B) :- Freeze term A into B.
*/

freeze(A,B) :- 
   copy_term(A,B), numbervars(B,0,N).

/*	
    melt_new(A,B) :- Melt the frozen term A into B.

*/
melt_new(A,B) :-
   melt(A,B,Dictionary), !.

melt('$VAR'(N),X,Dictionary) :-
	lookup(N,Dictionary,X).
melt(X,X,Dictionary) :-
	constant(X).
melt(X,Y,Dictionary) :-
	compound(X),
	functor(X,F,N),
	functor(Y,F,N),
	melt(N,X,Y,Dictionary).

melt(N,X,Y,Dictionary) :-
	N > 0, 
	arg(N,X,ArgX), 
	melt(ArgX,ArgY,Dictionary),
	arg(N,Y,ArgY), 
	N1 is N-1, 
	melt(N1,X,Y,Dictionary).
melt(0,X,Y,Dictionary).

	numbervars('$VAR'(N),N,N1) :-
	   N1 is N + 1.
	numbervars(Term,N1,N2) :-
	   nonvar(Term), functor(Term,Name,N), 	numbervars(0,N,Term,N1,N2).

	numbervars(N,N,Term,N1,N1).
	numbervars(I,N,Term,N1,N3) :-
	   I < N, I1 is I + 1, arg(I1,Term,Arg),
	   numbervars(Arg,N1,N2), numbervars(I1,N,Term,N2,N3).

	lookup(Key,dict(Key,X,Left,Right),Value) :-
		!, X = Value.
	lookup(Key,dict(Key,1,Left,Right),Value) :-
		Key < Key1 , !, lookup(Key,Left,Value).
	lookup(Key,dict(Key1,Left,Right),Value) :-
		Key > Key1, !, lookup(Key,Right,Value).

%   Program 15.10:   Melting a term
