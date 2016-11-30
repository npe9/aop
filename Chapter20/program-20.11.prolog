/*
   evaluate_and_choose(Moves,Position,Depth,Alpha,Beta,Record,BestMove) :-
	Chooses the BestMove from the set of Moves from the current Position
	using the minimax algorithm with alpha-beta cutoff searching 
	Depth ply ahead. Alpha and Beta are the parameters of the algorithm.
	Record records the current best move
*/
    evaluate_and_choose([Move|Moves],Position,D,Alpha,Beta,Move1,BestMove) :- 
	move(Move,Position,Position1),
        alpha_beta(D,Position1,Alpha,Beta,MoveX,Value),
        Value1 is -Value,   
        cutoff(Move,Value1,D,Alpha,Beta,Moves,Position,Move1,BestMove).
     evaluate_and_choose([],Position,D,Alpha,Beta,Move,(Move,A)).

     alpha_beta(0,Position,Alpha,Beta,Move,Value) :- 
	value(Position,Value).
     alpha_beta(D,Position,Alpha,Beta,Move,Value) :- 
        findall(M,move(Position,M),Moves),
        Alpha1 is -Beta, 
	Beta1 is -Alpha, 
        D1 is D-1,
	evaluate_and_choose(Moves,Position,D1,Alpha1,Beta1,nil,(Move,Value)).

     cutoff(Move,Value,D,Alpha,Beta,Moves,Position,Move1,(Move,Value)) :- 
	Value >= Beta.
     cutoff(Move,Value,D,Alpha,Beta,Moves,Position,Move1,BestMove) :- 
        Alpha < Value, Value < Beta, 
	evaluate_and_choose(Moves,Position,D,Value,Beta,Move,BestMove).
     cutoff(Move,Value,D,Alpha,Beta,Moves,Position,Move1,BestMove) :-
        Value =< Alpha, 
	evaluate_and_choose(Moves,Position,D,Alpha,Beta,Move1,BestMove).

%  Program 20.11   Choosing a move using minimax with alpha-beta pruning
