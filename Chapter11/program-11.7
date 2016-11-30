/*
   variants(Term1,Term2) :- Term1 and Term2 are variants.
*/
   variants(Term1,Term2) :-
	verify((numbervars(Term1,0,N), 
		numbervars(Term2,0,N),
		Term1=Term2)).

	verify(Goal) :- not (not Goal).

	numbervars('$VAR'(N),N,N1) :-
		N1 is N+1.
	numbervars(Term,N1,N2) :-
		nonvar(Term), functor(Term,Name,N),
		numbervars(0,N,Term,N1,N2).

	numbervars(N,N,Term,N1,N1).
	numbervars(I,N,Term,N1,N3) :-
		I < N,
		I1 is I+1,
		arg(I1,Term,Arg),
		numbervars(Arg,N1,N2),
		numbervars(I1,N,Term,N2,N3).

%  Program 11.7  Testing if terms are variants
