/*
    eliza :- Simulates a conversation via side effects.
*/

%  For testing this program prior to Standard Prolog being widley
%  available, the program below uses read rather than read_word_list.
%  You need to type in a list of waords such as [i, am,unhappy].

eliza :- read(Input), eliza(Input), !.

eliza([bye]) :-
   writeln(['Goodbye. I hope I have helped you']).
eliza(Input) :-
   pattern(Stimulus,Response),
   match(Stimulus,Table,Input),
   match(Response,Table,Output),
   reply(Output),
   read(Input1),
   !, eliza(Input1).

/*
	match(Patterm,Dictionary,Words) :-
		Pattern matches the list of words Words, and matchings
		are recorded in the Dictionary.
*/

match([N|Pattern],Table,Target) :-
   integer(N),
   lookup(N,Table,LeftTarget),
   append(LeftTarget,RightTarget,Target),
   match(Pattern,Table,RightTarget).
match([Word|Pattern],Table,[Word|Target]) :-
   atom(Word),
   match(Pattern,Table,Target).
match([],Table,[]).

/*
    pattern(Stimulus,Response) :-
	Response is an applicable response pattern to the pattern Stimulus.
*/

pattern([i,am,1],['How',long,have,you,been,1,?]).
pattern([1,you,2,me],['What',makes,you,think,'I',2,you,?]).
pattern([i,like,1],['Does',anyone,else,in,your,family,like,1,?]).
pattern([i,feel,1],['Do',you,often,feel,that,way,?]).
pattern([1,X,2],['Please',you,tell,me,more,about,X]) :-
	important(X).
pattern([1],['Please',go,on,'.']).

    important(father).			important(mother).
    important(sister).			important(brother).
    important(son).			important(daughter).

reply([Head|Tail]) :- write(Head), write(' '), reply(Tail).
reply([]) :- nl.

lookup(X,[(X,V)|XVs],V).
lookup(X,[(X1,V1)|XVs],V) :- X \== X1, lookup(X,XVs,V).


%	Program 14.15 ELIZA
