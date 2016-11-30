/*
	accept(Xs) :-
		The string represented by the list Xs is accepted by
		the NDFA defined by initial/1, delta/3, and final/1.
*/
	accept(Xs) :- initial(Q), accept(Xs,Q).

	accept([X|Xs],Q) :- delta(Q,X,Q1), accept(Xs,Q1).
	accept([],Q) :- final(Q).

%   Program 17.1: An interpreter for a nondeterministic finite automaton (NDFA)
