/*  
  solve_dfs(State,History,Moves) :-
      Moves is the sequence of moves to reach a desired final state 
	from the current State, where History contains the states 
	visited previously.
*/
     solve_dfs(State,History,[]) :- 
	final_state(State).
     solve_dfs(State,History,[Move|Moves]) :-
	move(State,Move),
	update(State,Move,State1),
	legal(State1),
	not member(State1,History),
	solve_dfs(State1,[State1|History],Moves).

/*  Testing the framework	*/

     test_dfs(Problem,Moves) :-
        initial_state(Problem,State), solve_dfs(State,[State],Moves).

%  Program 20.1  A depth-first state-transition framework for problem solving
