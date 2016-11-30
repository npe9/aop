/*
	palindrome(Xs) :-
		The string represented by the list Xs is a palindrome.
*/

	palindrome(Xs) :- palindrome(Xs,push,[]).

	palindrome([X|Xs],push,S) :- palindrome(Xs,push,[X|S]).
	palindrome([X|Xs],push,S) :- palindrome(Xs,pop,[X|S]).
	palindrome([X|Xs],push,S) :- palindrome(Xs,pop,S).
	palindrome([X|Xs],pop,[X|S]) :- palindrome(Xs,pop,S).
	palindrome([],pop,[]).

%  Program 18.1 : A program accepting palindromes
