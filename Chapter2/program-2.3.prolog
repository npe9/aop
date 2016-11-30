/*
	resistor(R,Node1,Node2) :-
	   R is a resistor between Node1 and Node2.
*/
	resistor(r1,power,n1).
	resistor(r2,power,n2).

/*
	transistor(T,Gate,Source,Drain) :-
		T is a transistor whose gate is Gate,
		source is Source, and drain is Drain.
*/

	transistor(t1,n2,ground,n1).
	transistor(t2,n3,n4,n2).
	transistor(t3,n5,ground,n4).

/*
	inverter(I,Input,Output) :-
	  I is an inverter which inverts Input to Output.
*/
	inverter(inv(T,R),Input,Output) :-
		transistor(T,Input,ground,Output),
		resistor(R,power,Output).

/*
	nand_gate(Nand,Input1,Input2,Output):-
		Nand is a gate forming the logical nand, Output,
		of Input1 and Input2.
*/
	nand_gate(nand(T1,T2,R),INput1,Input2,Output) :-
		transistor(T1,Input1,X,Output),
		transistor(T2,Input2,ground,X),
		resistor(R,power,Output).

/*
	and_gate(And,Input1,Input2,Output):-
		And is a gate forming the logical and, Output, 
		of Input1 and Input2.
*/

	and_gate(and(N,I),INput1,Input2,Output) :-
		nand_gate(N,Input1,Input2,X),
		inverter(I,X,Output).

%	   Program 2.3: The circuit database with names
