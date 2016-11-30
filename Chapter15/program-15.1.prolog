/*	
   append_dl(As,Bs,Cs) :-
	The difference-list Cs is the result of appending Bs to As,
		where As and Bs are compatible difference-lists.
*/
	:- op(40,xfx,\).

	append_dl(Xs\Ys,Ys\Zs,Xs\Zs).

%	Program 15.1:  Concatenating difference_lists
