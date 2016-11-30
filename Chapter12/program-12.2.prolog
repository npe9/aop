/*
   read_word_list(Words) :- 
	Words is a list of words read from the input stream via side effects.
*/
     read_word_list(Words) :- 
		get_char(FirstChar), read_words(FirstChar,Words).

     read_words(Char,[Word|Words]) :-
		word_char(Char), 
		read_word(Char,Word,NextChar), 
		read_words(NextChar,Words).
     read_words(Char,Words) :-
		fill_char(Char),
		get_char(NextChar),
		read_words(NextChar,Words).
     read_words(Char,[]) :-
		end_of_words_char(Char).

    read_word(Char,Word,NextChar) :- 
		word_chars(Char,Chars,NextChar),
		atom_list(Word,Chars).

     word_chars(Char,[Char|Chars],FinalChar) :- 
	  	word_char(Char), !,
		get_char(NextChar),
		word_chars(NextChar,Chars,FinalChar).
     word_chars(Char,[],Char) :- 
		not word_char(Char).

     word_char(C) :- 97 =< C, C =< 122.      % Lower-case letter
     word_char(C) :- 65 =< C, C =< 90.       % Upper-case letter
     word_char(95).                          % Hyphen
     word_char(C) :- 48 =< C, C =< 57.       % numeric digits as well

     fill_char(32).						 % Blank
     end_of_words_char(46).		   			 % Period

%  Program 12.2   Reading in a list of words
