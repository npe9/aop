   /*   Client data  */

bank_yield(client1,excellent).
requested_credit(client1,5000).

amount(local_currency_deposits,client1,3000).
amount(foreign_currency_deposits,client1,2000).
amount(bank_guarantees,client1,300).
                     
amount(negotiate_instruments,client1,500).
amount(stocks,client1,900).

amount(mortgage,client1,1200).
amount(documents,client1,1400).

value(net_worth_per_assets,client1,40).
value(last_year_sales_growth,client1,20).
value(gross_profits_on_sales,client1,45).
value(short_term_debt_per_annual_sales,client1,9).

ok_profile(client1).


%  Program 22.2: Test data for the credit evaluation system
