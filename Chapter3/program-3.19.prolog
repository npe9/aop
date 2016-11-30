/*		
	select(X,HasXs,OneLessXs) :- 
		The list OneLessXs is the result of removing one 
		occurrence of X from the list HasXs.
*/

	select(X,[X|Xs],Xs).
	select(X,[Y|Ys],[Y|Zs]) :- select(X,Ys,Zs).

%	Program 3.19: Selecting an element from a list
