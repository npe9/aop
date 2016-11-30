    test_compose(X,Prog) :-
        program1(X,Prog1), program2(X,Prog2),
        skeleton(X,Skeleton), compose(Prog1,Prog2,Skeleton,Prog).

    program1(test,[
        (union([X1jXs1],Ys1,Zs1) :-
           member(X1,Ys1), union(Xs1,Ys1,Zs1)),
        (union([X2|Xs2],Ys2,[X2|Zs2]) :-
           nonmember(X2,Ys2), union(Xs2,Ys2,Zs2)),
        (union([ ],Ys3,Ys3) :-  true)]).

    program2(test,[
        (common([X1|Xs1],Ys1,N1) :-
           member(X1,Ys1), common(Xs1,Ys1,M1), N1 is M1+1),
        (common([X2|Xs2],Ys2,N2) :-
           nonmember(X2,Ys2), common(Xs2,Ys2,N2)),
        (common([ ],Ys3,0) :-  true)]).

    skeleton(test,[
        (skel([X1|Xs1],Ys1) :-  member(X1,Ys1), skel(Xs1,Ys1)),
        (skel([X2|Xs2],Ys2) :-  nonmember(X2,Ys2), skel(Xs2,Ys2)),
        (skel([ ],Ys3) :-  true)]).

    composition_specification(union(Xs,Ys,Us), common(Xs,Ys,N),
        skel(Xs,Ys),uc(Xs,Ys,Us,N)).

    map(union(Xs,Ys,Zs), skel(Xs,Ys)).
    map(common(Xs,Ys,N), skel(Xs,Ys)).

%    Program 18.7: Testing program composition
