/*
   numbervars(Term,N1,N2) :- 
	The variables in Term are numbered from N1 to N2-1.
*/

	numbervars('$VAR'(N),N,N1) :- N1 is N+1.
	numbervars(Term,N1,N2) :-
	   nonvar(Term), functor(Term,Name,N), numbervars(0,N,Term,N1,N2).

	numbervars(N,N,Term,N1,N1).
	numbervars(I,N,Term,N1,N3) :-
		I < N,
		I1 is I+1,
		arg(I1,Term,Arg),
		numbervars(Arg,N1,N2),
		numbervars(I1,N,Term,N2,N3).

%  Program 10.8: Numbering the variables in a term
