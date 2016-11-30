/*
   inner_product(Xs,Ys,Value) :- 
	Value is the inner product of the vectors
	represented by the lists of integers Xs and Ys.
*/
     inner_product([X|Xs],[Y|Ys],IP) :-
	inner_product(Xs,Ys,IP1), IP is X*Y + IP1.
     inner_product([],[],0).

%  Program 8.7a   Computing inner products of vectors
