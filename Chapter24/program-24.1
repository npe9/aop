/*
   compile(Tokens,ObjectCode) :-
	ObjectCode is the result of compilation of a list of tokens 
	representing a PL program.
*/
	:- op(40,xfx,\).
	:- op(800,fx,#).
	:- op(780,xf,^).

	compile(Tokens,ObjectCode) :-
	   parse(Tokens,Structure),
	   encode(Structure,Dictionary,Code),
	   assemble(Code,Dictionary,ObjectCode).

/*    The parser

   parse(Tokens,Structure) :-
     Structure represents the successfully parsed list of Tokens.
*/

parse(Source,Structure) :-
	pl_program(Source\[],Structure).

pl_program(S) --> [program], identifier(X), [';'], statement(S).    
                           
statement((S;Ss)) --> 
    [begin], statement(S), rest_statements(Ss).
statement(assign(X,V)) --> 
    identifier(X), [':='], expression(V).
statement(if(T,S1,S2)) -->
    [if], test(T), [then], statement(S1), [else], statement(S2).
statement(while(T,S)) --> 
    [while], test(T), [do], statement(S).
statement(read(X)) --> 
    [read], identifier(X).
statement(write(X)) --> 
    [write], expression(X).

rest_statements((S;Ss)) --> [';'], statement(S), rest_statements(Ss).  
rest_statements(void) --> [end].

expression(X) --> pl_constant(X).
expression(expr(Op,X,Y)) --> pl_constant(X), arithmetic_op(Op), expression(Y).

arithmetic_op('+') --> ['+'].
arithmetic_op('-') --> ['-'].
arithmetic_op('*') --> ['*'].
arithmetic_op('/') --> ['/'].

pl_constant(name(X)) --> identifier(X).
pl_constant(number(X)) --> pl_integer(X).

	identifier(X) --> [X], {atom(X)}.
	pl_integer(X) --> [X], {integer(X)}.

test(compare(Op,X,Y)) --> expression(X), comparison_op(Op), expression(Y).

comparison_op('=') --> ['='].
comparison_op('\=') --> ['\='].
comparison_op('>') --> ['>'].
comparison_op('<') --> ['<'].
comparison_op('>=') --> ['>='].
comparison_op('=<') --> ['=<'].

/*   The code generator

   encode(Structure,Dictionary,RelocatableCode) :-
	RelocatableCode is generated from the parsed Structure 
	building a Dictionary associating variables with addresses.
*/
   encode((X;Xs),D,(Y;Ys)) :-  
       encode(X,D,Y), encode(Xs,D,Ys).
   encode(void,D,no_op).
   encode(assign(Name,E),D,(Code; instr(store,Address))) :-
      lookup(Name,D,Address), encode_expression(E,D,Code).
   encode(if(Test,Then,Else),D,
       (TestCode; ThenCode; instr(jump,L2); label(L1); ElseCode; label(L2))) :-
      encode_test(Test,L1,D,TestCode),
      encode(Then,D,ThenCode),
      encode(Else,D,ElseCode).
   encode(while(Test,Do),D, 
	(label(L1); TestCode; DoCode; instr(jump,L1); label(L2))) :-
    	encode_test(Test,L2,D,TestCode), encode(Do,D,DoCode).
   encode(read(X),D,instr(read,Address)) :-
   	lookup(X,D,Address).
   encode(write(E),D,(Code; instr(write,0))) :-
    	encode_expression(E,D,Code).

/*   encode_expression(Expression,Dictionary,Code) :-
	Code corresponds to an arithmetic Expression.
*/
    encode_expression(number(C),D,instr(loadc,C)).
    encode_expression(name(X),D,instr(load,Address)) :- 
       lookup(X,D,Address).
    encode_expression(expr(Op,E1,E2),D,(Load;Instruction)) :-
       single_instruction(Op,E2,D,Instruction),
       encode_expression(E1,D,Load).
    encode_expression(expr(Op,E1,E2),D,Code) :-
       not single_instruction(Op,E2,D,Instruction),
       single_operation(Op,E1,D,E2Code,Code),
       encode_expression(E2,D,E2Code).

    single_instruction(Op,number(C),D,instr(OpCode,C)) :- 
        literal_operation(Op,OpCode).
    single_instruction(Op,name(X),D,instr(OpCode,A)) :- 
        memory_operation(Op,OpCode), lookup(X,D,A).

    single_operation(Op,E,D,Code,(Code;Instruction)) :-
	commutative(Op), single_instruction(Op,E,D,Instruction).
    single_operation(Op,E,D,Code,
   		(Code;instr(store,Address);Load;instr(OpCode,Address))) :-
	not commutative(Op), 
	lookup('$temp',D,Address),
	encode_expression(E,D,Load),
	op_code(E,Op,OpCode).

     op_code(number(C),Op,OpCode) :-  literal_operation(Op,OpCode).
     op_code(name(X),Op,OpCode) :-  memory_operation(Op,OpCode).

     literal_operation('+',addc).	memory_operation('+',add).
     literal_operation('-',subc).	memory_operation('-',sub).
     literal_operation('*',mulc).	memory_operation('*',mul).
     literal_operation('/',divc).	memory_operation('/',div).

     commutative('+').		commutative('*').

   encode_test(compare(Op,E1,E2),Label,D,(Code; instr(OpCode,Label))) :-
   	comparison_opcode(Op,OpCode),
   	encode_expression(expr('-',E1,E2),D,Code).
	
   comparison_opcode('=',jumpne).   	comparison_opcode('\=',jumpeq).
   comparison_opcode('>',jumple).	comparison_opcode('>=',jumplt).
   comparison_opcode('<',jumpge).	comparison_opcode('=<',jumpgt).

	lookup(Key,dict(Key,X,Left,Right),Value) :-
		!, X = Value.
	lookup(Key,dict(Key1,X,Left,Right),Value) :-
		Key < Key1 , lookup(Key,Left,Value).
	lookup(Key,dict(Key1,X,Left,Right),Value) :-
		Key > Key1, lookup(Key,Right,Value).

/*  The assembler

   assemble(Code,Dictionary,TidyCode) :-
	TidyCode is the result of assembling Code removing
	no_ops and labels, and filling in the Dictionary.
*/

   assemble(Code,Dictionary,TidyCode) :-
      tidy_and_count(Code,1,N,TidyCode\(instr(halt,0);block(L))),
      N1 is N + 1,
      allocate(Dictionary,N1,N2),
      L is N2 - N1, !.

   tidy_and_count((Code1;Code2),M,N,TCode1\TCode2) :-
      tidy_and_count(Code1,M,M1,TCode1\Rest), 
      tidy_and_count(Code2,M1,N,Rest\TCode2).
   tidy_and_count(instr(X,Y),N,N1,(instr(X,Y);Code)\Code) :- 
      N1 is N + 1.
   tidy_and_count(label(N),N,N,Code\Code).
   tidy_and_count(no_op,N,N,Code\Code).

     allocate(void,N,N).
     allocate(dic(Name,N1,Before,After),N0,N) :-
        allocate(Before,N0,N1),
        N2 is N1 + 1,
        allocate(After,N2,N).

%  Program 24.1:  A compiler from PL to machine language

