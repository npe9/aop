/*
  pension(Person,Pension) :- Pension is the type of pension received by Person.
*/
     pension(X,invalid_pension) :- invalid(X).
     pension(X,old_age_pension) :- over_65(X), paid_up(X).
     pension(X,supplem_benefit) :- over_65(X).

     invalid(mc_tavish).

     over_65(mc_tavish).      over_65(mc_donald).    over_65(mc_duff).

     paid_up(mc_tavish).      paid_up(mc_donald).

%  Program 11.11a   Determining welfare payments
