/*
	connected(Node1,Node2) :-
		Node1 is connected to Node2 in the graph
		defined by the edge/2 relation.
*/
	connected(Node,Node).
	connected(Node1,Node2) :- edge(Node1,Link), connected(Link,Node2).

%	Program 2.7: The transitive closure of the edge relationship
