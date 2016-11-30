/*
solve_best(Frontier,History,Moves) :-
      Moves is the sequence of moves to reach a desired final state 
	from the initial state. Frontier contains the current states 
	under consideration. History contains the states visited previously.
*/
     solve_best([state(State,Path,Value)|Frontier],History,Moves) :- 
	final_state(State), reverse(Path,[],Moves).
     solve_best([state(State,Path,Value)|Frontier],History,FinalPath) :-
	findall(M,move(State,M),Moves),
	update_frontier(Moves,State,Path,History,Frontier,Frontier1),
	solve_best(Frontier1,[State|History],FinalPath).

update_frontier([Move|Moves],State,Path,History,Frontier,Frontier1) :-
   	update(State,Move,State1),
	legal(State1),
	value(State1,Value),
	not member(State1,History),
	insert(state(State1,[Move|Path],Value),Frontier,Frontier0),
	update_frontier(Moves,State,Path,History,Frontier0,Frontier1).
update_frontier([],State,Path,History,Frontier,Frontier).


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

	reverse([X|Xs],Acc,Ys) :- reverse(Xs,[X|Acc],Ys).
	reverse([],Ys,Ys).

%  Program 20.7     Concise best first framework for problem solving
