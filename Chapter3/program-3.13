/*
	prefix(Prefix,List) :- Prefix is a prefix of List.
*/

	prefix([],Ys).
	prefix([X|Xs],[X|Ys]) :- prefix(Xs,Ys).

/*
	suffix(Suffix,List) :- Suffix is a suffix of List.
*/

	suffix(Xs,Xs).
	suffix(Xs,[Y|Ys]) :- suffix(Xs,Ys).

%	Program 3.13: Prefixes and suffixes of a list
