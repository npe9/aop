/*
   inner_product(Xs,Ys,Value) :- 
	Value is the inner product of the vectors
	represented by the lists of integers Xs and Ys.
*/
     inner_product(Xs,Ys,IP) :- inner_product(Xs,Ys,0,IP).
 
     inner_product([X|Xs],[Y|Ys],Temp,IP) :-
         Temp1 is X*Y+Temp, inner_product(Xs,Ys,Temp1,IP).
     inner_product([],[],IP,IP).

%  Program 8.7b   Computing inner products of vectors iteratively
