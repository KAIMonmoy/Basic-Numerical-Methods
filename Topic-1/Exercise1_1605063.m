
close all; clear; clc;

%--------------------------------------------------------------------------------------

fprintf('Calculating the value of ln(1+x) using Taylor series\n\n');
val = input('Enter the value of x in ln(1+x) (-1 < x <= 1) : ');
nterms = input('Enter the number of terms you want in Taylor series : ');
ln_1plusX_Val = ln_1plusX_1605063(val,nterms);
fprintf('The value of ln(1 + %0.4f) calculated using Taylor series (upto %d terms) : %0.4f\n',...
    val,nterms,ln_1plusX_Val);

%--------------------------------------------------------------------------------------

fprintf('\nPlotting ln(1+x) functions.....\n\n');

xVals = -0.9 : 0.1 : 1 ;

builtin_ln_1plusX = log(1+xVals);
ln_1plusX_Val_n1 = ln_1plusX_1605063(xVals,1);
ln_1plusX_Val_n3 = ln_1plusX_1605063(xVals,3);
ln_1plusX_Val_n5 = ln_1plusX_1605063(xVals,5);
ln_1plusX_Val_n20 = ln_1plusX_1605063(xVals,20);

figure
plot(xVals,builtin_ln_1plusX,'-xr',xVals,ln_1plusX_Val_n1,'-.*y',xVals,ln_1plusX_Val_n3,'--go',xVals,ln_1plusX_Val_n5,'-.cd',xVals,ln_1plusX_Val_n20,':bs');
legend('ln(1+x) (library)','ln(1+x) (nTerm-01)','ln(1+x) (nTerm-03)','ln(1+x) (nTerm-05)','ln(1+x) (nTerm-20)','location','northwest');
title('Graph of ln(1+x)');
xlabel('-0.9 \leq x \leq 1');
ylabel('ln(1+x)');

%---------------------------------------------------------------------------------------------------

fprintf('\nPlotting Relative Error.....\n\n');
testVal = zeros(50);
testVal = testVal(1,:);
relError = zeros(49);
relError = relError(1,:);
for n = 1:50
    testVal(n) = ln_1plusX_1605063(0.5,n);
    if( n ~= 1)
        relError(n-1) = abs((testVal(n)-testVal(n-1))/testVal(n))*100;
    end
end
figure
plot(relError);
title('Approximate Relative Error');
xlabel('Iterations');
ylabel('Relative Error');

% un-comment xlim and ylim for better visualization

% xlim([1 10]);
% ylim([0 15]);
