/*
    edit :- A line editor.  
	
Files are represented in the form file(Before,After), where After is a
list of lines after the current cursor position and Before is a list
of lines before the cursor in reverse order.

*   Note: Program has been augmented to accomodate boundary 
*         condition.
*/

     edit :- edit(file([],[])).

     edit(File) :-
		write_prompt, read(Command), edit(File,Command).

     edit(File,exit) :- !.
     edit(File,Command) :-
        apply(Command,File,File1), !, edit(File1).
     edit(File,Command) :-
		writeln([Command,' is not applicable']), !, edit(File).

     apply(up,file([X|Xs],Ys),file(Xs,[X|Ys])).
     apply(up,file([],Ys),file([],Ys)).
     apply(up(N),file(Xs,Ys),file(Xs1,Ys1)) :-
		N > 0, up(N,Xs,Ys,Xs1,Ys1).
     apply(down,file(Xs,[Y|Ys]),file([Y|Xs],Ys)).
     apply(down,file(Xs,[]),file(Xs,[])).
     apply(insert(Line),file(Xs,Ys),file(Xs,[Line|Ys])).
     apply(delete,file(Xs,[Y|Ys]),file(Xs,Ys)).
     apply(delete,file(Xs,[]),file(Xs,[])).
     apply(print,file([X|Xs],Ys),file([X|Xs],Ys)) :-
		write(X), nl.
     apply(print,file([],Ys),file([],Ys)) :-
		write('<<top>>'), nl.
     apply(print(*),file(Xs,Ys),file(Xs,Ys)) :- 
        reverse(Xs,Xs1), write_file(Xs1), write_file(Ys).
 
     up(N,[],Ys,[],Ys).
     up(0,Xs,Ys,Xs,Ys).
     up(N,[X|Xs],Ys,Xs1,Ys1) :- 
		N > 0, N1 is N-1, up(N1,Xs,[X|Ys],Xs1,Ys1).

     write_file([X|Xs]) :- 
		write(X), nl, write_file(Xs).
     write_file([]).

     write_prompt :- write('>>'), nl.

%  Program 12.5: A line editor
