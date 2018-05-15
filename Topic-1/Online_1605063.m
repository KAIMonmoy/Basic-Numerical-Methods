close all; clear; clc;
%--------------------------------------------------------------------------------------

f = @(x) ( x - exp(-x) );


xVals = -2 : 0.01 : 2;
yVals = f(xVals);
xLine = zeros(1,length(xVals));
plot(xVals, yVals, xVals, xLine);
grid on;
grid minor;
legend('Function Values', 'y=0 line', 'location', 'southeast');

es = .005;

[rootFP, nIterFP] = falsePositionMethod_1605063(f,0,1,es,1000);

[rootBS, nIterBS] = bisectionMethod_1605063(f,0,1,es,1000);
