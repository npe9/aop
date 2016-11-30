/*
   analogy(Pair1,Pair2,Answers) :-
	An analogy holds between the pairs of figures Pair1 and Pair2.
	The second element of Pair2 is one of the possible Answers.
*/
:- op(100,xfx,[is_to]).

analogy(A is_to B,C is_to X,Answers) :-
    match(A,B,Match),
    match(C,X,Match),
    member(X,Answers).

match(inside(Figure1,Figure2),inside(Figure2,Figure1),invert).
match(above(Figure1,Figure2),above(Figure2,Figure1),invert).

%	Program 14.13: A program solving geometric analogies
