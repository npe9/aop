/*
   evaluate_and_choose(Moves,Position,Depth,Flag,Record,BestMove) :-
	Chooses the BestMove from the set of Moves from the current Position
	using the minimax algorithm searching Depth ply ahead.
	Flag indicates if we are currently minimizing or maximizing.
	Record records the current best move
*/

     evaluate_and_choose([Move|Moves],Position,D,MaxMin,Record,BestMove) :-
	move(Move,Position,Position1),
        minimax(D,Position1,MaxMin,MoveX,Value), 
	update(Move,Value,Record,Record1),
 	evaluate_and_choose(Moves,Position,D,MaxMin,Record1,BestMove).
     evaluate_and_choose([],Position,D,MaxMin,Record,Record).

     minimax(0,Position,MaxMin,Move,Value) :- 
	value(Position,V), 
	Value is V * MaxMin.
     minimax(D,Position,MaxMin,Move,Value) :-
	D > 0,
        findall(M,move(Position,M),Moves),
        D1 is D - 1,
        MinMax is -MaxMin,
        evaluate_and_choose(Moves,Position,D1,MinMax,(nil,-1000),(Move,Value)).

	update(Move,Value,(Move1,Value1),(Move1,Value1)) :- 
	   Value =< Value1.
	update(Move,Value,(Move1,Value1),(Move,Value)) :- 
	  Value > Value1.

%  Program 20.10   Choosing the best move with the minimax algorithm
