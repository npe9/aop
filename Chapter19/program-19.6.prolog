%    Grammar Rules

        sentence --> noun_phrase, verb_phrase.

        noun_phrase --> determiner, noun_phrase2.
        noun_phrase --> noun_phrase2.

        noun_phrase2 --> adjective, noun_phrase2.
        noun_phrase2 --> noun.

        verb_phrase --> verb.
        verb_phrase --> verb, noun_phrase.

%       Vocabulary

        determiner --> [the].    adjective --> [decorated]
        determiner --> [a].

        noun --> [pieplate].    verb --> [contains].
        noun --> [surprise].

%     Program 19.6:  A DCG context-free grammar
