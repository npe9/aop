  /*  Testing and data  */

test_plan(Name,Plan) :-
   initial_state(Name,I), final_state(Name,F), transform(I,F,Plan).

initial_state(test,[on(a,b),on(b,p),on(c,r)]).
final_state(test,[on(a,b),on(b,c),on(c,r)]).

block(a).	block(b).	block(c).
place(p).	place(q).	place(r).

%	Program 14.12: Testing the depth-first planner
