close all; clear; clc;
%--------------------------------------------------------------------------------------

f = @(x) ( (tan(x) * 90 ) - ( (9.8 * 90^2 ) ./ ( 2 * 30^2 * (cos(x)).^2 ) ) + (1.8 - 1) );


xVals = 0 : 0.01 : pi/2.6;
yVals = f(xVals);
xLine = zeros(1,length(xVals));
plot(xVals, yVals, xVals, xLine);
grid on;
grid minor;
legend('Function Values', 'y=0 line', 'location', 'southwest');

es = .005;

[rootSM, nIterSM] = secantMethod_1605063(f,0.8,1.2,es,1000);

[rootFP, nIterFP] = falsePositionMethod_1605063(f,0.8,1.2,es,1000);
