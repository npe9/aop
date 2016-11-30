/*
        parse(Start,Tokens,N) :-
            The sequence of tokens Tokens, represented as a difference-list,
            can be reached by applying the grammar rules defined by -->/2,
            starting from Start, and N tokens are found.
*/
        parse(A,Tokens,N) :-
            nonterminal(A), A --> B, parse(B,Tokens,N).
        parse((A,B),Tokens\Xs,N) :-
            parse(A,Tokens\Tokens1,NA), parse(B,Tokens1\Xs,NB)
	    N is NA+NB.

        parse(A,Tokens,N) :-  terminals(A), connect(A,Tokens), length(A,N).
        parse({A},Xs\Xs,0) :-  A.

	terminals(Xs) :- list(Xs).

	list([]).
	list([X|Xs]) :- list(Xs).

        connect([ ],Xs\Xs).
        connect([W|Ws],[W|Xs]\Ys) :-  connect(Ws,Xs\Ys).

     length([X|Xs],N) :- length(Xs,N1), N is N1+1.
     length([],0).

%      Program 19.5:  A DCG interpreter that counts words
