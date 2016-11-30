
     logg :- shell_flag(logg).

     shell_flag(Flag) :- 
		shell_prompt, shell_read(Goal,Flag), shell(Goal,Flag).

     shell(exit,Flag) :- 
	!, close_logging_file.
     shell(nolog,Flag) :-
	!, shell_flag(nolog).
     shell(logg,Flag) :-
	!, shell_flag(logg).
     shell(Goal,Flag) :-
	ground(Goal), !, shell_solve_ground(Goal,Flag), shell_flag(Flag).
     shell(Goal,Flag) :-
        shell_solve(Goal,Flag), shell_flag(Flag).
     
     shell_solve(Goal,Flag) :- 
        Goal, flag_write(Goal,Flag), nl.
     shell_solve(Goal,Flag) :- 
        flag_write('No (more) solutions',Flag), nl.
     
     shell_solve_ground(Goal,Flag) :- 
		Goal, !, flag_write('Yes',Flag), nl.
     shell_solve_ground(Goal,Flag) :- 
		flag_write('No',Flag), nl.
          
     shell_prompt :- write('Next command? ').

     shell_read(X,logg) :-
		read(X), 
		file_write(['Next command? ',X],'prolog.log').
     shell_read(X,nolog) :- read(X).

     flag_write(X,nolog) :- write(X).
     flag_write(X,logg) :- write(X), file_write(X,'prolog.log').

     file_write(X,File) :- write_term(File,Term,[]).
     close_logging_file :- close('prolog.log').

%	Program 12.7 Logging a session
