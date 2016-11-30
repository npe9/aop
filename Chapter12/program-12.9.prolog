/*
    consult_(File) :- 
	The clauses of the program in the file File are read and asserted.
*/

	consult_(File) :- open(File,read,DD), consult_loop(DD), close(DD).

	consult_loop(DD) :- repeat, read(Clause), process(Clause,DD)), !.

	process(Clause,DD) :- at_end_of_stream(DD).
	process(Clause,DD) :- assertz(Clause), fail.

%  Program 12.9:    Consulting a file

