/* 
     ground(Term) :- Term is a ground term.
*/
     ground(Term) :- 
        nonvar(Term),
	constant(Term).
     ground(Term) :- 
        nonvar(Term),
	compound(Term),
	functor(Term,F,N),
	ground(N,Term).
	
     ground(N,Term) :-
        N > 0,
	arg(N,Term,Arg),
	ground(Arg),
	N1 is N-1,
	ground(N1,Term).
     ground(0,Term).

%  Program 10.4   Testing if a term is ground
