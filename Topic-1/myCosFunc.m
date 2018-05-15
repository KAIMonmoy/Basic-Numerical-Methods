function [returnValue] = myCosFunc(val, term_no)

%creating syms object to use with built-in taylor() function
syms x;
%using taylor() to find the function
f(x) = taylor(log(1+x),'Order',(2*term_no - 1));

%returning the value of myCosFunc
returnValue = double(f(val));