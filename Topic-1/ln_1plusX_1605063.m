function [returnValue] = ln_1plusX_1605063 (x, n)

returnValue = 0;

if (abs(x)>1 | x == -1)
   fprintf('\nx is out of bound! (-1 < x <= 1)\n'); 
   n = 0;
   if (x == -1)
       returnValue = -Inf;
   end
end


for i = 1:n
    returnValue = returnValue + (power(-1,(i+1)) .* (power(x,i) ./ i));
end
