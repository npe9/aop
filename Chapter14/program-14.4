/*
color_map(Map,Colors) :-
	Map is colored with Colors, so that no two neighbors have the same
	color. The map is represented as an adjacency-list of regions
	region(Name,Color,Neighbors), where Name is the name of the
	region, Color is its color, and Neighbors are the colors of the 
	neighbors. 
*/
	color_map([Region|Regions],Colors) :-
		color_region(Region,Colors),
		color_map(Regions,Colors).
	color_map([],Colors).
/*
   color_region(Region,Colors) :-
	Region and its neighbors are colored using Colors so that the
	region's color is different from the color of any of its neighbors.
*/
	color_region(region(Name,Color,Neighbors),Colors) :-
		select(Color,Colors,Colors1),
		members(Neighbors,Colors1).

	select(X,[X|Xs],Xs).
	select(X,[Y|Ys],[Y|Zs]) :- select(X,Ys,Zs).

     members([X|Xs],Ys) :- member(X,Ys), members(Xs,Ys).
     members([],Ys).

%	Program 14.4: Map coloring
