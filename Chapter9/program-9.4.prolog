/*
   subterm(Sub,Term) :- Sub is a subterm of the ground term Term.
*/
     subterm(Term,Term).
     subterm(Sub,Term) :- 
        compound(Term), Term =.. [F|Args], subterm_list(Sub,Args).

     subterm_list(Sub,[Arg|Args]) :- 
        subterm(Sub,Arg).
     subterm_list(Sub,[Arg|Args]) :-
	subterm_list(Sub,Args).

%  Program 9.4   Subterm defined using univ
