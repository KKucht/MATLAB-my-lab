clc
clear all
close all

A = rand(4,4);  % system Ax = b
b = rand(4,1);
x_ref = A\b;    % x reference 
[m, n] = size(A); 
L=eye(n); 
P=eye(n);       % permutation matrix
U=A;
   
for k=1:m-1
% find pivot
    U(k:m,k)
    abs(U(k:m,k))
   [ pivot ind] = max(abs(U(k:m,k)))
   ind = ind+k-1;
   
% interchange rows
   U([k,ind],k:m)=U([ind,k],k:m);
   L([k,ind],1:k-1)=L([ind,k],1:k-1);
   P([k,ind],:)=P([ind,k],:);
   
% standard LU
   for j=k+1:m
       L(j,k)=U(j,k)/U(k,k);
       U(j,k:m)=U(j,k:m)-L(j,k)*U(k,k:m);
   end
end
     
x = (U \ (L\(P * b)));  % LU after pivot, note the Permutation matrix
norm(x - x_ref)		    % error 