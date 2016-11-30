/*	
    normalize(Sum,NormalisedSum) :-
	NormalizedSum is the result of normalizing the sum expression Sum.

*/
	:- op(50,xfx,++).

	normalize(Exp,Norm) :- normalize_ds(Exp,Norm++0).

	normalize_ds(A+B,Norm++Space) :-
	   normalize_ds(A,Norm++NormB), normalize_ds(B,NormB++Space).
	normalize_ds(A,(A+Space)++Space) :-
	   constant(A).

%	Program 15.7 :	Normalizing plus expressions.
