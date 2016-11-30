/*
	connected(X,Y) :-
		Node X is connected to node Y,
		given an edge/2 relation describing a DAG.
*/

     connected(X,X).
     connected(X,Y) :- edge(X,N), connected(N,Y).

  /*  Data   */

     edge(a,b).   edge(a,c).   edge(a,d).  edge(a,e).  edge(d,j).  
     edge(c,f).   edge(c,g).   edge(f,h).  edge(e,k).  edge(f,i).  
     edge(x,y).   edge(y,z).   edge(z,x).  edge(y,u).  edge(z,v).  

%	Program 14.8: Connectivity in a finite DAG
