	/* Problem Solving :- Water Jugs Problem */

	initial_state(jugs,jugs(0,0)).

     final_state(jugs(4,V2)).            
     final_state(jugs(V1,4)).

     move(jugs(V1,V2),fill(1)).	        
     move(jugs(V1,V2),fill(2)).
     move(jugs(V1,V2),empty(1)).	
     move(jugs(V1,V2),empty(2)).
     move(jugs(V1,V2),transfer(2,1)).	
     move(jugs(V1,V2),transfer(1,2)).

     update(jugs(V1,V2),fill(1),jugs(C1,V2)) :- capacity(1,C1).
     update(jugs(V1,V2),fill(2),jugs(V1,C2)) :- capacity(2,C2).
     update(jugs(V1,V2),empty(1),jugs(0,V2)).
     update(jugs(V1,V2),empty(2),jugs(V1,0)).
     update(jugs(V1,V2),transfer(2,1),jugs(W1,W2)) :-
	capacity(1,C1),
	Liquid is V1 + V2,
	Excess is Liquid - C1,
	adjust(Liquid,Excess,W1,W2).
     update(jugs(V1,V2),transfer(1,2),jugs(W1,W2)) :-
	capacity(2,C2),
        Liquid is V1 + V2,
        Excess is Liquid - C2,
        adjust(Liquid,Excess,W2,W1).

     adjust(Liquid, Excess,Liquid,0) :- Excess =< 0.
     adjust(Liquid,Excess,V,Excess) :- Excess > 0, V is Liquid - Excess.

     legal(jugs(V1,V2)).

     capacity(1,8).		
     capacity(2,5).

%  Program 20.3    Solving the water jugs problem
