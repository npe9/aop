/*	
   find_all_dl(X,Goal,Instances) :- Instances is the multiset
	of instances of X for which Goal is true. The multiplicity
	of an element is the number of different ways Goal can be
	proved with it as an instance of X.
*/
	:- op(40,xfx,\).

	find_all_dl(X,Goal,Xs) :-
		asserta('$instance'('$mark')),
		Goal,
		asserta('$instance'(X)),
		fail.
	find_all_dl(X,Goal,Xs\Ys) :-
		retract('$instance'(X)),
		reap(X,Xs\Ys), !.
	
	reap(X,Xs\Ys) :-	
		X \== '$mark',
		retract('$instance'(X1)), ! ,
		reap(X1,Xs\[X|Ys]).
	reap('$mark',Xs\Xs).

%	Program 16.3 : Implementing an all-solutions predicate using
%			difference-lists, assert and retract

