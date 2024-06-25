N =7;
Edges = sparse([1 1 2 2 2 3 3 3 4 4 5 5 6 6 7],[6 4 4 5 3 6 5 7 6 5 4 6 4 7 6],ones(15,1),N,N);
B = Edges';
d = 0.85;
I = speye(N);
b = (1 - d)*ones(N,1)/N;
L = 1:1:N;
V = 1./sum(B(:,L));
A = spdiags(V',0,N,N);
M = I - d*B*A;
r = M\b;
f0 = figure;
bar(r);
saveas(f0,'zad1.png');



