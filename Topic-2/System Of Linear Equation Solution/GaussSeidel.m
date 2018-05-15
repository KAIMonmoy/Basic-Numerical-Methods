function x = GaussSeidel(A,b,maxIter,tolerence)

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



while(1)
    xold = x;
    for i = 1:n
        x(i) = d(i) - C(i,:)*x;
        if(x(i) ~= 0)
           ea(i) = abs((x(i) - xold(i)) / x(i)) * 100;
        end
    end
    nIter = nIter + 1;
    if( (max(ea) <= tolerence) || (nIter >= maxIter) )
       break 
    end
end
