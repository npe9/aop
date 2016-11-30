	parent(terach,abraham).		parent(abraham,isaac).
	parent(isaac,jacob).		parent(jacob,benjamin).

	ancestor(X,Y) :- parent(X,Y).
	ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).

%  Program 7.1    Yet another family example
