function x = GaussSeidelWithPlot(A,b,maxIter,tolerence,CorrectAnswer)

C = A;
d = zeros(size(b));

n = size(b);

for i = 1 : n
   C(i,:) = C(i,:) ./ A(i,i);
   C(i,i) = 0;
   d(i) = b(i) ./ A(i,i);
end

disp(C)
disp(d)

nIter = 0;

x = randi(10,size(b));
ea = 100 * ones(size(b));
er = 100 * ones(size(b));
PlotEA = zeros(20,1);
PlotER = zeros(20,1);


while(1)
    xold = x;
    for i = 1:n
        x(i) = d(i) - C(i,:)*x;
        if(x(i) ~= 0)
           ea(i) = abs((x(i) - xold(i)) / x(i)) * 100;
           er(i) = abs((x(i) - CorrectAnswer(i)) / CorrectAnswer(i)) * 100;
        end
    end
    nIter = nIter + 1;
    if(nIter <= 20)
       PlotEA(nIter) = sum(ea);
       PlotER(nIter) = sum(er);
    end
    if( (max(ea) <= tolerence) || (nIter >= maxIter) )
       break 
    end
end

figure
plot(PlotEA);
title('Approximate Relative Error');
xlabel('Iterations');
ylabel('Relative Error');
xlim([1 20]);

figure
plot(PlotER);
title('Absolute Error');
xlabel('Iterations');
ylabel('Absolute Error');
xlim([1 20]);
