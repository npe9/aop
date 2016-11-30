/*		
	substitute(X,Y,TreeX,TreeY) :- 
		The binary tree TreeY is the result of replacing all 
		occurrences of X in the binary tree TreeX by Y.
*/

	substitute(X,Y,void,void).
	substitute(X,Y,tree(Leaf,Left,Right),tree(Leaf1,Left1,Right1)) :-
		replace(X,Y,Leaf,Leaf1),
		substitute(X,Y,Left,Left1), 
		substitute(X,Y,Right,Right1).

	replace(X,Y,X,Y).
	replace(X,Y,Z,Z) :- X \== Z.

%	Program 3.26: Substituting for a term in a tree
