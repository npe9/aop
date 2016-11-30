	/* Test data */

	test_puzzle(Name,Solution) :-
		structure(Name,Structure),
		clues(Name,Structure,Clues),
		queries(Name,Structure,Queries,Solution),
		solve_puzzle(puzzle(Clues,Queries,Solution),Solution).

	structure(test,[friend(N1,C1,S1), friend(N2,C2,S2), friend(N3,C3,S3)]).

	clues(test,Friends,
		[(did_better(Man1Clue1, Man2Clue1, Friends),		% Clue 1
		  name_(Man1Clue1, michael), sport(Man1Clue1,basketball),
		  nationality(Man2Clue1,american)),
		 (did_better(Man1Clue2, Man2Clue2, Friends),		% Clue 2
		  name_(Man1Clue2, simon), nationality(Man1Clue2,israeli),
		  sport(Man2Clue2,tennis)),
		 (first(Friends,ManClue3),sport(ManClue3,cricket))
		]).

	queries(test, Friends,
	    [ member(Q1,Friends),
			name_(Q1,Name),
			nationality(Q1,australian),                     % Query 1
			member(Q2,Friends),
			name_(Q2,richard),
			sport(Q2,Sport)							        % Query 2
		],
		[['The Australian is', Name], ['Richard plays ', Sport]]
	).

	did_better(A,B,[A,B,C]).
	did_better(A,C,[A,B,C]).
	did_better(B,C,[A,B,C]).

	name_(friend(A,B,C),A).
	nationality(friend(A,B,C),B).
	sport(friend(A,B,C),C).

	first([X|Xs],X).

%	Program 14.7: A description of a puzzle
