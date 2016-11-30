/* 	
   missing_solution(A,Goal) :-
	If A is a non-provable true ground goal,then Goal is a
	true ground goal which is uncovered by the program.

*/

	missing_solution((A,B),Goal) :- !,
		( not A,missing_solution(A,Goal);
		A, missing_solution(B,Goal)).
	missing_solution(A,Goal) :-
		clause(A,B),
		query_clause((A :- B)), !,
		missing_solution(B,Goal).
	missing_solution(A,A) :-
		not system(A).

	query_clause(Clause) :-
		writeln(['Enter a true ground instance of ']), Clause,
		'if there is no such,or "no" otherwise']),
		read(Answer),
		!, check_answer(Answer,Clause).

	check_answer(no,Clause) :- !, fail.
	check_answer(Clause,Clause) :- !.
	check_answer(Answer,Clause) :-
		write('Illegal Answer'),
		!, query_clause(Clause).

     writeln([T|Ts]) :- write(T), write(' '), writeln(Ts).
     writeln([]) :- nl.

%  Program 17.16: Diagnosing missing solution
