/*  
  solve_trace(Goal) :-
	Goal is true given the pure Prolog program defined by 
	clause/2. The program traces the proof by side effects.
*/
		 
solve_trace(Goal) :-
	solve_trace(Goal,0).

     solve_trace(true,Depth) :- !.
     solve_trace((A,B),Depth) :-  !,
        solve_trace(A,Depth), solve_trace(B,Depth). 
     solve_trace(A,Depth) :-  
	builtin(A), !, A, display(A,Depth), nl.
     solve_trace(A,Depth) :-
        clause(A,B), 
	display(A,Depth), nl,
	Depth1 is Depth + 1, 
	solve_trace(B,Depth1).

     display(A,Depth) :-  Spacing is 3*Depth, put_spaces(Spacing), write(A). 

     	put_spaces(N) :- between(1,N,I), put_char(' '), fail.
	put_spaces(N).

     between(I,J,I) :- I =< J.
     between(I,J,K) :- I < J, I1 is I + 1, between(I1,J,K).

%	Program 17.7	A tracer for Prolog
