/* 
    false_solution(A,Clause) :-
	If A is a provable false instance, then Clause is 
	a false clause in the program. Bottom up algorithm.
*/
	false_solution(A,Clause) :-
	   solve(A,Proof),
	   false_clause(Proof,Clause).

    solve(true,true) :- !.
    solve((A,B),(ProofA,ProofB)) :- !,
       solve(A,ProofA), solve(B,ProofB).
    solve(A,(A:-builtin)) :- builtin(A), !, A.
    solve(A,(A:-Proof)) :-
       clause(A,B), solve(B,Proof).

	false_clause(true,ok).
	false_clause(builtin,ok).
	false_clause((A,B),Clause) :-
		false_clause(A,ClauseA),
		check_conjunction(ClauseA,B,Clause).
	false_clause((A :- B),Clause) :-
		false_clause(B,ClauseB),
		check_clause(ClauseB,A,B,Clause).

	check_conjunction(ok,B,Clause) :-
		false_clause(B,Clause).
	check_conjunction((A :- B1),B,(A :- B1)).

	check_clause(ok,A,B,Clause) :-
		query_goal(A,Answer),
		check_answer(Answer,A,B,Clause).
	check_clause((A1 :- B1),A,B,(A1 :- B1)).

	check_answer(true,A,B,ok).
	check_answer(false,A,B,(A :- B1)) :-
		extract_body(B,B1).

	extract_body(true,true).
	extract_body((A :- B),A).
	extract_body(((A :- B),Bs),(A,As)) :-
		extract_body(Bs,As).

	query_goal(A,true) :- builtin(A).
	query_goal(Goal,Answer) :- 
		not builtin(Goal),
		writeln(['Is the Goal',Goal,'true?']),
		read(Answer).

     writeln([T|Ts]) :- write(T), write(' '), writeln(Ts).
     writeln([]) :- nl.

%  Program 17.14   Bottom-up diagnosis of a false solution
