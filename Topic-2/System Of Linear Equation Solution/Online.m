clc; clear; close all;

A = input('Enter A : ');
fprintf('\nMatrix A is :\n');
disp(A)

b = input('Enter b : ');
fprintf('\nMatrix B is :\n');
disp(b)

CorrectAns = GaussJordan(A,b);

ApproxAns = GaussSeidelWithPlot(A,b,1000,0.05,CorrectAns);

fprintf('\nCorrect Answer is :\n');
disp(CorrectAns);

fprintf('\nApproximate Answer is :\n');
disp(ApproxAns);
