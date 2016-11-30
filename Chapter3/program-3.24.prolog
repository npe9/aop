/*
	tree_member(Element,Tree):-
		Element is an element of the binary tree Tree
*/
	tree_member(X,tree(X,Left,Right)).
	tree_member(X,tree(Y,Left,Right)) :- tree_member(X,Left).
	tree_member(X,tree(Y,Left,Right)) :- tree_member(X,Right).

%	Program 3.24: Testing tree membership

