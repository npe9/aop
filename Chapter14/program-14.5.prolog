
	/* Test data */

	test_color(Name,Map) :-
		map(Name,Map),
		colors(Name,Colors),
		color_map(Map,Colors).

	map(test,[region(a,A,[B,C,D]),     region(b,B,[A,C,E]), 
		      region(c,C,[A,B,D,E,F]), region(d,D,[A,C,F]),
			  region(e,E,[B,C,F]),     region(f,F,[C,D,E])]).

	map(west_europe,
		 [	region(portugal,P,[E]),  region(spain,E,[F,P]),
			region(france,F,[E,I,S,B,WG,L]),  region(belgium,B,[F,H,L,WG]),
			region(holland,H,[B,WG]), region(west_germany,WG,[F,A,S,H,B,L]),
			region(luxembourg,L,[F,B,WG]), region(italy,I,[F,A,S]),
			region(switzerland,S,[F,I,A,WG]), region(austria,A,[I,S,WG])]).

	colors(X,[red,yellow,blue,white]).

%	Program 14.5: Test data for map coloring
