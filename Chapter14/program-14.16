/*
	mcsam(Story,Script) :-
		Script describes Story.
*/

mcsam(Story,Script) :-  
	find(Story,Script,Defaults),
        match(Script,Story),
        name_defaults(Defaults).

find(Story,Script,Defaults) :- 
	filler(Slot,Story),
        trigger(Slot,Name),
        script(Name,Script,Defaults).
/*
	match(Script,Story) :-
		Story is a subsequence of Script.
*/

match(Script,[]).
match([Line|Script],[Line|Story]) :- match(Script,Story).
match([Line|Script],Story) :- match(Script,Story).

/*
	filler(Slot,Story) :-
		Slot is a word in Story.
*/

filler(Slot,Story) :- 
	member([Action|Args],Story),
        member(Slot,Args),
        nonvar(Slot).

/*
	name_defaults(Defaults) :-
		Unifies default pairs in Defaults.
*/

name_defaults([]).
name_defaults([[N,N]|L]) :-  name_defaults(L).
name_defaults([[N1,N2]|L]) :-  N1 \== N2, name_defaults(L).

%	Program 14.16: McSAM
