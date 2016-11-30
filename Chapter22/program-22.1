/*   Credit Evaluation

     credit(Client,Answer) :-
	Answer is the reply to a request by Client for credit.
*/
      credit(Client,Answer) :-
           ok_profile(Client),
           collateral_rating(Client,CollateralRating),
           financial_rating(Client,FinancialRating),
           bank_yield(Client,Yield),
           evaluate(profile(CollateralRating,FinancialRating,Yield),Answer) , !.

/*  The collateral rating module

     collateral_rating(Client,Rating) :-
	Rating is a qualitative description assessing the collateral
	offered by Client to cover the request for credit.
*/
     collateral_rating(Client,Rating) :-
        collateral_profile(Client,FirstClass,SecondClass,Illiquid),
        collateral_evaluation(FirstClass,SecondClass,Illiquid,Rating).

     collateral_profile(Client,FirstClass,SecondClass,Illiquid) :-
	requested_credit(Client,Credit),
	collateral_percent(first_class,Client,Credit,FirstClass),
	collateral_percent(second_class,Client,Credit,SecondClass),
	collateral_percent(Illiquid,Client,Credit,Illiquid).

     collateral_percent(Type,Client,Total,Value) :-
	findall(X,(collateral(Collateral,Type),
			amount(Collateral,Client,X)),Xs),
   	sumlist(Xs,Sum),
	Value is Sum*100/Total.

     /*   Evaluation rules    */

     collateral_evaluation(FirstClass,SecondClass,Illiquid,excellent) :-
  	FirstClass >= 100.
     collateral_evaluation(FirstClass,SecondClass,Illiquid,excellent) :-
  	FirstClass > 70, FirstClass + SecondClass >= 100.
     collateral_evaluation(FirstClass,SecondClass,Illiquid,good) :-
  	FirstClass + SecondClass > 60,
  	FirstClass + SecondClass < 70,
  	FirstClass + SecondClass + Illiquid >= 100.

     /*  Bank data - classification of collateral   */

     collateral(local_currency_deposits,first_class).
     collateral(foreign_currency_deposits,first_class).
     collateral(negotiate_instruments,second_class).
     collateral(mortgage,illiquid).

%    Financial rating

/*  
    financial_rating(Client,Rating) :-
	Rating  is a qualitative description assessing the financial 
	record offered by Client to support the request for credit.
*/	
     financial_rating(Client,Rating) :-
        financial_factors(Factors),
        score(Factors,Client,0,Score),
        calibrate(Score,Rating).

     /*   Financial evalauation rules   */

     calibrate(Score,bad) :- 	   Score =< -500.
     calibrate(Score,medium) :-    -500 < Score, Score < 150.
     calibrate(Score,good) :- 	   150 =< Score, Score < 1000.
     calibrate(Score,excellent) :- Score >= 1000.

     /*  Bank data - weighting factors	*/

     financial_factors([(net_worth_per_assets,5),
         (last_year_sales_growth,1),
         (gross_profits_on_sales,5),
         (short_term_debt_per_annual_sales,2)  ]).

     score([(Factor,Weight)|Factors],Client,Acc,Score) :-
        value(Factor,Client,Value),
        Acc1 is Acc + Weight*Value,
        score(Factors,Client,Acc1,Score).
     score([],Client,Score,Score).

/*  Final evaluation    

     evaluate(Profile,Outcome) :-
	Outcome is the reply to the client's Profile.
*/
     evaluate(Profile,Answer) :- 
	rule(Conditions,Answer), verify(Conditions,Profile).

     verify([condition(Type,Test,Rating)|Conditions],Profile) :-
        scale(Type,Scale),
        select_value(Type,Profile,Fact),
        compare(Test,Scale,Fact,Rating),
        verify(Conditions,Profile).
     verify([],Profile).

     compare('=',Scale,Rating,Rating).
     compare('>',Scale,Rating1,Rating2) :-
        precedes(Scale,Rating1,Rating2).
     compare('>=',Scale,Rating1,Rating2) :-
        precedes(Scale,Rating1,Rating2) ; Rating1 = Rating2.
     compare('<',Scale,Rating1,Rating2) :-
        precedes(Scale,Rating2,Rating1).
     compare('=<',Scale,Rating1,Rating2) :-
        precedes(Scale,Rating2,Rating1) ; Rating1 = Rating2.

     precedes([R1|Rs],R1,R2).
     precedes([R|Rs],R1,R2) :- R \== R2, precedes(Rs,R1,R2).

	select_value(collateral,profile(C,F,Y),C).
	select_value(finances,profile(C,F,Y),F).
	select_value(yield,profile(C,F,Y),Y).

     /*  Utilities   */

	sumlist(Is,Sum) :-
		sumlist(Is,0,Sum).
	sumlist([I|Is],Temp,Sum) :-
		Temp1 is Temp + I,
		sumlist(Is,Temp1,Sum).
	sumlist([],Sum,Sum).


/*  Bank data and rules	*/

rule([condition(collateral,'>=',excellent),condition(finances,'>=',good),
			condition(yield,'>=',reasonable)],give_credit).  
rule([condition(collateral,'=',good),condition(finances,'=',good),
			condition(yield,'>=',reasonable)],consult_superior).
rule([condition(collateral,'=<',moderate),condition(finances,'=<',medium)],
							  refuse_credit).

scale(collateral,[excellent,good,moderate]).
scale(finances,[excellent,good,medium,bad]).
scale(yield,[excellent,reasonable,poor]).

%  Program 22.1:  A credit evaluation system
