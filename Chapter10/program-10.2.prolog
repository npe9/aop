/*
   length(Xs,N) :- The list Xs has length N.
*/
   length(Xs,N) :- nonvar(Xs), length1(Xs,N).
   length(Xs,N) :- var(Xs), nonvar(N), length2(Xs,N).

/*
   length1(Xs,N) :- N is the length of the list Xs.
*/
     length1([X|Xs],N) :- length1(Xs,N1), N is N1+1.
     length1([],0).

/*
   length2(Xs,N) :- Xs is a list of length N.
*/
     length2([X|Xs],N) :- N > 0, N1 is N-1, length2(Xs,N1).
     length2([],0).

%  Program 10.2    A multipurpose length program

