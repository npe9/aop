/*
   range(M,N,Ns) :- Ns is the list of integers between M and N inclusive.
*/
     range(M,N,[M|Ns]) :- M < N, M1 is M+1, range(M1,N,Ns).
     range(N,N,[N]).

%  Program 8.12   Generating a list of integers in a given range

