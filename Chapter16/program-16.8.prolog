/*	
    has_property(Xs,P) :-
	Each element in the list Xs has property P.
*/

	has_property([X|Xs],P) :-
	   apply(P,X), has_property(Xs,P).
	has_property([],P).

	apply(male,X) :- male(X).

/*	
   map_list(Xs,P,Ys) :-
	Each element in the list Xs stands in relation
	P to its corresponding element in the list Ys.
*/

	map_list([X|Xs],P,[Y|Ys]) :-
	   apply(P,X,Y), map_list(Xs,P,Ys).
	map_list([],P,[]).

	apply(dict,X,Y) :- dict(X,Y).

%	Program 16.8:  Second-order predicates in Prolog
