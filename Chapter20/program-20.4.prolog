/*  
   solve_hill_climb(State,History,Moves) :-
      Moves is the sequence of moves to reach a desired final state 
	from the current State, where History are the states 
	visited previously. 
*/

     solve_hill_climb(State,History,[]) :- 
	final_state(State).
     solve_hill_climb(State,History,[Move|Moves]) :-
	hill_climb(State,Move),
	update(State,Move,State1),
	legal(State1),
	not member(State1,History),
	solve_hill_climb(State1,[State1|History],Moves).

     hill_climb(State,Move) :-
        findall(M,move(State,M),Moves),
        evaluate_and_order(Moves,State,[],MVs),
	member((Move,Value),MVs).

/*   
   evaluate_and_order(Moves,State,SoFar,OrderedMVs) :-
	All the Moves from the current State are evaluated and 
	ordered as OrderedMVs. SoFar is an accumulator for 
	partial computations.
*/
     evaluate_and_order([Move|Moves],State,MVs,OrderedMVs) :-
	update(State,Move,State1),
	value(State1,Value),
	insert((Move,Value),MVs,MVs1),
	evaluate_and_order(Moves,State,MVs1,OrderedMVs).
     evaluate_and_order([],State,MVs,MVs).

     insert(MV,[],[MV]).
     insert((M,V),[(M1,V1)|MVs],[(M,V),(M1,V1)|MVs]) :- 
	V >= V1.
     insert((M,V),[(M1,V1)|MVs],[(M1,V1)|MVs1]) :-
	V < V1, insert((M,V),MVs,MVs1).

/*	Testing the Framework */

	test_hill_climb(Problem,Moves)  :-
		initial_state(Problem,State),
		solve_hill_climb(State,[State],Moves).

%   Program 20.4: Hill climbing framework for problem solving
