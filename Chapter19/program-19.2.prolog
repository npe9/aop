        s(N) --> a(N), b(N), c(N).

        a(N) --> [a], a(N1), {N is N1+1}.
        a(0) --> [ ].

        b(N) --> [b], b(N1), {N is N1+1}.
        b(0) --> [ ].

        c(N) --> [c], c(N1), {N is N1+1}.
        c(0) --> [ ].

%      Program 19.2:  Recognizing the language a^Nb^Nc^N
