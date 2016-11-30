        number(0) --> [zero].
        number(N) --> xxx(N).

        xxx(N) -->
            digit(D), [hundred], rest_xxx(N1), {N is D100+N1}.
        xxx(N) --> xx(N).

        rest_xxx(0) --> [ ].
        rest_xxx(N) --> [and], xx(N).

        xx(N) --> digit(N).
        xx(N) --> teen(N).
        xx(N) --> tens(T), rest_xx(N1), {N is T+N1}.

        rest_xx(0) --> [ ].
        rest_xx(N) --> digit(N).

        digit(1) --> [one].         teen(10) --> [ten].
        digit(2) --> [two].         teen(11) --> [eleven].
        digit(3) --> [three].       teen(12) --> [twelve].
        digit(4) --> [four].        teen(13) --> [thirteen].
        digit(5) --> [five].        teen(14) --> [fourteen].
        digit(6) --> [six].         teen(15) --> [fifteen].
        digit(7) --> [seven].       teen(16) --> [sixteen].
        digit(8) --> [eight].       teen(17) --> [seventeen].
        digit(9) --> [nine].        teen(18) --> [eighteen].
                                    teen(19) --> [nineteen].
        tens(20) --> [twenty].
        tens(30) --> [thirty].
        tens(40) --> [forty].
        tens(50) --> [fifty].
        tens(60) --> [sixty].
        tens(70) --> [seventy].
        tens(80) --> [eighty].
        tens(90) --> [ninety].

%     Program 19.9:  A DCG for recognizing numbers
