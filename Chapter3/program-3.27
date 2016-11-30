/*
	preorder(Tree,Pre) :- 
		Pre is a preorder traversal of the binary tree Tree.
*/
	preorder(tree(X,L,R),Xs) :-
		preorder(L,Ls), preorder(R,Rs), append([X|Ls],Rs,Xs).
	preorder(void,[]).

/*
	inorder(Tree,In) :- 
		In is an inorder traversal of the binary tree Tree.
*/
	inorder(tree(X,L,R),Xs) :-
		inorder(L,Ls), inorder(R,Rs), append(Ls,[X|Rs],Xs).
	inorder(void,[]).
/*
	postorder(Tree,Post) :- 
		Post is a postorder traversal of the binary tree Tree.
*/
	postorder(tree(X,L,R),Xs) :-
		postorder(L,Ls), 
		postorder(R,Rs),
		append(Rs,[X],Rs1), 
		append(Ls,Rs1,Xs).
	postorder(void,[]).

%	Program 3.27: Traversals of a binary tree
