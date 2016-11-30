        s(N) --> a(NA), b(NB), c(NC), {N is NA+NB+NC}.

        a(N) --> [a], a(N1), {N is N1+1}.
        a(0) --> [ ].

        b(N) --> [b], b(N1), {N is N1+1}.
        b(0) --> [ ].

        c(N) --> [c], c(N1), {N is N1+1}.
        c(0) --> [ ].

%     Program 19.1:  Enhancing the language a*b*c
