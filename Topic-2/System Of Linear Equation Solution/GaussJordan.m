function x = GaussJordan(A,b)

[m,n] = size(A);
if m~=n 
    error('Matrix A must be square'); end
nb = n+1;
Aug = [A b];
% forward elimination
for k = 1:n-1
% partial pivoting
[big,i]=max(abs(Aug(k:n,k)));
ipr=i+k-1;
if ipr~=k
Aug([k,ipr],:)=Aug([ipr,k],:);
end
for i = k+1:n
factor = Aug(i,k)/Aug(k,k);
Aug(i,k:nb) = Aug(i,k:nb)-factor*Aug(k,k:nb);
end
end
% backward elimination

for k = n:-1:2
    Aug(k,:) = Aug(k,:) ./ Aug(k,k);
for i = k-1:-1:1
factor = Aug(i,k);
Aug(i,k:nb) = Aug(i,k:nb)-factor*Aug(k,k:nb);
end
end

Aug(1,:) = Aug(1,:) ./ Aug(1,1);

disp(Aug)

x = Aug(:,n+1);
