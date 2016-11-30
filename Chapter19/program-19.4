/*
        parse(Start,Tokens) :-
            The sequence of tokens Tokens represented as a difference-list
            can be reached by applying the grammar rules defined by -->/2,
            starting from Start.
*/
        parse(A,Tokens) :-
            nonterminal(A), A --> B, parse(B,Tokens).
        parse((A,B),Tokens\Xs) :-
            parse(A,Tokens\Tokens1), parse(B,Tokens1\Xs).

        parse(A,Tokens) :-  terminals(A), connect(A,Tokens).
        parse({A},Xs\Xs) :-  A.

	terminals(Xs) :- list(Xs).

	list([]).
	list([X|Xs]) :- list(Xs).

        connect([ ],Xs\Xs).
        connect([W|Ws],[W|Xs]\Ys) :-  connect(Ws,Xs\Ys).

%     Program 19.4:  A definite clause grammar (DCG) interpreter
