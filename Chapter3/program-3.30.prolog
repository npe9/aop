/*
	derivative(Expression,X,DifferentiatedExpression) :-
		DifferentiatedExpression is the derivative of
			Expression with respect to X.
*/

	derivative(X,X,s(0)).
	derivative(X ^ s(N),X,s(N) * X ^ N).
	derivative(sin(X),X,cos(X)).
	derivative(cos(X),X,-sin(X)).
	derivative(e ^ X,X,e ^ X).
	derivative(log(X),X,1/X).

	derivative(F+G,X,DF+DG) :-
		derivative(F,X,DF), derivative(G,X,DG).
	derivative(F-G,X,DF-DG) :-
		derivative(F,X,DF), derivative(G,X,DG).
	derivative(F*G,X,F*DG + DF*G) :-
		derivative(F,X,DF), derivative(G,X,DG).
	derivative(1/F,X,-DF/(F*F)) :-
		derivative(F,X,DF).
	derivative(F/G,X,(G*DF-F*DG)/(G*G)) :-
		derivative(F,X,DF), derivative(G,X,DG).

%	Program 3.30: Derivative rules
