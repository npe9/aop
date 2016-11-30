/* 
   false_solution(A,Clause) :-
	If A is a provable false instance, then Clause 
	is a false clause in the program. Top down algorithm.
*/
	false_solution(A,Clause) :-
		solve(A,Proof),
		false_goal(Proof,Clause).

    solve(true,true) :- !.
    solve((A,B),(ProofA,ProofB)) :- !,
       solve(A,ProofA), solve(B,ProofB).
    solve(A,(A:-builtin)) :- builtin(A), !, A.
    solve(A,(A:-Proof)) :-
       clause(A,B), solve(B,Proof).

	false_goal((A :- B),Clause) :-
		false_conjunction(B,Clause), !.
	false_goal((A :- B),(A :- B1)) :-
		extract_body(B,B1).

	false_conjunction(((A :- B),Bs),Clause) :-
		query_goal(A,false), !,
		false_goal((A :- B),Clause).
	false_conjunction((A :- B),Clause) :-
		query_goal(A,false), !,
		false_goal((A :- B),Clause).
	false_conjunction((A,As),Clause) :-
		false_conjunction(As,Clause).

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

%	Program 17.15: Top-down diagnosis of a false solution
