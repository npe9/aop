/*
   solve_best(Frontier,History,Moves) :-
      Moves is the sequence of moves to reach a desired final state 
	from the initial state, where Frontier contains the current 
	states under consideration, and History contains the states 
	visited previously.
*/

     solve_best([state(State,Path,Value)|Frontier],History,Moves) :- 
	final_state(State), reverse(Path,Moves).
     solve_best([state(State,Path,Value)|Frontier],History,FinalPath) :-
	findall(M,move(State,M),Moves),
	updates(Moves,Path,State,States),
	legals(States,States1),
	news(States1,History,States2),
	evaluates(States2,Values),
	inserts(Values,Frontier,Frontier1),
	solve_best(Frontier1,[State|History],FinalPath).

/*
   updates(Moves,Path,State,States) :-
	States is the list of possible states accessible from the 
	current State, according to the list of possible Moves,
	where Path is a path from the initial node to State.
*/

     updates([Move|Moves],Path,State,[(State1,[Move|Path])|States]) :-
	update(State,Move,State1), updates(Moves,Path,State,States).
     updates([],Path,State,[]).

/*
   legals(States,States1) :-
	States1 is the subset of the list of States that are legal.
*/

     legals([(S,P)|States],[(S,P)|States1]) :-
	legal(S), legals(States,States1).
     legals([(S,P)|States],States1) :-
	not legal(S), legals(States,States1).
     legals([],[]).

/*
   news(States,History,States1) :-
	States1 is the list of states in States but not	in History.
*/
     news([(State,Path)|States],History,States1) :-
	member(State,History), news(States,History,States1).
     news([(State,Path)|States],History,[(State,Path)|States1]) :-
	not member(State,History), news(States,History,States1).
     news([],History,[]).

/*
   evaluates(States,Values) :- 
	Values is the list of tuples of States augmented by their value.
*/
     evaluates([(State,Path)|States],[state(State,Path,Value)|Values]) :-
	value(State,Value), evaluates(States,Values).
     evaluates([],[]).

/*
   inserts(States,Frontier,Frontier1) :-
	Frontier1 is the result of inserting States into the current Frontier.
*/
     inserts([Value|Values],Frontier,Frontier1) :-
	insert(Value,Frontier,Frontier0),
	inserts(Values,Frontier0,Frontier1).
     inserts([],Frontier,Frontier).

     insert(State,[],[State]).
     insert(State,[State1|States],[State,State1|States]) :- 
	lesseq_value(State,State1).
     insert(State,[State1|States],[State|States]) :- 
	equals(State,State1).
     insert(State,[State1|States],[State1|States1]) :-
	greater_value(State,State1), insert(State,States,States1).

     equals(state(S,P,V),state(S,P1,V)).

     lesseq_value(state(S1,P1,V1),state(S2,P2,V2)) :- S1 \== S2, V1 =< V2.

     greater_value(state(S1,P1,V1),state(S2,P2,V2)) :- V1 > V2.

%  Program 20.6     Best first framework for problem solving
