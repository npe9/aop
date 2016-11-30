/*
    evaluate_and_choose(Moves,Position,Record,BestMove) :-
	Chooses the BestMove from the set of Moves from the current
	Position, Record records the current best move.
*/
     evaluate_and_choose([Move|Moves],Position,Record,BestMove) :-
	move(Move,Position,Position1),
	value(Position1,Value), 
	update(Move,Value,Record,Record1), 
	evaluate_and_choose(Moves,Position,Record1,BestMove).
     evaluate_and_choose([],Position,(Move,Value),Move).

	update(Move,Value,(Move1,Value1),(Move1,Value1)) :- 
	   Value =< Value1.
	update(Move,Value,(Move1,Value1),(Move,Value)) :- 
	  Value > Value1.

%  Program 20.9   Choosing the best move 
