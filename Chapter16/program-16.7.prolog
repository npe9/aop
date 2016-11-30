/*
   kwic(Titles,KWTitles) :-
	KWTitles is a KWIC index of the list of titles Titles.
*/
     kwic(Titles,KWTitles) :-
        setof(Ys,Xs^(member(Xs,Titles),rotate_and_filter(Xs,Ys)),KWTitles).

/*
   rotate_and_filter(Xs,Ys) :-
	Ys is a rotation of the list Xs such that
	the first word of Ys is significant and |
	is inserted after the last word of Xs.
*/

     rotate_and_filter(Xs,Ys) :-
        append(As,[Key|Bs],Xs), 
        not insignificant(Key), 
	append([Key|Bs],[`|`|As],Ys).

%	Vocabulary

     insignificant(a).        insignificant(the).
     insignificant(in).       insignificant(for).

%	Testing and data

test_kwic(Books,Kwic) :-
	titles(Books,Titles), kwic(Titles,Kwic).

titles(lp,[[logic,for,problem,solving],
	   [logic,programming],
	   [algorithmic,program,debugging],
	   [programming,in,prolog]]).

%  Program 16.7   Producing a keyword in context (KWIC) index
