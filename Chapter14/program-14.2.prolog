/*
   queens(N,Queens) :-
	Queens is a placement that solves the N queens problem,
	represented as a permutation of the list of numbers [1,2,...,N].
*/

     queens(N,Qs) :- range(1,N,Ns), permutation(Ns,Qs), safe(Qs).

/*
	safe(Qs) :- The placement Qs is safe.
*/     
     safe([Q|Qs]) :- safe(Qs), not attack(Q,Qs).
     safe([]).     
     
     attack(X,Xs) :- attack(X,1,Xs).

     attack(X,N,[Y|Ys]) :- X is Y+N ; X is Y-N.
     attack(X,N,[Y|Ys]) :- N1 is N+1, attack(X,N1,Ys).


	permutation(Xs,[Z|Zs]) :- select(Z,Xs,Ys), permutation(Ys,Zs).
	permutation([],[]).

	select(X,[X|Xs],Xs).
	select(X,[Y|Ys],[Y|Zs]) :- select(X,Ys,Zs).

     range(M,N,[M|Ns]) :- M < N, M1 is M+1, range(M1,N,Ns).
     range(N,N,[N]).

%	Program 14.2: Naive generate-and-test program solving N queens

