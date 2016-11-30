
 /* Play framework  */

     play(Game) :- 
	initialise(Game,Position,Player), 
	display_game(Position,Player),
	play(Position,Player,Result).

     play(Position,Player,Result) :- 
        game_over(Position,Player,Result), !, announce(Result).
     play(Position,Player,Result) :-
        choose_move(Position,Player,Move),
        move(Move,Position,Position1),
        display_game(Position1,Player), 
        next_player(Player,Player1),
        !, 
        play(Position1,Player1,Result).

 /* Choosing a move by minimax with alpha-beta cut-off  */

     choose_move(Position,computer,Move) :-
        lookahead(Depth), 
	alpha_beta(Depth,Position,-40,40,Move,Value),
	nl, write(Move), nl.
     choose_move(Position,opponent,Move) :- 
	nl, writeln(['please make move']), read(Move), legal(Move).

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

     move(Board,[M|Ms]) :- 
        member(M,[1,2,3,4,5,6]), 
	stones_in_hole(M,Board,N),
        extend_move(N,M,Board,Ms).
     move(board([0,0,0,0,0,0],K,Ys,L),[]).

     stones_in_hole(M,board(Hs,K,Ys,L),Stones) :-
	nth_member(M,Hs,Stones), Stones > 0.

     extend_move(Stones,M,Board,[]) :-
	Stones =\= (7-M) mod 13, !.
     extend_move(Stones,M,Board,Ms) :- 
	Stones =:= (7-M) mod 13, !, 
        distribute_stones(Stones,M,Board,Board1),
	move(Board1,Ms).

/*  Executing a move  */

     move([N|Ns],Board,FinalBoard) :- 
       stones_in_hole(N,Board,Stones),
       distribute_stones(Stones,N,Board,Board1),
       move(Ns,Board1,FinalBoard).
     move([],Board1,Board2) :-
	swap(Board1,Board2).

/*  distribute_stones(Stones,Hole,Board,Board1) :-
	Board1 is the result of distributing the number of stones,
	Stones, from Hole from the current Board.
	It consists of two stages: distributing the stones in the player's
	holes, distribute_my_holes, and distributing the stones in 
	the opponent's holes, distribute_your_holes.
*/

distribute_stones(Stones,Hole,Board,FinalBoard) :-
   distribute_my_holes(Stones,Hole,Board,Board1,Stones1),
   distribute_your_holes(Stones1,Board1,FinalBoard).

distribute_my_holes(Stones,N,board(Hs,K,Ys,L),board(Hs1,K1,Ys,L),Stones1) :-
  Stones > 7-N, !, 
  pick_up_and_distribute(N,Stones,Hs,Hs1),
  K1 is K+1, Stones1 is Stones+N-7.
distribute_my_holes(Stones,N,board(Hs,K,Ys,L),Board,0) :-
  pick_up_and_distribute(N,Stones,Hs,Hs1),
  check_capture(N,Stones,Hs1,Hs2,Ys,Ys1,Pieces),
  update_kalah(Pieces,N,Stones,K,K1),
  check_if_finished(board(Hs2,K1,Ys1,L),Board).
				       
check_capture(N,Stones,Hs,Hs1,Ys,Ys1,Pieces) :-
  FinishingHole is N+Stones,
  nth_member(FinishingHole,Hs,1),
  OppositeHole is 7-FinishingHole,
  nth_member(OppositeHole,Ys,Y),
  Y > 0, !,
  n_substitute(OppositeHole,Ys,0,Ys1),
  n_substitute(FinishingHole,Hs,0,Hs1),
  Pieces is Y+1.
check_capture(N,Stones,Hs,Hs,Ys,Ys,0) :- !.

check_if_finished(board(Hs,K,Ys,L),board(Hs,K,Hs,L1)) :-
  zero(Hs), !, sumlist(Ys,YsSum), L1 is L+YsSum.
check_if_finished(board(Hs,K,Ys,L),board(Ys,K1,Ys,L)) :-
  zero(Ys), !, sumlist(Hs,HsSum), K1 is K+HsSum.
check_if_finished(Board,Board) :- !.
    
update_kalah(0,Stones,N,K,K) :- Stones < 7-N, !.
update_kalah(0,Stones,N,K,K1) :- Stones =:= 7-N, !, K1 is K+1.
update_kalah(Pieces,Stones,N,K,K1) :- Pieces > 0, !, K1 is K+Pieces.

distribute_your_holes(0,Board,Board) :- !.
distribute_your_holes(Stones,board(Hs,K,Ys,L),board(Hs,K,Ys1,L)) :-
  1 =< Stones, Stones =< 6, 
  non_zero(Hs), !, 
  distribute(Stones,Ys,Ys1).
distribute_your_holes(Stones,board(Hs,K,Ys,L),board(Hs,K,Ys1,L)) :-
  Stones > 6, !, 
  distribute(6,Ys,Ys1),
  Stones1 is Stones-6,
  distribute_stones(Stones1,0,board(Hs,K,Ys1,L),Board).
distribute_your_holes(Stones,board(Hs,K,Ys,L),board(Hs,K,Hs,L1)) :-
  zero(Hs), !, sumlist(Ys,YsSum), L1 is Stones+YsSum+L.

/*  Lower level stone distribution    */

pick_up_and_distribute(0,N,Hs,Hs1) :-
  !, distribute(N,Hs,Hs1).
pick_up_and_distribute(1,N,[H|Hs],[0|Hs1]) :-
  !, distribute(N,Hs,Hs1).
pick_up_and_distribute(K,N,[H|Hs],[H|Hs1]) :- 
  K > 1, !, K1 is K-1, pick_up_and_distribute(K1,N,Hs,Hs1).

     distribute(0,Hs,Hs) :- !.
     distribute(N,[H|Hs],[H1|Hs1]) :-
        N > 0, !, N1 is N-1, H1 is H+1, distribute(N1,Hs,Hs1).
     distribute(N,[],[]) :- !.

/*   Evaluation function	*/

     value(board(H,K,Y,L),Value) :- Value is K-L.

/*  Testing for the end of the game	*/

     game_over(board(0,N,0,N),Player,draw) :-
	pieces(K), N =:= 6*K, !.
     game_over(board(H,K,Y,L),Player,Player) :- 
	pieces(N), K > 6*N, !.
     game_over(board(H,K,Y,L),Player,Opponent) :-
	pieces(N), L > 6*N, next_player(Player,Opponent).

     announce(opponent) :- writeln(['You won! Congratulations.']).
     announce(computer) :- writeln(['I won.']).
     announce(draw) :- writeln(['The game is a draw.']).

/*  Miscellaneous game utilities	*/

	nth_member(N,[H|Hs],K) :-
	    N > 1, !, N1 is N - 1, nth_member(N1,Hs,K).
	nth_member(1,[H|Hs],H).

n_substitute(1,[X|Xs],Y,[Y|Xs]) :- !.
n_substitute(N,[X|Xs],Y,[X|Xs1]) :- 
  N > 1, !, N1 is N-1, n_substitute(N1,Xs,Y,Xs1).
			       
     next_player(computer,opponent).	
     next_player(opponent,computer).

     legal([N|Ns]) :-  0 < N, N < 7, legal(Ns).
     legal([]).

     swap(board(Hs,K,Ys,L),board(Ys,L,Hs,K)).

     display_game(Position,computer) :-
	show(Position).
     display_game(Position,opponent) :-
	swap(Position,Position1), show(Position1).

     show(board(H,K,Y,L)) :-
        reverse(H,HR), 	write_stones(HR), write_kalahs(K,L), write_stones(Y).

     write_stones(H) :- 
	nl, tab(5), display_holes(H).

     display_holes([H|Hs]) :-
	write_pile(H), display_holes(Hs).
     display_holes([]) :- nl.

	write_pile(N) :- N < 10, write(N), tab(4).
	write_pile(N) :- N >= 10, write(N), tab(3).

     write_kalahs(K,L) :- 
        write(K), tab(34), write(L), nl.

     zero([0,0,0,0,0,0]).

     non_zero(Hs) :- Hs \== [0,0,0,0,0,0].

/*  Initializing	*/

     lookahead(2).
     initialize(kalah,board([N,N,N,N,N,N],0,[N,N,N,N,N,N],0),opponent) :-
	pieces(N).

     pieces(6).

%  Program 21.3  A complete program for playing Kalah
