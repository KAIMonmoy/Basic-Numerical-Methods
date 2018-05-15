function [root, nIter] = falsePositionMethod_1605063(func, xl, xu, es, maxIter)

while(func(xl)*func(xu)>=0)
    xl = input('Invalid Limits!\nEnter lower limit guess : ');
    xu = input('Enter upper limit guess : ');
end

if(xl > xu)
    xl = xl + xu;
    xu = xl - xu;
    xl = xl - xu;
end

nIter = 0;
ea = (1.1 * es + 0.1); %added .1 for handling ea = 0
xr = 0;
xr0 = 0;

while (nIter < maxIter && ea > es)
   xr0 = xr;
   xr = xu - ((func(xu)*(xl - xu))/(func(xl)-func(xu)));
   nIter = nIter + 1;
   if(xr ~= 0 && nIter~=1)
       ea = abs((xr-xr0)/xr)*100;
   end
   test = func(xl) * func(xr);
   if (test == 0)
       ea = 0.0;
   elseif (test < 0)
           xu = xr;
   else
       xl = xr;
   end
end

root = xr;

fprintf('\nFalse position method\n\n');
fprintf('Estimated Root = %0.6f\n', root);
fprintf('Function(Root) = %0.6f\n', func(root));
fprintf('Approximate error = %0.6f\n', ea);
fprintf('Number of iterations = %d\n', nIter);
