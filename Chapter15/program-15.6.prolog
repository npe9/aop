/*  
   dutch(Xs,RedsWhitesBlues) :-
	RedsWhitesBlues is a list of elements of Xs ordered 
		by color: red, then white, then blue.
*/
	:- op(40,xfx,\).

	dutch(Xs,RedsWhitesBlues) :-
		distribute_dls(Xs,RedsWhitesBlues\WhitesBlues,
			WhitesBlues\Blues,Blues\[]).

/*	
    distribute_dls(Xs,Reds,Whites,Blues) :-
	Reds,Whites,Blues are difference-lists of red, white,
		and blue elements in Xs, respectively.
*/

	distribute_dls([red(X)|Xs],[red(X)|Reds]\Reds1,Whites,Blues) :-
		distribute_dls(Xs,Reds\Reds1,Whites,Blues).
	distribute_dls([white(X)|Xs],Reds,[white(X)|Whites]\Whites1,Blues) :-
		distribute_dls(Xs,Reds,Whites\Whites1,Blues).
	distribute_dls([blue(X)|Xs],Reds,Whites,[blue(X)|Blues]\Blues1) :-
		distribute_dls(Xs,Reds,Whites,Blues\Blues1).
	distribute_dls([],Reds\Reds,Whites\Whites,Blues\Blues).

%	Program 15.6: Dutch Flag with difference-lists.
