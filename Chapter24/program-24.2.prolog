test_compiler(X,Y) :-
    program(X,P), compile(P,Y).

program(test1,[program,test1,';',begin,write,x,'+',y,'-',z,'/',2,end]).

program(test2,[program,test2,';',
	begin,if,a,'>',b,then,max,':=',a,else,max,':=',b,end]).

program(factorial,
    [program,factorial,';'
    ,begin
         ,read,value,';'
         ,count,':=',1,';'
         ,result,':=',1,';'
         ,while,count,'<',value,do
              ,begin
                   ,count,':=',count,'+',1,';'
                   ,result,':=',result,'*',count
              ,end,';'
         ,write,result
    ,end]).

%   Program 24.2   Test data
