/*	
    flatten(Xs,Ys) :-
	Ys is a flattened list containing the elements in Xs.
*/
	:- op(40,xfx,\).

	flatten(Xs,Ys) :- flatten_q(Xs,Qs\Qs,Ys).

	flatten_q([X|Xs],Ps\[Xs|Qs],Ys) :-
		flatten_q(X,Ps\Qs,Ys).
	flatten_q(X,[Q|Ps]\Qs,[X|Ys]) :-
		constant(X), X \= [], flatten_q(Q,Ps\Qs,Ys).
	flatten_q([],Q,Ys) :-
		non_empty(Q), dequeue(X,Q,Q1), flatten_q(X,Q1,Ys).
	flatten_q([],[]\[],[]).

non_empty([]\[]) :- !, fail.
non_empty(Q).

dequeue(X,[X|Qh]\Qt,Qh\Qt).

%	Program 15.12:	Flattening a list using a queue

