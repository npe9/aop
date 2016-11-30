/*
	hanoi(N,A,B,C,Moves) :-
		Moves is the sequence of moves required to move N discs
		from peg A to peg B using peg C as an intermediary
		according to the rules of the Towers of Hanoi puzzle
*/

	:- op(100, xfx, [to]).

	hanoi(1,A,B,C,[A to B]).
	hanoi(N,A,B,C,Moves) :-
		N > 1,
		N1 is N -1,
		lemma(hanoi(N1,A,C,B,Ms1)),
		hanoi(N1,C,B,A,Ms2),
		append(Ms1,[A to B|Ms2],Moves).

	lemma(P):- P, asserta((P :- !)).

	/* Testing */

	test_hanoi(N,Pegs,Moves) :-
		hanoi(N,A,B,C,Moves), Pegs = [A,B,C].

%	Program 12.3: Towers of Hanoi using a memo-function
