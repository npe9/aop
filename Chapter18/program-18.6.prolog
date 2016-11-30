/*
  compose(Program1,Program2,Skeleton,FinalProgram) :-
     FinalProgram is the result of composing Program1 and
     Program2, which are both enhancements of Skeleton.
*/

compose([Cl1|Cls1],[Cl2|Cls2],[ClSkel|ClsSkel],[Cl|Cls]) :-
    compose_clause(Cl1,Cl2,ClSkel,Cl),
    compose(Cls1,Cls2,ClsSkel,Cls).
compose([ ],[ ],[ ],[ ]).

compose_clause((A1 :- B1),(A2 :- B2),(ASkel :- BSkel),(A :- B)) :-
    composition_specification(A1,A2,ASkel,A),
    compose_bodies(BSkel,B1,B2,B\true).

compose_bodies(SkelBody,Body1,Body2,B\BRest) :-
    first(SkelBody,G), !,
    align(G,Body1,G1,RestBody1,B\B1),
    align(G,Body2,G2,RestBody2,B1\(Goal,B2)),
    compose_goal(G1,G2,Goal),
    rest(SkelBody,Gs),
    compose_bodies(Gs,RestBody1,RestBody2,B2\BRest).
compose_bodies(true,Body1,Body2,B\BRest) :-
    rest_goals(Body1,B\B1), rest_goals(Body2,B1\BRest).

align(Goal,Body,G,RestBody,B\B) :-
    first(Body,G), correspond(G,Goal), !, rest(Body,RestBody).
align(Goal,(G,Body),CorrespondingG,RestBody,(G,B)\B1) :-
    align(Goal,Body,CorrespondingG,RestBody,B\B1).

first((G,Gs),G).                    
first(G,G)   G \== (A,B), G \== true. 

rest((G,Gs),Gs).
rest(G,true) :-  G \== (A,B).

correspond(G,G).
correspond(G,B) :-  map(G,B).

compose_goal(G,G,G) :-  !.
compose_goal(A1,A2,A) :-
    !, composition_specification(A1,A2,ASkel,A).

rest_goals(true,B\B) :-  !.
rest_goals(Body,(G,B)\BRest) :-
    first(Body,G), !, rest(Body,Body1), rest_goals(Body1,B\BRest).

%  Program 18.6: Composing two enhancements of a skeleton
