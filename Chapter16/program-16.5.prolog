/* 
    connected(X,Y) :-
	Node X is connected to node Y in the graph defined by edge/2 facts.
*/
	:- op(40,xfx,\).

	connected(X,Y) :- enqueue(X,Q\Q,Q1), connected_bfs(Q1,Y,[X]).

	connected_bfs(Q,Y,Visited) :- empty(Q), !, fail.
	connected_bfs(Q,Y,Visited) :- dequeue(X,Q,Q1), X=Y.
	connected_bfs(Q,Y,Visited) :- 
	   dequeue(X,Q,Q1), 
	   findall(N,edge(X,N),Edges),
	   filter(Edges,Visited,Visited1,Q1,Q2),
	   connected_bfs(Q2,Y,Visited1).

	filter([N|Ns],Visited,Visited1,Q,Q1) :-
	   member(N,Visited), !, filter(Ns,Visited,Visited1,Q,Q1).
	filter([N|Ns],Visited,Visited1,Q,Q2) :-
	   not member(N,Visited), !, 
	   enqueue(N,Q,Q1), 
	   filter(Ns,[N|Visited],Visited1,Q1,Q2).
	filter([],Visited,Visited,Q,Q).

	enqueue(X,Qh\[X|Qt],Qh\Qt).
	dequeue(X,[X|Qh]\Qt,Qh\Qt).
	empty([]\[]).

%	Data

     edge(a,b).   edge(a,c).   edge(a,d).  edge(a,e).  edge(d,j).  
     edge(c,f).   edge(c,g).   edge(f,h).  edge(e,k).  edge(f,i).  
     edge(x,y).   edge(y,z).   edge(z,x).  edge(y,u).  edge(z,v).  

%	Program 16.5: Testing connectivity breadth-first in a graph
