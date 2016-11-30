/*
        process(Program, RedProgram) :-
           Partially reduce each of the clauses in Program to produce
           RedProgram.
*/
        process(Prog,NewProg) :-
           findall(PCl,(member(Cl,Prog),preduce(Cl,PCl)),NewProg).

        test(Name,Program) :-
           program(Name,Clauses), process(Clauses,Program).

/*
        preduce(Goal,Residue) :-
           Partially reduce Goal to leave the residue Residue.
*/
        preduce((A :-  B),(PA :-  PB))  :-
           !, preduce(B,PB), preduce(A,PA).
        preduce(true,true) :-  !.
        preduce((A,B),Res) :-
           !, preduce(A,PA), preduce(B,PB), combine(PA,PB,Res).
        preduce(A,B) :-  should_fold(A,B), !.
        preduce(A,Residue) :-
           should_unfold(A), !, clause(A,B), preduce(B,Residue).
        preduce(A,A).

        combine(true,B,B) :-  !.
        combine(A,true,A) :-  !.
        combine(A,B,(A,B)).

%    Program 18.3: A simple partial reduction system
