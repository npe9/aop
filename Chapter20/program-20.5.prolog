% Data

initial_state(tree,a).	value(a,0).	final_state(j).

move(a,b).	value(b,1).	move(c,g).	value(g,6).
move(a,c).	value(c,5).	move(d,j).	value(j,9).
move(a,d).	value(d,7).	move(e,k).	value(k,1).
move(a,e).	value(e,2).	move(f,h).	value(h,3).
move(c,f).	value(f,4).	move(f,i).	value(i,2).

%   Program 20.5  Test data
