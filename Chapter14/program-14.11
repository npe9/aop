/*
    transform(State1,State2,Plan) :-
	Plan is a plan of actions to transform State1 into State2.
*/

transform(State1,State2,Plan) :- 
   transform(State1,State2,[State1],Plan).

transform(State,State,Visited,[]).
transform(State1,State2,Visited,[Action|Actions]) :-
   legal_action(Action,State1),
   update(Action,State1,State), 
   not member(State,Visited),
   transform(State,State2,[State|Visited],Actions).

legal_action(to_place(Block,Y,Place),State) :- 
   on(Block,Y,State), clear(Block,State), place(Place), clear(Place,State).
legal_action(to_block(Block1,Y,Block2),State) :- 
   on(Block1,Y,State), clear(Block1,State), block(Block2), 
	Block1 \== Block2, clear(Block2,State).

clear(X,State) :- not member(on(A,X),State).
on(X,Y,State) :- member(on(X,Y),State).

update(to_block(X,Y,Z),State,State1) :-
   substitute(on(X,Y),on(X,Z),State,State1).
update(to_place(X,Y,Z),State,State1) :-
   substitute(on(X,Y),on(X,Z),State,State1).

substitute(X,Y,[X|Xs],[Y|Xs]).
substitute(X,Y,[X1|Xs],[X1|Ys]) :- X \== X1, substitute(X,Y,Xs,Ys).

%	Program 14.11: A depth-first planner
