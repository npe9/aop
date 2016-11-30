/*
     polynomial(Term,X) :- Term is a polynomial in X.
*/
	:- op(350, xfx,[^]).

     polynomial(X,X) :- !.
     polynomial(Term,X) :- 
        constant(Term), !.
     polynomial(Term1+Term2,X) :- 
        !, polynomial(Term1,X), polynomial(Term2,X).
     polynomial(Term1-Term2,X) :- 
        !, polynomial(Term1,X), polynomial(Term2,X).
     polynomial(Term1*Term2,X) :- 
        !, polynomial(Term1,X), polynomial(Term2,X).
     polynomial(Term1/Term2,X) :- 
        !, polynomial(Term1,X), constant(Term2).
     polynomial(Term ^ N,X) :- 		%   	$$$$ ^
        !, integer(N), N >= 0, polynomial(Term,X).	

%  Program 11.4   Recognizing polynomials
