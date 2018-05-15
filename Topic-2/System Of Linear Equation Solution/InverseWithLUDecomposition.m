function X = InverseWithLUDecomposition(A)

[m,n] = size(A);
if m~=n 
    error('Matrix A must be square'); end

L = zeros(n);
swaps = [1 1];
% forward elimination
for k = 1:n-1
    
% partial pivoting
[~,i]=max(abs(A(k:n,k)));
ipr=i+k-1;
if ipr~=k
A([k,ipr],:)=A([ipr,k],:);
L([k,ipr],:)=L([ipr,k],:);
swaps = [swaps; ipr k];

end

for i = k+1:n
factor = A(i,k)/A(k,k);
A(i,k:n) = A(i,k:n)-factor*A(k,k:n);
L(i,k) = factor;
end
end

L = L + eye(n);

%L is the matrix of factors & A is now U

X = zeros(n);
B = eye(n);

for m = 1 : n
    
b = B(:,m);
% forward substitution
y = zeros(size(b));
y(1) = b(1);
for i = 2:n
y(i) = b(i) - L(i,1:i-1) * y(1:i-1);
end

Aug = [A y];
nb = n+1;

% back substitution
x = zeros(n,1);
x(n) = Aug(n,nb)/Aug(n,n);
for i = n-1:-1:1
x(i) = (Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
end

X(:,m) = x;
end

[nSwaps,~] = size(swaps);


for i = nSwaps : -1 : 2
    X(:,[swaps(i,1),swaps(i,2)])=X(:,[swaps(i,2),swaps(i,1)]);
end
