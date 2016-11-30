/*   queens(N,Queens)  :-
	Queens is a placement that solves the N queens problem,
	represented as a permutation of the list of numbers [1,2,..,N].
*/

     queens(N,Qs) :- range(1,N,Ns), queens(Ns,[],Qs).

     queens(UnplacedQs,SafeQs,Qs) :-
         select(Q,UnplacedQs,UnplacedQs1), 
         not attack(Q,SafeQs), 
         queens(UnplacedQs1,[Q|SafeQs],Qs).
     queens([],Qs,Qs).

	range(I,N,[I|Ns]) :- I < N, I1 is I+1, range(I1,N,Ns).
	range(N,N,[N]).

	select(X,[X|Xs],Xs).
	select(X,[Y|Ys],[Y|Zs]) :- select(X,Ys,Zs).

     attack(X,Xs) :- attack(X,1,Xs).

     attack(X,N,[Y|Ys]) :- X is Y+N ; X is Y-N.
     attack(X,N,[Y|Ys]) :- N1 is N+1, attack(X,N1,Ys).

%	Program 14.3: Placing one queen at a time
