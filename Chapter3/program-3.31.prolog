/*
	hanoi(N,A,B,C,Moves) :- 
		Moves is a sequence of moves for solving the Towers of
		Hanoi puzzle with N disks and three pegs, A, B and C.
*/

:- op(40,xfx,[to]).

	hanoi(s(0),A,B,C,[A to B]).
	hanoi(s(N),A,B,C,Moves) :-
		hanoi(N,A,C,B,Ms1),
		hanoi(N,C,B,A,Ms2),
		append(Ms1,[A to B|Ms2],Moves).

%	Program 3.31: Towers of Hanoi
