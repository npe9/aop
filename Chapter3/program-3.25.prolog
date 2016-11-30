/*
	isotree(Tree1,Tree2) :- 
		Tree1 and Tree2 are isomorphic binary trees
*/
	isotree(void,void).
	isotree(tree(X,Left1,Right1),tree(X,Left2,Right2)) :- 
		isotree(Left1,Left2), isotree(Right1,Right2).
	isotree(tree(X,Left1,Right1),tree(X,Left2,Right2)) :- 
		isotree(Left1,Right2), isotree(Right1,Left2).
	
%	Program 3.25: Determining when trees are isomorphic
