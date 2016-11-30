/*
   connected(X,Y) :-
	Node X is connected to node Y in the graph defined by edge/2.
*/	

     connected(X,Y) :- connected(X,Y,[X]).

     connected(X,X,Visited).
     connected(X,Y,Visited) :- 
		edge(X,N), not member(N,Visited), connected(N,Y,[N|Visited]).

%	Program 14.10: Connectivity in a graph
