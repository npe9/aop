/*
   area(Chain,Area) :- 
	Area is the area of the polygon enclosed by the list of points
	Chain, where the coordinates of each point are represented by 
	a pair (X,Y) of integers.
*/
     area([Tuple],0).
     area([(X1,Y1),(X2,Y2)|XYs],Area) :-
        area([(X2,Y2)|XYs],Area1), 
        Area is (X1*Y2-Y1*X2)/2 + Area1.

%  Program 8.8  Computing the area of polygons

