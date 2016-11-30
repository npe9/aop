/*	
    connected(X,Y) :-
	Node X is connected to node Y in the DAG defined
		by edge/2 facts.
*/
	:- op(40,xfx,\).

	connected(X,Y) :- enqueue(X,Q\Q,Q1), connected_bfs(Q1,Y).

	connected_bfs(Q,Y) :- empty(Q), !, fail.
	connected_bfs(Q,Y) :- dequeue(X,Q,Q1), X=Y.
	connected_bfs(Q,Y) :-
	   dequeue(X,Q,Q1), enqueue_edges(X,Q1,Q2), connected_bfs(Q2,Y).

	enqueue(X,Qh\[X|Qt],Qh\Qt).
	dequeue(X,[X|Qh]\Qt,Qh\Qt).
	empty([]\[]).

enqueue_edges(X,Xs\Ys,Xs\Zs) :- find_all_dl(N,edge(X,N),Ys\Zs), !.

%  findall_dl/3  :-  see Program 16.3

%	Data

     edge(a,b).   edge(a,c).   edge(a,d).  edge(a,e).  edge(d,j).  
     edge(c,f).   edge(c,g).   edge(f,h).  edge(e,k).  edge(f,i).  
     edge(x,y).   edge(y,z).   edge(z,x).  edge(y,u).  edge(z,v).  

%	Program 16.4:  Testing connectivity breadth-first in a DAG
