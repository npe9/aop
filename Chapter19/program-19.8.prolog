        sentence(sentence(NP,VP)) -->
            noun_phrase(NP,Num), verb_phrase(VP,Num).

        noun_phrase(np(D,N),Num) -->
            determiner(D,Num), noun_phrase2(N,Num).
        noun_phrase(np(N),Num) --> noun_phrase2(N,Num).

        noun_phrase2(np2(A,N),Num) -->
            adjective(A), noun_phrase2(N,Num).
        noun_phrase2(np2(N),Num) --> noun(N,Num).

        verb_phrase(vp(V),Num) --> verb(V,Num).
        verb_phrase(vp(V,N),Num) -->
            verb(V,Num), noun_phrase(N,Num1).

%       Vocabulary

        determiner(det(the),Num) --> [the].
        determiner(det(a),singular) --> [a].

        noun(noun(pieplate),singular) --> [pieplate].
        noun(noun(pieplates),plural) --> [pieplates].
        noun(noun(surprise),singular) --> [surprise].
        noun(noun(surprises),plural) --> [surprises].

        adjective(adj(decorated)) --> [decorated].

        verb(verb(contains),singular) --> [contains].
        verb(verb(contain),plural) --> [contain].

%     Program 19.8:  A DCG with subject/object number agreement
