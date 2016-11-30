/*	
    queue(S) :-
	S is a sequence of enqueue and dequeue operations,
	represented as a list of terms enqueue(X) and dequeue(X).
*/
	:- op(40,xfx,\).

	queue(S) :- queue(S,Q\Q).

	queue([enqueue(X)|Xs],Q) :-
	   enqueue(X,Q,Q1), queue(Xs,Q1).
	queue([dequeue(X)|Xs],Q) :-
	   dequeue(X,Q,Q1), queue(Xs,Q1).
	queue([],Q).

	enqueue(X,Qh\[X|Qt],Qh\Qt).
	dequeue(X,[X|Qh]\Qt,Qh\Qt).

%	Program 15.11:	A queue process
