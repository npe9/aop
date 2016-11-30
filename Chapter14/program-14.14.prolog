   /*  Testing and data		*/

:- op(40,xfx,[is_to]).

test_analogy(Name,X) :-
    figures(Name,A,B,C),
    answers(Name,Answers),
    analogy(A is_to B,C is_to X,Answers).

figures(test1,inside(square,triangle),inside(triangle,square),
					inside(circle,square)).
answers(test1,[inside(circle,triangle),inside(square,circle),
					inside(triangle,square)]).

%	Program 14.14: Testing ANALOGY 
