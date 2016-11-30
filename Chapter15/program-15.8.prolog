/*	
    lookup(Key,Dictionary,Value) :-
	Dictionary contains Value indexed under key.
	Dictionary is represented as an incomplete 
	list of pairs of the form (Key,Value).
*/

	lookup(Key,[(Key,Value)|Dict],Value).
	lookup(Key,[(Key1,Value1)|Dict],Value) :-
	   Key \== Key1, lookup(Key,Dict,Value).

%	Program 15.8: Dictionary lookup from a list of tuples
